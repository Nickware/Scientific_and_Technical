#!/usr/bin/env bash

# ============================================================
# AUDITORIA
# Módulo 01: Inventario estructural
#
# Archivo: 01_inventario.sh
# Version: 0.1.0
# Autor: Nickware
# Lenguaje: Bash 4+
# ============================================================

set -Eeuo pipefail

# ------------------------------------------------------------
# 1. Configuración general
# ------------------------------------------------------------

VERSION="0.1.0"

REPOSITORY=""
OUTPUT_DIR=""

SCRIPT_NAME="$(basename "$0")"

# Directorios excluidos inicialmente

EXCLUDED_DIRS=(
    ".git"
    ".venv"
    "venv"
    "__pycache__"
    "node_modules"
    "build"
    "dist"
)

# Archivos temporales

TEMP_DIR=""

# ------------------------------------------------------------
# 2. Funciones de interfaz
# ------------------------------------------------------------

show_banner() {

    echo "============================================================"
    echo "             AUDITORIA - MODULO 01"
    echo "              INVENTARIO ESTRUCTURAL"
    echo "============================================================"
    echo

}

show_help() {

    cat << EOF

AUDITORIA - MODULO 01

Uso:

    ./${SCRIPT_NAME} --repository RUTA --output RUTA

Opciones:

    --repository RUTA    Repositorio que se desea inventariar.

    --output RUTA        Directorio donde se guardará el informe.

    --help               Muestra esta ayuda.

    --version            Muestra la versión del módulo.

Ejemplo:

    ./${SCRIPT_NAME} \\
        --repository ../../data_science/project_1 \\
        --output ../../auditoria/output/project_1

EOF

}

show_version() {

    echo "AUDITORIA - MODULO 01 - v${VERSION}"

}

# ------------------------------------------------------------
# 3. Procesamiento de argumentos
# ------------------------------------------------------------

parse_arguments() {

    while [[ $# -gt 0 ]]; do

        case "$1" in

            --repository)

                [[ $# -ge 2 ]] || {
                    echo "ERROR: Falta la ruta del repositorio."
                    exit 1
                }

                REPOSITORY="$2"
                shift 2
                ;;

            --output)

                [[ $# -ge 2 ]] || {
                    echo "ERROR: Falta la ruta de salida."
                    exit 1
                }

                OUTPUT_DIR="$2"
                shift 2
                ;;

            --help|-h)

                show_help
                exit 0
                ;;

            --version|-v)

                show_version
                exit 0
                ;;

            *)

                echo "ERROR: Argumento desconocido: $1"
                exit 1
                ;;

        esac

    done

}

# ------------------------------------------------------------
# 4. Validación de entradas
# ------------------------------------------------------------

validate_inputs() {

    if [[ -z "$REPOSITORY" ]]; then

        echo "ERROR: No se especificó el repositorio."
        exit 1

    fi

    if [[ -z "$OUTPUT_DIR" ]]; then

        echo "ERROR: No se especificó el directorio de salida."
        exit 1

    fi

    if [[ ! -d "$REPOSITORY" ]]; then

        echo "ERROR: El repositorio no existe."
        exit 1

    fi

    if [[ ! -r "$REPOSITORY" || ! -x "$REPOSITORY" ]]; then

        echo "ERROR: No hay permisos suficientes sobre el repositorio."
        exit 1

    fi

    REPOSITORY="$(cd "$REPOSITORY" && pwd -P)"

    mkdir -p "$OUTPUT_DIR"

    OUTPUT_DIR="$(cd "$OUTPUT_DIR" && pwd -P)"

    # Evitar escribir dentro del repositorio auditado

    if [[ "$OUTPUT_DIR" == "$REPOSITORY" ||
          "$OUTPUT_DIR" == "$REPOSITORY/"* ]]; then

        echo "ERROR: El directorio de salida no puede estar"
        echo "dentro del repositorio auditado."

        exit 1

    fi

}

# ------------------------------------------------------------
# 5. Preparación
# ------------------------------------------------------------

prepare_environment() {

    TEMP_DIR="$(mktemp -d)"

    trap 'rm -rf "$TEMP_DIR"' EXIT

    REPORT="${OUTPUT_DIR}/01_INVENTARIO.md"

    if [[ -e "$REPORT" ]]; then

        echo "ERROR: El informe ya existe:"
        echo "$REPORT"
        echo
        echo "Elimínelo o utilice otro directorio de salida."

        exit 1

    fi

}

# ------------------------------------------------------------
# 6. Funciones auxiliares
# ------------------------------------------------------------

# Escapar caracteres especiales de Markdown

escape_markdown() {

    local value="$1"

    value="${value//\\/\\\\}"
    value="${value//|/\\|}"
    value="${value//\`/\\\`}"

    value="${value//$'\n'/\\n}"
    value="${value//$'\r'/\\r}"

    printf '%s' "$value"

}

# Construir expresión de exclusión para find

build_find_expression() {

    local first=1

    printf '( -type d \\( '

    for dir in "${EXCLUDED_DIRS[@]}"; do

        if [[ $first -eq 0 ]]; then
            printf ' -o '
        fi

        printf -- '-name %q' "$dir"

        first=0

    done

    printf ' \\) -prune \\) -o '

}

# ------------------------------------------------------------
# 7. Inventario estructural
# ------------------------------------------------------------

collect_inventory() {

    echo "[M01] Recopilando información estructural..."

    local FIND_EXPRESSION

    FIND_EXPRESSION="$(build_find_expression)"

    # Archivos

    find "$REPOSITORY" \
        \( -type d \( \
            -name .git -o \
            -name .venv -o \
            -name venv -o \
            -name __pycache__ -o \
            -name node_modules -o \
            -name build -o \
            -name dist \
        \) -prune \) \
        -o -type f -print0 > "$TEMP_DIR/files"

    # Directorios

    find "$REPOSITORY" \
        \( -type d \( \
            -name .git -o \
            -name .venv -o \
            -name venv -o \
            -name __pycache__ -o \
            -name node_modules -o \
            -name build -o \
            -name dist \
        \) -prune \) \
        -o -mindepth 1 -type d -print0 > "$TEMP_DIR/directories"

    # Conteos

    TOTAL_FILES=0
    TOTAL_DIRS=0

    while IFS= read -r -d '' file; do
        ((TOTAL_FILES += 1))
    done < "$TEMP_DIR/files"

    while IFS= read -r -d '' dir; do
        ((TOTAL_DIRS += 1))
    done < "$TEMP_DIR/directories"

    # Archivos y extensiones

    declare -A EXTENSIONS=()

    while IFS= read -r -d '' file; do

        filename="$(basename "$file")"

        if [[ "$filename" == *.* && "$filename" != .* ]]; then

            extension="${filename##*.}"
            extension="${extension,,}"

        else

            extension="[sin extensión]"

        fi

        ((EXTENSIONS["$extension"]+=1))

    done < "$TEMP_DIR/files"

    # Guardar distribución ordenada

    for extension in "${!EXTENSIONS[@]}"; do

        printf "%s\t%s\n" \
            "$extension" \
            "${EXTENSIONS[$extension]}"

    done | sort -k2,2nr > "$TEMP_DIR/extensions"

}

# ------------------------------------------------------------
# 8. Identificación de documentación
# ------------------------------------------------------------

collect_documentation() {

    : > "$TEMP_DIR/documentation"

    while IFS= read -r -d '' file; do

        filename="$(basename "$file")"

        case "$filename" in

            README|README.*|readme|readme.*|\
            *.md|*.rst|*.txt|*.pdf)

                relative="${file#"$REPOSITORY"/}"

                printf '%s\0' "$relative" \
                    >> "$TEMP_DIR/documentation"

                ;;

        esac

    done < "$TEMP_DIR/files"

}

# ------------------------------------------------------------
# 9. Identificación de archivos de configuración
# ------------------------------------------------------------

collect_configuration() {

    : > "$TEMP_DIR/configuration"

    while IFS= read -r -d '' file; do

        filename="$(basename "$file")"

        case "$filename" in

            requirements.txt|\
            pyproject.toml|\
            setup.py|\
            setup.cfg|\
            environment.yml|\
            environment.yaml|\
            package.json|\
            package-lock.json|\
            Cargo.toml|\
            Makefile|\
            CMakeLists.txt|\
            Dockerfile|\
            docker-compose.yml|\
            docker-compose.yaml|\
            .gitignore|\
            .editorconfig)

                relative="${file#"$REPOSITORY"/}"

                printf '%s\0' "$relative" \
                    >> "$TEMP_DIR/configuration"

                ;;

        esac

    done < "$TEMP_DIR/files"

}

# ------------------------------------------------------------
# 10. Generación del árbol de directorios
# ------------------------------------------------------------

generate_tree() {

    : > "$TEMP_DIR/tree"

    printf '%s\n' "$(basename "$REPOSITORY")/" \
        >> "$TEMP_DIR/tree"

    while IFS= read -r -d '' dir; do

        relative="${dir#"$REPOSITORY"/}"

        depth="$(awk -F/ '{print NF}' <<< "$relative")"

        indent=""

        for ((i=1; i<depth; i++)); do
            indent+="    "
        done

        escaped="$(escape_markdown "$relative")"

        printf '%s%s/\n' "$indent" "$escaped" \
            >> "$TEMP_DIR/tree"

    done < "$TEMP_DIR/directories"

}

# ------------------------------------------------------------
# 11. Generación del informe
# ------------------------------------------------------------

generate_report() {

    echo "[M01] Generando informe Markdown..."

    local PROJECT_NAME

    PROJECT_NAME="$(basename "$REPOSITORY")"

    cat > "$REPORT" << EOF
# INVENTARIO DEL REPOSITORIO

## 1. Identificación

| Campo | Información |
|---|---|
| Proyecto | ${PROJECT_NAME} |
| Ruta | ${REPOSITORY} |
| Fecha | $(date '+%Y-%m-%d %H:%M:%S') |
| Módulo | 01_inventario.sh |
| Versión | ${VERSION} |

## 2. Resumen estructural

| Indicador | Cantidad |
|---|---:|
| Archivos | ${TOTAL_FILES} |
| Directorios | ${TOTAL_DIRS} |

## 3. Estructura de directorios

\`\`\`text
EOF

    cat "$TEMP_DIR/tree" >> "$REPORT"

    cat >> "$REPORT" << EOF
\`\`\`

## 4. Inventario de archivos

EOF

    while IFS= read -r -d '' file; do

        relative="${file#"$REPOSITORY"/}"

        escaped="$(escape_markdown "$relative")"

        printf -- '- `%s`\n' "$escaped" >> "$REPORT"

    done < "$TEMP_DIR/files"

    cat >> "$REPORT" << EOF

## 5. Distribución por extensiones

| Extensión | Cantidad |
|---|---:|
EOF

    while IFS=$'\t' read -r extension count; do

        printf '| `%s` | %s |\n' \
            "$extension" "$count" >> "$REPORT"

    done < "$TEMP_DIR/extensions"

    cat >> "$REPORT" << EOF

## 6. Documentación identificada

EOF

    if [[ ! -s "$TEMP_DIR/documentation" ]]; then

        echo "No se identificaron archivos de documentación." \
            >> "$REPORT"

    else

        while IFS= read -r -d '' file; do

            escaped="$(escape_markdown "$file")"

            printf -- '- `%s`\n' "$escaped" >> "$REPORT"

        done < "$TEMP_DIR/documentation"

    fi

    cat >> "$REPORT" << EOF

## 7. Archivos de configuración identificados

EOF

    if [[ ! -s "$TEMP_DIR/configuration" ]]; then

        echo "No se identificaron archivos de configuración." \
            >> "$REPORT"

    else

        while IFS= read -r -d '' file; do

            escaped="$(escape_markdown "$file")"

            printf -- '- `%s`\n' "$escaped" >> "$REPORT"

        done < "$TEMP_DIR/configuration"

    fi

    cat >> "$REPORT" << EOF

## 8. Directorios excluidos

EOF

    for dir in "${EXCLUDED_DIRS[@]}"; do

        printf -- '- `%s/`\n' "$dir" >> "$REPORT"

    done

    cat >> "$REPORT" << EOF

## 9. Observaciones

Este informe corresponde a un inventario estructural automatizado.

La identificación de archivos y extensiones no constituye una
evaluación de calidad del código.

La clasificación de lenguajes, dependencias y componentes será
desarrollada en módulos independientes.

Los archivos encontrados no han sido ejecutados ni modificados
por este módulo.

---

**AUDITORIA - MÓDULO 01 v${VERSION}**

EOF

}

# ------------------------------------------------------------
# 12. Finalización
# ------------------------------------------------------------

finish_module() {

    echo
    echo "============================================================"
    echo "           INVENTARIO COMPLETADO"
    echo "============================================================"

    echo
    echo "Proyecto: $REPOSITORY"
    echo "Archivos: $TOTAL_FILES"
    echo "Directorios: $TOTAL_DIRS"

    echo
    echo "Informe generado:"
    echo "$REPORT"

    echo
    echo "Estado: COMPLETADO"

}

# ------------------------------------------------------------
# 13. Programa principal
# ------------------------------------------------------------

main() {

    parse_arguments "$@"

    if [[ -z "$REPOSITORY" || -z "$OUTPUT_DIR" ]]; then
        show_help
        exit 1
    fi

    show_banner

    validate_inputs

    prepare_environment

    collect_inventory

    collect_documentation

    collect_configuration

    generate_tree

    generate_report

    finish_module

}

main "$@"
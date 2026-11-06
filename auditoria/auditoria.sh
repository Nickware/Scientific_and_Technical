
#!/usr/bin/env bash

# ============================================================
# AUDITORIA
# Herramienta modular para auditoria tecnica de repositorios
#
# Version: 0.2.0
# Autor: Nickware
# Lenguaje: Bash
# ============================================================

set -Eeuo pipefail

# ------------------------------------------------------------
# 1. Configuracion general
# ------------------------------------------------------------

VERSION="0.2.0"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

REPOSITORY=""
REPOSITORY_NAME=""
OUTPUT_DIR=""
SUMMARY_FILE=""

TIMESTAMP="$(date '+%Y-%m-%d_%H-%M-%S')"

INVENTORY_MODULE="${SCRIPT_DIR}/scripts/01_inventario.sh"
GIT_MODULE="${SCRIPT_DIR}/scripts/02_git.sh"

INVENTORY_VERSION="0.1.0"
GIT_VERSION="0.1.2"

INVENTORY_STATUS="PENDIENTE"
GIT_STATUS="PENDIENTE"

INVENTORY_EXIT_CODE="-"
GIT_EXIT_CODE="-"

INVENTORY_REPORT=""
GIT_REPORT=""

AUDIT_STATUS="PENDIENTE"
AUDIT_EXIT_CODE=0

# ------------------------------------------------------------
# 2. Funciones de interfaz
# ------------------------------------------------------------

show_banner() {

    echo "============================================================"
    echo "                    AUDITORIA v${VERSION}"
    echo "       Herramienta modular de auditoria de software"
    echo "============================================================"
    echo

}

show_help() {

    cat <<EOF

AUDITORIA v${VERSION}

Uso:

    ./auditoria.sh [OPCIONES] REPOSITORIO

Descripcion:

    Ejecuta los modulos de inventario y auditoria Git
    sobre el directorio indicado y genera un resumen.

Argumentos:

    REPOSITORIO        Directorio que se desea auditar.

Opciones:

    -o, --output RUTA  Directorio de resultados.
    -h, --help         Muestra esta ayuda.
    -v, --version      Muestra la version.

Ejemplo:

    ./auditoria.sh ../../data_science/project_1

    ./auditoria.sh ../../data_science/project_1 \\
        --output ./output/prueba_integracion

EOF

}

show_version() {
    echo "AUDITORIA v${VERSION}"
}

info() {
    echo "[INFO] $*"
}

error() {
    echo "[ERROR] $*" >&2
}

# ------------------------------------------------------------
# 3. Procesamiento de argumentos
# ------------------------------------------------------------

parse_arguments() {

    while [[ $# -gt 0 ]]; do

        case "$1" in

            -h|--help)
                show_help
                exit 0
                ;;

            -v|--version)
                show_version
                exit 0
                ;;

            -o|--output)

                if [[ $# -lt 2 || -z "$2" ]]; then
                    error "Falta la ruta de salida."
                    return 1
                fi

                OUTPUT_DIR="$2"
                shift 2
                ;;

            -*)
                error "Opcion desconocida: $1"
                return 1
                ;;

            *)

                if [[ -n "$REPOSITORY" ]]; then
                    error "Se indico mas de un repositorio."
                    return 1
                fi

                REPOSITORY="$1"
                shift
                ;;

        esac

    done

}

# ------------------------------------------------------------
# 4. Validacion del repositorio
# ------------------------------------------------------------

validate_repository() {

    if [[ -z "$REPOSITORY" ]]; then
        error "No se indico un repositorio."
        return 1
    fi

    if [[ ! -d "$REPOSITORY" ]]; then
        error "El directorio no existe: $REPOSITORY"
        return 1
    fi

    REPOSITORY="$(cd "$REPOSITORY" && pwd -P)"
    REPOSITORY_NAME="$(basename "$REPOSITORY")"

    if [[ ! -r "$REPOSITORY" || ! -x "$REPOSITORY" ]]; then
        error "No hay permisos suficientes para acceder al repositorio."
        return 1
    fi

}

# ------------------------------------------------------------
# 5. Configuracion
# ------------------------------------------------------------

load_configuration() {

    local config_file="${SCRIPT_DIR}/config/auditoria.conf"

    if [[ -f "$config_file" ]]; then
        info "Configuracion encontrada: $config_file"
        info "Su aplicacion automatica aun no esta implementada."
    else
        info "No se encontro auditoria.conf."
        info "Se utilizara la configuracion predeterminada."
    fi

}

# ------------------------------------------------------------
# 6. Preparacion del directorio de salida
# ------------------------------------------------------------

prepare_output() {

    if [[ -z "$OUTPUT_DIR" ]]; then
        OUTPUT_DIR="${SCRIPT_DIR}/output/${REPOSITORY_NAME}_${TIMESTAMP}"
    fi

    # Canonicalizar la ruta, incluso si todavia no existe.

    OUTPUT_DIR="$(realpath -m -- "$OUTPUT_DIR")"

    # No crear resultados dentro del directorio auditado.

    if [[ "$OUTPUT_DIR" == "$REPOSITORY" ||
          "$OUTPUT_DIR" == "$REPOSITORY/"* ]]; then

        error "La salida no puede estar dentro del repositorio auditado."
        return 1
    fi

    # Proteger tambien la raiz Git cuando el directorio
    # auditado es un subdirectorio de un repositorio mayor.

    local git_root=""

    if command -v git >/dev/null 2>&1; then

        git_root="$(
            git -C "$REPOSITORY" rev-parse --show-toplevel 2>/dev/null
        )" || git_root=""

        if [[ -n "$git_root" ]]; then

            git_root="$(cd "$git_root" && pwd -P)"

            if [[ "$OUTPUT_DIR" == "$git_root" ||
                  "$OUTPUT_DIR" == "$git_root/"* ]]; then

                error "La salida no puede estar dentro de la raiz Git."
                return 1
            fi

        fi

    fi

    # No sobrescribir resultados existentes.

    if [[ -e "$OUTPUT_DIR" ]]; then

        if [[ ! -d "$OUTPUT_DIR" ]]; then
            error "La ruta de salida existe y no es un directorio."
            return 1
        fi

        if [[ -n "$(
            find "$OUTPUT_DIR" -mindepth 1 -maxdepth 1 -print -quit
        )" ]]; then

            error "El directorio de salida no esta vacio: $OUTPUT_DIR"
            return 1
        fi

    fi

    mkdir -p -- "$OUTPUT_DIR"

    OUTPUT_DIR="$(cd "$OUTPUT_DIR" && pwd -P)"
    SUMMARY_FILE="${OUTPUT_DIR}/00_RESUMEN_GENERAL.md"

    info "Directorio de salida: $OUTPUT_DIR"

}

# ------------------------------------------------------------
# 7. Ejecucion individual de modulos
# ------------------------------------------------------------

# Cada modulo recibe un directorio de salida vacio.
#
# Si termina correctamente, su informe se mueve al
# directorio principal de resultados.
#
# La funcion devuelve:
#   0: modulo ejecutado y reporte recuperado
#   1: modulo ausente o fallo en preparacion
#   N: codigo de error del modulo
#   4: no se genero el informe esperado

execute_module() {

    local module_path="$1"
    local report_name="$2"
    local module_label="$3"

    local staging_dir=""
    local module_exit=0

    echo
    info "Ejecutando: $module_label"

    if [[ ! -f "$module_path" ]]; then
        error "Modulo no encontrado: $module_path"
        return 1
    fi

    staging_dir="$(mktemp -d "${OUTPUT_DIR}/.modulo_XXXXXX")" || {
        error "No se pudo preparar el directorio temporal."
        return 1
    }

    if bash "$module_path" \
        --repository "$REPOSITORY" \
        --output "$staging_dir"; then

        module_exit=0

    else

        module_exit=$?

        error "$module_label finalizo con codigo $module_exit"
        return "$module_exit"

    fi

    if [[ ! -f "${staging_dir}/${report_name}" ]]; then

        error "$module_label no genero el informe esperado."
        return 4

    fi

    if ! mv -- \
        "${staging_dir}/${report_name}" \
        "${OUTPUT_DIR}/${report_name}"; then

        error "No se pudo trasladar el informe de $module_label."
        return 4

    fi

    # Eliminar el directorio temporal solamente si esta vacio.
    # Si contiene otros archivos, conservarlo para inspeccion.

    rmdir -- "$staging_dir" 2>/dev/null || {
        info "Se conservaron archivos auxiliares en $staging_dir"
    }

    info "$module_label completado."
    return 0

}

# ------------------------------------------------------------
# 8. Ejecucion de modulos
# ------------------------------------------------------------

run_modules() {

    local result=0

    echo
    echo "FASE DE ANALISIS"
    echo "------------------------------------------------------------"

    # Modulo 01: Inventario

    if execute_module \
        "$INVENTORY_MODULE" \
        "01_INVENTARIO.md" \
        "01 - Inventario"; then

        INVENTORY_STATUS="COMPLETADO"
        INVENTORY_EXIT_CODE=0
        INVENTORY_REPORT="01_INVENTARIO.md"

    else

        result=$?

        INVENTORY_STATUS="ERROR"
        INVENTORY_EXIT_CODE="$result"

    fi

    # Modulo 02: Git

    if execute_module \
        "$GIT_MODULE" \
        "02_AUDITORIA_GIT.md" \
        "02 - Auditoria Git"; then

        GIT_STATUS="COMPLETADO"
        GIT_EXIT_CODE=0
        GIT_REPORT="02_AUDITORIA_GIT.md"

    else

        result=$?

        GIT_STATUS="ERROR"
        GIT_EXIT_CODE="$result"

    fi

}

# ------------------------------------------------------------
# 9. Consolidacion de resultados
# ------------------------------------------------------------

collect_results() {

    if [[ "$INVENTORY_STATUS" == "COMPLETADO" &&
          "$GIT_STATUS" == "COMPLETADO" ]]; then

        AUDIT_STATUS="COMPLETADA"
        AUDIT_EXIT_CODE=0

    else

        AUDIT_STATUS="PARCIAL / CON ERRORES"
        AUDIT_EXIT_CODE=2

    fi

}

# ------------------------------------------------------------
# 10. Generacion del resumen general
# ------------------------------------------------------------

generate_summary() {

    local inventory_link="No generado"
    local git_link="No generado"

    if [[ -n "$INVENTORY_REPORT" ]]; then
        inventory_link="[01_INVENTARIO.md](01_INVENTARIO.md)"
    fi

    if [[ -n "$GIT_REPORT" ]]; then
        git_link="[02_AUDITORIA_GIT.md](02_AUDITORIA_GIT.md)"
    fi

    cat > "$SUMMARY_FILE" <<EOF
# RESUMEN GENERAL DE AUDITORIA

## 1. Identificacion

| Campo | Informacion |
|---|---|
| Proyecto | ${REPOSITORY_NAME} |
| Ruta examinada | ${REPOSITORY} |
| Fecha de ejecucion | $(date '+%Y-%m-%d %H:%M:%S') |
| Version de auditoria | ${VERSION} |
| Estado general | ${AUDIT_STATUS} |

## 2. Objetivo

Ejecutar una auditoria tecnica inicial del proyecto,
recopilando evidencia estructural y de control de versiones.

## 3. Alcance

Esta version ejecuta dos modulos independientes:

- Inventario de archivos y directorios.
- Analisis del control de versiones Git.

La auditoria Git puede abarcar un repositorio mayor
que el directorio solicitado.

No se ejecuta codigo del proyecto auditado.

## 4. Estado de los modulos

| Modulo | Version prevista | Estado | Codigo de salida |
|---|---|---|---:|
| 01 - Inventario | ${INVENTORY_VERSION} | ${INVENTORY_STATUS} | ${INVENTORY_EXIT_CODE} |
| 02 - Auditoria Git | ${GIT_VERSION} | ${GIT_STATUS} | ${GIT_EXIT_CODE} |
| 03 - Lenguajes | - | NO IMPLEMENTADO | - |
| 04 - Dependencias | - | NO IMPLEMENTADO | - |
| 05 - Documentacion | - | NO IMPLEMENTADO | - |
| 06 - Pruebas | - | NO IMPLEMENTADO | - |
| 07 - Metricas | - | NO IMPLEMENTADO | - |

## 5. Informes generados

| Informe | Archivo |
|---|---|
| Inventario | ${inventory_link} |
| Auditoria Git | ${git_link} |

## 6. Observaciones y limitaciones

- Los modulos se ejecutan independientemente.
- El fallo de un modulo no impide intentar ejecutar el siguiente.
- Los resultados se generan fuera del repositorio auditado.
- No se realizan modificaciones deliberadas al proyecto auditado.
- Los informes describen evidencia, no certifican calidad de software.
- Las versiones de los modulos se registran segun la configuracion del orquestador.

## 7. Resultado final

**Estado:** ${AUDIT_STATUS}

**Codigo de salida del orquestador:** ${AUDIT_EXIT_CODE}

---

**AUDITORIA v${VERSION}**
EOF

    info "Resumen generado: $SUMMARY_FILE"

}

# ------------------------------------------------------------
# 11. Finalizacion
# ------------------------------------------------------------

finish_audit() {

    echo
    echo "============================================================"
    echo "             RESULTADO DE LA AUDITORIA"
    echo "============================================================"

    echo
    echo "Proyecto: $REPOSITORY_NAME"
    echo "Repositorio: $REPOSITORY"
    echo "Resultados: $OUTPUT_DIR"

    echo
    echo "Inventario: $INVENTORY_STATUS"
    echo "Git:        $GIT_STATUS"

    echo
    echo "Estado general: $AUDIT_STATUS"
    echo "Resumen: $SUMMARY_FILE"

    echo
    echo "AUDITORIA v${VERSION}"
    echo

    return "$AUDIT_EXIT_CODE"

}

# ------------------------------------------------------------
# 12. Programa principal
# ------------------------------------------------------------

main() {

    parse_arguments "$@" || return 1

    show_banner

    validate_repository || return 1

    load_configuration

    prepare_output || return 1

    run_modules

    collect_results

    generate_summary

    finish_audit

}

main "$@"

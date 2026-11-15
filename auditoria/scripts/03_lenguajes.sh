
#!/usr/bin/env bash

# ============================================================
# AUDITORIA - MODULO 03
# IDENTIFICACION Y DISTRIBUCION DE LENGUAJES
# Version: 0.1.0
# Especificacion: EF-003
# ============================================================

set -Eeuo pipefail

VERSION="0.1.0"
MODULE_NAME="03_lenguajes.sh"
REPORT_NAME="03_LENGUAJES.md"

REPOSITORY=""
OUTPUT_DIR=""
TEMP_DIR=""

TOTAL_FILES=0
CLASSIFIED_FILES=0
UNKNOWN_FILES=0
AMBIGUOUS_FILES=0
EXTENSIONLESS_FILES=0

declare -A LANGUAGE_COUNTS=()
declare -A TECHNOLOGY_COUNTS=()
declare -A AMBIGUOUS_COUNTS=()
declare -A UNKNOWN_COUNTS=()

# ------------------------------------------------------------
# 1. Interfaz
# ------------------------------------------------------------

show_usage() {
    cat <<EOF
Uso:
  $MODULE_NAME --repository RUTA --output RUTA

Opciones:
  --repository   Directorio del proyecto que se auditara.
  --output       Directorio donde se generara el informe.
  -h, --help     Mostrar esta ayuda.
EOF
}

parse_arguments() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --repository)
                [[ $# -ge 2 ]] || {
                    echo "[ERROR] Falta la ruta del repositorio."
                    return 1
                }
                REPOSITORY="$2"
                shift 2
                ;;
            --output)
                [[ $# -ge 2 ]] || {
                    echo "[ERROR] Falta la ruta de salida."
                    return 1
                }
                OUTPUT_DIR="$2"
                shift 2
                ;;
            -h|--help)
                show_usage
                exit 0
                ;;
            *)
                echo "[ERROR] Argumento desconocido: $1"
                return 1
                ;;
        esac
    done

    [[ -n "$REPOSITORY" && -n "$OUTPUT_DIR" ]] || {
        echo "[ERROR] Debe indicar --repository y --output."
        return 1
    }
}

# ------------------------------------------------------------
# 2. Validacion
# ------------------------------------------------------------

validate_repository() {
    if [[ ! -d "$REPOSITORY" ]]; then
        echo "[ERROR] El repositorio no es un directorio valido."
        return 1
    fi

    REPOSITORY="$(realpath -e "$REPOSITORY")"

    echo "[INFO] Repositorio identificado: $REPOSITORY"
}

validate_output() {
    local repo_root
    local output_path
    local git_root=""

    repo_root="$REPOSITORY"
    output_path="$(realpath -m "$OUTPUT_DIR")"

    if git -C "$REPOSITORY" rev-parse --show-toplevel \
        >/dev/null 2>&1; then
        git_root="$(git -C "$REPOSITORY" rev-parse --show-toplevel)"
    fi

    if [[ "$output_path" == "$repo_root" ||
          "$output_path" == "$repo_root/"* ]]; then
        echo "[ERROR] La salida no puede estar dentro del repositorio."
        return 2
    fi

    if [[ -n "$git_root" &&
          ( "$output_path" == "$git_root" ||
            "$output_path" == "$git_root/"* ) ]]; then
        echo "[ERROR] La salida no puede estar dentro de la raiz Git."
        return 2
    fi

    if [[ -e "$output_path" && ! -d "$output_path" ]]; then
        echo "[ERROR] La ruta de salida no es un directorio."
        return 1
    fi

    if [[ -d "$output_path" ]] &&
       [[ -n "$(find "$output_path" -mindepth 1 -maxdepth 1 -print -quit)" ]]; then
        echo "[ERROR] El directorio de salida no esta vacio."
        return 1
    fi

    OUTPUT_DIR="$output_path"
}

prepare_environment() {
    mkdir -p "$OUTPUT_DIR"

    TEMP_DIR="$(mktemp -d)"

    trap 'rm -rf -- "$TEMP_DIR"' EXIT
}

# ------------------------------------------------------------
# 3. Catalogo de extensiones
# ------------------------------------------------------------

classify_extension() {
    local extension="$1"

    case "$extension" in

        # Lenguajes

        py|pyw|pyi)
            echo "LANGUAGE:Python"
            ;;

        c)
            echo "LANGUAGE:C"
            ;;

        cpp|cc|cxx|hpp|hh|hxx)
            echo "LANGUAGE:C++"
            ;;

        cu|cuh)
            echo "LANGUAGE:CUDA"
            ;;

        f|for|f90|f95|f03|f08)
            echo "LANGUAGE:Fortran"
            ;;

        r)
            echo "LANGUAGE:R"
            ;;

        java)
            echo "LANGUAGE:Java"
            ;;

        js|jsx|mjs|cjs)
            echo "LANGUAGE:JavaScript"
            ;;

        ts|tsx|mts|cts)
            echo "LANGUAGE:TypeScript"
            ;;

        jl)
            echo "LANGUAGE:Julia"
            ;;

        go)
            echo "LANGUAGE:Go"
            ;;

        rs)
            echo "LANGUAGE:Rust"
            ;;

        cs)
            echo "LANGUAGE:C#"
            ;;

        php)
            echo "LANGUAGE:PHP"
            ;;

        rb)
            echo "LANGUAGE:Ruby"
            ;;

        sh|bash|zsh)
            echo "LANGUAGE:Shell"
            ;;

        sql)
            echo "LANGUAGE:SQL"
            ;;

        swift)
            echo "LANGUAGE:Swift"
            ;;

        kt|kts)
            echo "LANGUAGE:Kotlin"
            ;;

        lua)
            echo "LANGUAGE:Lua"
            ;;

        pl|pm)
            echo "LANGUAGE:Perl"
            ;;

        # Extensiones ambiguas

        m|h)
            echo "AMBIGUOUS:$extension"
            ;;

        # Formatos tecnologicos

        ipynb)
            echo "TECHNOLOGY:Notebook Jupyter"
            ;;

        tex|bib)
            echo "TECHNOLOGY:LaTeX"
            ;;

        html|htm)
            echo "TECHNOLOGY:HTML"
            ;;

        css|scss|sass|less)
            echo "TECHNOLOGY:CSS"
            ;;

        md|markdown)
            echo "TECHNOLOGY:Markdown"
            ;;

        xml)
            echo "TECHNOLOGY:XML"
            ;;

        json)
            echo "TECHNOLOGY:JSON"
            ;;

        yaml|yml)
            echo "TECHNOLOGY:YAML"
            ;;

        toml)
            echo "TECHNOLOGY:TOML"
            ;;

        txt)
            echo "TECHNOLOGY:Texto"
            ;;

        *)
            echo "UNKNOWN:$extension"
            ;;
    esac
}

# ------------------------------------------------------------
# 4. Recoleccion y clasificacion
# ------------------------------------------------------------

collect_inventory() {
    local file
    local filename
    local extension
    local classification
    local category
    local name

    echo "[M03] Analizando archivos..."

    find "$REPOSITORY" -type d \
        \( \
            -name .git -o \
            -name .venv -o \
            -name venv -o \
            -name __pycache__ -o \
            -name node_modules -o \
            -name build -o \
            -name dist \
        \) -prune -o \
        -type f -print0 > "$TEMP_DIR/files"

    while IFS= read -r -d '' file; do

        ((TOTAL_FILES += 1))

        filename="${file##*/}"

        if [[ "$filename" != *.* || "$filename" == .* && "$filename" != *.*.* ]]; then
            ((EXTENSIONLESS_FILES += 1))
            continue
        fi

        extension="${filename##*.}"
        extension="${extension,,}"

        classification="$(classify_extension "$extension")"

        category="${classification%%:*}"
        name="${classification#*:}"

        case "$category" in

            LANGUAGE)
                LANGUAGE_COUNTS["$name"]=$(( ${LANGUAGE_COUNTS["$name"]:-0} + 1 ))
                ((CLASSIFIED_FILES += 1))
                ;;

            TECHNOLOGY)
                TECHNOLOGY_COUNTS["$name"]=$(( ${TECHNOLOGY_COUNTS["$name"]:-0} + 1 ))
                ((CLASSIFIED_FILES += 1))
                ;;

            AMBIGUOUS)
                AMBIGUOUS_COUNTS["$name"]=$(( ${AMBIGUOUS_COUNTS["$name"]:-0} + 1 ))
                ((AMBIGUOUS_FILES += 1))
                ;;

            UNKNOWN)
                UNKNOWN_COUNTS["$name"]=$(( ${UNKNOWN_COUNTS["$name"]:-0} + 1 ))
                ((UNKNOWN_FILES += 1))
                ;;
        esac

    done < "$TEMP_DIR/files"
}

# ------------------------------------------------------------
# 5. Generacion de informe
# ------------------------------------------------------------

percentage() {
    local count="$1"
    local denominator="$2"

    if (( denominator == 0 )); then
        printf "0.00"
    else
        awk -v n="$count" -v d="$denominator" \
            'BEGIN { printf "%.2f", (n/d)*100 }'
    fi
}

write_distribution() {
    local title="$1"
    local denominator="$2"
    local array_name="$3"

    local key
    local count
    local pct

    printf '\n## %s\n\n' "$title" >> "$REPORT_FILE"

    printf '| Categoria | Archivos | Porcentaje |\n' >> "$REPORT_FILE"
    printf '|---|---:|---:|\n' >> "$REPORT_FILE"

    case "$array_name" in
        LANGUAGE)
            for key in "${!LANGUAGE_COUNTS[@]}"; do
                count="${LANGUAGE_COUNTS[$key]}"
                pct="$(percentage "$count" "$denominator")"
                printf '| %s | %s | %s%% |\n' "$key" "$count" "$pct" >> "$REPORT_FILE"
            done
            ;;
        TECHNOLOGY)
            for key in "${!TECHNOLOGY_COUNTS[@]}"; do
                count="${TECHNOLOGY_COUNTS[$key]}"
                pct="$(percentage "$count" "$denominator")"
                printf '| %s | %s | %s%% |\n' "$key" "$count" "$pct" >> "$REPORT_FILE"
            done
            ;;
    esac
}

generate_report() {
    local language_total=0
    local technology_total=0
    local key

    REPORT_FILE="$OUTPUT_DIR/$REPORT_NAME"

    for key in "${!LANGUAGE_COUNTS[@]}"; do
        ((language_total += LANGUAGE_COUNTS[$key]))
    done

    for key in "${!TECHNOLOGY_COUNTS[@]}"; do
        ((technology_total += TECHNOLOGY_COUNTS[$key]))
    done

    {
        echo "# Identificacion y distribucion de lenguajes"
        echo
        echo "## 1. Identificacion del proyecto"
        echo
        echo "| Campo | Resultado |"
        echo "|---|---|"
        echo "| Proyecto | $(basename "$REPOSITORY") |"
        echo "| Ruta examinada | $REPOSITORY |"
        echo "| Fecha de auditoria | $(date '+%Y-%m-%d %H:%M:%S') |"
        echo "| Version del modulo | $VERSION |"
        echo
        echo "## 2. Alcance"
        echo
        echo "La clasificacion se realiza exclusivamente mediante extensiones."
        echo "No se ejecuta ni analiza el contenido de los archivos."
        echo
        echo "## 3. Resumen general"
        echo
        echo "| Indicador | Cantidad |"
        echo "|---|---:|"
        echo "| Archivos examinados | $TOTAL_FILES |"
        echo "| Archivos clasificados | $CLASSIFIED_FILES |"
        echo "| Archivos sin extension | $EXTENSIONLESS_FILES |"
        echo "| Extensiones ambiguas | $AMBIGUOUS_FILES |"
        echo "| Extensiones desconocidas | $UNKNOWN_FILES |"
        echo
    } > "$REPORT_FILE"

    write_distribution \
        "4. Distribucion de lenguajes" \
        "$language_total" LANGUAGE LANGUAGE

    write_distribution \
        "5. Distribucion tecnologica" \
        "$technology_total" TECHNOLOGY TECHNOLOGY

    {
        echo
        echo "## 6. Extensiones ambiguas"
        echo
        echo "| Extension | Archivos |"
        echo "|---|---:|"
    } >> "$REPORT_FILE"

    for key in "${!AMBIGUOUS_COUNTS[@]}"; do
        printf '| .%s | %s |\n' "$key" "${AMBIGUOUS_COUNTS[$key]}" >> "$REPORT_FILE"
    done

    {
        echo
        echo "## 7. Extensiones desconocidas"
        echo
        echo "| Extension | Archivos |"
        echo "|---|---:|"
    } >> "$REPORT_FILE"

    for key in "${!UNKNOWN_COUNTS[@]}"; do
        printf '| .%s | %s |\n' "$key" "${UNKNOWN_COUNTS[$key]}" >> "$REPORT_FILE"
    done

    {
        echo
        echo "## 8. Observaciones y limitaciones"
        echo
        echo "- La clasificacion se basa en extensiones."
        echo "- Las extensiones ambiguas no se asignan arbitrariamente."
        echo "- Los archivos desconocidos no se consideran lenguajes identificados."
        echo "- Los archivos sin extension se contabilizan separadamente."
        echo "- No se ejecutaron archivos del repositorio."
        echo
        echo "## 9. Trazabilidad"
        echo
        echo "| Campo | Resultado |"
        echo "|---|---|"
        echo "| Modulo | $MODULE_NAME |"
        echo "| Version | $VERSION |"
        echo "| Resultado | Ejecucion satisfactoria |"
    } >> "$REPORT_FILE"

    echo "[M03] Informe generado: $REPORT_FILE"
}

# ------------------------------------------------------------
# 6. Programa principal
# ------------------------------------------------------------

main() {

    echo "============================================================"
    echo "             AUDITORIA - MODULO 03"
    echo "          IDENTIFICACION DE LENGUAJES"
    echo "============================================================"

    parse_arguments "$@"
    validate_repository
    validate_output
    prepare_environment

    collect_inventory
    generate_report

    echo
    echo "============================================================"
    echo "          ANALISIS DE LENGUAJES COMPLETADO"
    echo "============================================================"

    echo "Proyecto: $REPOSITORY"
    echo "Archivos examinados: $TOTAL_FILES"
    echo "Archivos clasificados: $CLASSIFIED_FILES"
    echo "Informe: $REPORT_FILE"
}

main "$@"

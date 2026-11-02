#!/usr/bin/env bash

# ============================================================
# Proyecto: auditoria
# Modulo:   02_git.sh
# Version:  0.1.1
# Funcion:  Auditoria del control de versiones Git
# ============================================================

set -Eeuo pipefail

VERSION="0.1.1"

# ------------------------------------------------------------
# Variables globales
# ------------------------------------------------------------

REPOSITORY=""
OUTPUT_DIR=""

REPORT_NAME="02_AUDITORIA_GIT.md"

REPOSITORY_ROOT=""
REPOSITORY_NAME=""

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

TEMP_FILE=""

HEAD_EXISTS=false
BRANCH="No disponible"
HEAD_STATE="No disponible"

LAST_COMMIT="No disponible"
LAST_COMMIT_SHORT="No disponible"
LAST_AUTHOR="No disponible"
LAST_DATE="No disponible"
LAST_MESSAGE="No disponible"

TOTAL_COMMITS=0
FIRST_COMMIT_DATE="No disponible"

RECENT_HISTORY=""
REMOTE_INFORMATION=""

# Contadores de cambios

STAGED=0
UNSTAGED=0
UNTRACKED=0
DELETED=0
RENAMED=0
CONFLICTS=0

# ------------------------------------------------------------
# Funciones generales
# ------------------------------------------------------------

show_help() {

    cat <<EOF

Modulo 02 - Auditoria Git

Version: $VERSION

Uso:

  bash scripts/02_git.sh --repository RUTA --output DIRECTORIO

Argumentos:

  --repository    Ruta del proyecto que se desea auditar.
  --output        Directorio donde se generara el informe.
  --help          Muestra esta ayuda.
  --version       Muestra la version del modulo.

Ejemplo:

  bash scripts/02_git.sh \\
      --repository ../../data_science/project_1 \\
      --output ./output/prueba_git

EOF

}

show_version() {

    echo "02_git.sh version $VERSION"

}

error() {

    echo "[ERROR] $*" >&2

}

info() {

    echo "[INFO] $*"

}

# ------------------------------------------------------------
# Limpieza
# ------------------------------------------------------------

cleanup() {

    if [[ -n "$TEMP_FILE" && -f "$TEMP_FILE" ]]; then
        rm -f -- "$TEMP_FILE"
    fi

}

trap cleanup EXIT

# ------------------------------------------------------------
# Lectura de argumentos
# ------------------------------------------------------------

parse_arguments() {

    while [[ $# -gt 0 ]]; do

        case "$1" in

            --repository)

                [[ $# -ge 2 ]] || {
                    error "Falta la ruta del repositorio."
                    return 1
                }

                REPOSITORY="$2"
                shift 2
                ;;

            --output)

                [[ $# -ge 2 ]] || {
                    error "Falta el directorio de salida."
                    return 1
                }

                OUTPUT_DIR="$2"
                shift 2
                ;;

            --help)

                show_help
                exit 0
                ;;

            --version)

                show_version
                exit 0
                ;;

            *)

                error "Argumento desconocido: $1"
                return 1
                ;;

        esac

    done

    if [[ -z "$REPOSITORY" || -z "$OUTPUT_DIR" ]]; then

        error "Debe especificar --repository y --output."
        return 1

    fi

}

# ------------------------------------------------------------
# Validacion del entorno
# ------------------------------------------------------------

validate_environment() {

    if ! command -v git >/dev/null 2>&1; then

        error "Git no esta instalado o no esta disponible."
        return 3

    fi

    if [[ ! -d "$REPOSITORY" ]]; then

        error "El directorio del repositorio no existe."
        return 2

    fi

    REPOSITORY=$(realpath "$REPOSITORY")

    REPOSITORY_NAME=$(basename "$REPOSITORY")

    return 0

}

# ------------------------------------------------------------
# Identificacion del repositorio Git
# ------------------------------------------------------------

identify_repository() {

    local is_bare

    REPOSITORY_ROOT=""

    # Primero se comprueba si es un repositorio bare.

    if is_bare=$(
        git -C "$REPOSITORY" rev-parse --is-bare-repository 2>/dev/null
    ); then

        if [[ "$is_bare" == "true" ]]; then
            return 2
        fi

    fi

    # Posteriormente se comprueba si existe un arbol de trabajo.

    if ! git -C "$REPOSITORY" rev-parse --is-inside-work-tree \
        >/dev/null 2>&1; then

        return 1

    fi

    REPOSITORY_ROOT=$(
        git -C "$REPOSITORY" rev-parse --show-toplevel
    )

    REPOSITORY_ROOT=$(realpath "$REPOSITORY_ROOT")

    return 0

}

# ------------------------------------------------------------
# Preparacion del directorio de salida
# ------------------------------------------------------------

prepare_output() {

    local output_parent

    output_parent=$(dirname "$OUTPUT_DIR")

    # Resolver la ruta sin crearla.

    OUTPUT_DIR=$(realpath -m "$OUTPUT_DIR")

    # Impedir que la salida quede dentro del repositorio.

    local protected_root

    if [[ -n "$REPOSITORY_ROOT" ]]; then
        protected_root="$REPOSITORY_ROOT"
    else
        protected_root="$REPOSITORY"
    fi

    case "$OUTPUT_DIR/" in

        "$protected_root/"*)

            error "El directorio de salida no puede estar dentro del repositorio."
            return 2
            ;;

    esac

    # Comprobar que el directorio no contenga resultados anteriores.

    if [[ -d "$OUTPUT_DIR" ]]; then

        if [[ -n "$(find "$OUTPUT_DIR" -mindepth 1 -maxdepth 1 -print -quit)" ]]; then

            error "El directorio de salida no esta vacio."
            return 2

        fi

    fi

    # Crear el directorio solamente despues de las validaciones.

    mkdir -p "$OUTPUT_DIR" || {

        error "No se pudo crear el directorio de salida."
        return 2

    }

    return 0

}

# ------------------------------------------------------------
# Informacion de HEAD
# ------------------------------------------------------------

get_head_information() {

    if git -C "$REPOSITORY" rev-parse --verify HEAD \
        >/dev/null 2>&1; then

        HEAD_EXISTS=true

        LAST_COMMIT=$(
            git -C "$REPOSITORY" log -1 --format='%H'
        )

        LAST_COMMIT_SHORT=$(
            git -C "$REPOSITORY" log -1 --format='%h'
        )

        LAST_AUTHOR=$(
            git -C "$REPOSITORY" log -1 --format='%an'
        )

        LAST_DATE=$(
            git -C "$REPOSITORY" log -1 --format='%cI'
        )

        LAST_MESSAGE=$(
            git -C "$REPOSITORY" log -1 --format='%s'
        )

        TOTAL_COMMITS=$(
            git -C "$REPOSITORY" rev-list --count HEAD
        )

        # Obtener la fecha del primer commit alcanzable desde HEAD.
        # Primero se invierte el historial y luego se extrae
        # la primera fecha disponible.

        FIRST_COMMIT_DATE=$(
            git -C "$REPOSITORY" log \
                --format='%cI' \
                --reverse |
                sed -n '1p'
        )

        BRANCH=$(
            git -C "$REPOSITORY" branch --show-current
        )

        if [[ -z "$BRANCH" ]]; then

            HEAD_STATE="Detached HEAD"

        else

            HEAD_STATE="Rama activa"

        fi

    else

        HEAD_EXISTS=false

        BRANCH="No disponible"
        HEAD_STATE="Sin commits"

        LAST_COMMIT="No disponible"
        LAST_COMMIT_SHORT="No disponible"
        LAST_AUTHOR="No disponible"
        LAST_DATE="No disponible"
        LAST_MESSAGE="No disponible"

        TOTAL_COMMITS=0
        FIRST_COMMIT_DATE="No disponible"

    fi

}

# ------------------------------------------------------------
# Estado del repositorio
# ------------------------------------------------------------

get_repository_status() {

    TEMP_FILE=$(mktemp)

    if ! git -C "$REPOSITORY" \
        -c core.quotepath=false \
        status --porcelain=v1 -z --untracked-files=all \
        > "$TEMP_FILE"; then

        error "No fue posible obtener el estado del repositorio."
        return 4

    fi

    while IFS= read -r -d '' entry; do

        local index_status
        local worktree_status

        index_status="${entry:0:1}"
        worktree_status="${entry:1:1}"

        # Archivos sin seguimiento.

        if [[ "$index_status" == "?" ]]; then

            ((UNTRACKED+=1))
            continue

        fi

        # Cambios preparados.

        if [[ "$index_status" != " " ]]; then
            ((STAGED+=1))
        fi

        # Cambios no preparados.

        if [[ "$worktree_status" != " " ]]; then
            ((UNSTAGED+=1))
        fi

        # Archivos eliminados.

        if [[ "$index_status" == "D" || "$worktree_status" == "D" ]]; then
            ((DELETED+=1))
        fi

        # Renombrados o copiados.

        if [[ "$index_status" == "R" || "$worktree_status" == "R" ||
              "$index_status" == "C" || "$worktree_status" == "C" ]]; then

            ((RENAMED+=1))

        fi

        # Conflictos de integracion.

        if [[ "$index_status" == "U" || "$worktree_status" == "U" ||
              "$index_status$worktree_status" == "AA" ||
              "$index_status$worktree_status" == "DD" ]]; then

            ((CONFLICTS+=1))

        fi

        # Git utiliza una segunda entrada NUL para informar
        # la ruta original de renombres y copias.

        if [[ "$index_status" == "R" || "$index_status" == "C" ||
              "$worktree_status" == "R" || "$worktree_status" == "C" ]]; then

            IFS= read -r -d '' ignored_path || true

        fi

    done < "$TEMP_FILE"

    return 0

}

# ------------------------------------------------------------
# Actividad historica
# ------------------------------------------------------------

get_recent_history() {

    if [[ "$HEAD_EXISTS" == true ]]; then

        RECENT_HISTORY=$(
            git -C "$REPOSITORY" log -10 \
                --pretty=format:'| %h | %cI | %an | %s |%n'
        )

    else

        RECENT_HISTORY="Sin historial disponible."

    fi

}

# ------------------------------------------------------------
# Repositorios remotos
# ------------------------------------------------------------

get_remote_information() {

    REMOTE_INFORMATION=""

    local remote_name
    local remote_url
    local sanitized_url

    while IFS= read -r remote_name; do

        [[ -z "$remote_name" ]] && continue

        remote_url=$(
            git -C "$REPOSITORY" remote get-url "$remote_name"
        )

        # Eliminar credenciales de URLs HTTPS.
        # Eliminar query strings y fragmentos potencialmente sensibles.

        sanitized_url=$(
            printf '%s' "$remote_url" |
                sed -E \
                    -e 's#(https?://)[^/@]+@#\1#' \
                    -e 's/[?#].*$//'
        )

        REMOTE_INFORMATION+="| $remote_name | $sanitized_url |"$'\n'

    done < <(git -C "$REPOSITORY" remote)

}

# ------------------------------------------------------------
# Generacion del informe
# ------------------------------------------------------------

generate_report() {

    local report_file="$OUTPUT_DIR/$REPORT_NAME"

    local repository_state

    if (( STAGED == 0 && UNSTAGED == 0 &&
          UNTRACKED == 0 && CONFLICTS == 0 )); then

        repository_state="Limpio"

    else

        repository_state="Presenta cambios pendientes"

    fi

    cat > "$report_file" <<EOF
# Auditoria Git

## 1. Identificacion del proyecto

| Campo | Resultado |
|---|---|
| Proyecto | $REPOSITORY_NAME |
| Ruta examinada | $REPOSITORY |
| Raiz del repositorio | $REPOSITORY_ROOT |
| Fecha de auditoria | $TIMESTAMP |
| Version del modulo | $VERSION |

## 2. Alcance del repositorio

La auditoria se realiza sobre el repositorio Git identificado
en la ruta raiz indicada anteriormente.

El directorio solicitado para la auditoria puede ser un
subdirectorio del repositorio.

En ese caso, la informacion historica y el estado general
corresponden al repositorio completo, no exclusivamente
al subdirectorio examinado.

**Ruta del directorio solicitado:** $REPOSITORY

**Raiz del repositorio Git:** $REPOSITORY_ROOT

## 3. Informacion general

| Campo | Resultado |
|---|---|
| Repositorio Git | Si |
| Rama actual | $BRANCH |
| Estado de HEAD | $HEAD_STATE |
| Estado general | $repository_state |

## 4. Trazabilidad

| Campo | Resultado |
|---|---|
| Ultimo commit | $LAST_COMMIT |
| Hash abreviado | $LAST_COMMIT_SHORT |
| Autor | $LAST_AUTHOR |
| Fecha del committer | $LAST_DATE |
| Mensaje | $LAST_MESSAGE |
| Total de commits alcanzables desde HEAD | $TOTAL_COMMITS |
| Fecha del primer commit alcanzable desde HEAD | $FIRST_COMMIT_DATE |

## 5. Actividad historica

Se presentan los ultimos diez commits disponibles.

Las fechas corresponden a la fecha del committer.

| Hash | Fecha | Autor | Mensaje |
|---|---|---|---|
EOF

    printf '%s\n' "$RECENT_HISTORY" >> "$report_file"

    cat >> "$report_file" <<EOF

## 6. Estado de los cambios

| Tipo de cambio | Cantidad |
|---|---:|
| Staged | $STAGED |
| Unstaged | $UNSTAGED |
| Untracked | $UNTRACKED |
| Deleted | $DELETED |
| Renamed / Copied | $RENAMED |
| Conflicts | $CONFLICTS |

### Interpretacion

EOF

    if (( STAGED == 0 && UNSTAGED == 0 &&
          UNTRACKED == 0 && CONFLICTS == 0 )); then

        echo "No se identificaron cambios locales pendientes." \
            >> "$report_file"

    else

        echo "El repositorio presenta cambios locales pendientes de revision." \
            >> "$report_file"

    fi

    cat >> "$report_file" <<EOF

## 7. Repositorios remotos

| Nombre | Direccion |
|---|---|
EOF

    if [[ -n "$REMOTE_INFORMATION" ]]; then

        printf '%s' "$REMOTE_INFORMATION" >> "$report_file"

    else

        echo "| No disponibles | No existen repositorios remotos configurados. |" \
            >> "$report_file"

    fi

    cat >> "$report_file" <<EOF

## 8. Observaciones y limitaciones

- La auditoria utiliza informacion local del repositorio.
- No se realizaron conexiones a repositorios remotos.
- No se ejecutaron operaciones de escritura de Git.
- La informacion de sincronizacion con remotos puede estar desactualizada.
- El numero de commits no constituye por si solo una medida de calidad.
- La actividad historica no permite determinar automaticamente la calidad del desarrollo.
- El historial contabilizado corresponde a los commits alcanzables desde HEAD.
- Los cambios locales corresponden al repositorio completo.

## 9. Trazabilidad de la auditoria

| Campo | Resultado |
|---|---|
| Modulo | 02_git.sh |
| Version | $VERSION |
| Fecha de ejecucion | $TIMESTAMP |
| Resultado | Ejecucion satisfactoria |

EOF

    info "Informe generado: $report_file"

}

# ------------------------------------------------------------
# Informe para directorios sin Git
# ------------------------------------------------------------

generate_non_git_report() {

    cat > "$OUTPUT_DIR/$REPORT_NAME" <<EOF
# Auditoria Git

## 1. Identificacion del proyecto

| Campo | Resultado |
|---|---|
| Proyecto | $REPOSITORY_NAME |
| Ruta examinada | $REPOSITORY |
| Fecha de auditoria | $TIMESTAMP |
| Version del modulo | $VERSION |

## 2. Resultado

**Estado: NO VERSIONADO**

No se identifico un repositorio Git en la ruta examinada.

## 3. Informacion no disponible

No fue posible obtener:

- Rama activa.
- Historial de commits.
- Estado de cambios.
- Repositorios remotos.

## 4. Observaciones

La ausencia de Git no constituye un error de ejecucion del modulo.

## 5. Trazabilidad

| Campo | Resultado |
|---|---|
| Modulo | 02_git.sh |
| Version | $VERSION |
| Resultado | Ejecucion satisfactoria |

EOF

    info "Se genero un informe de ausencia de Git."

}

# ------------------------------------------------------------
# Funcion principal
# ------------------------------------------------------------

main() {

    parse_arguments "$@" || return $?

    validate_environment || return $?

    # Identificar Git antes de preparar la salida.
    # Esto permite proteger la raiz real del repositorio.

    if identify_repository; then

        info "Repositorio Git identificado."

    else

        local identification_status=$?

        if [[ "$identification_status" -eq 1 ]]; then

            info "El directorio no contiene un repositorio Git."

            prepare_output || return $?

            generate_non_git_report

            return 0

        elif [[ "$identification_status" -eq 2 ]]; then

            error "Se identifico un repositorio bare."
            error "Los repositorios bare estan fuera del alcance de esta version."

            return 4

        else

            error "No fue posible identificar el repositorio."
            return 4

        fi

    fi

    prepare_output || return $?

    info "Iniciando auditoria Git..."

    get_head_information

    get_repository_status || return $?

    get_recent_history

    get_remote_information

    generate_report

    info "Auditoria Git finalizada."

    return 0

}

main "$@"
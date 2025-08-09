#!/usr/bin/env bash
# Author: NTorres 
# Date: 20 Jul 2025
# Version: 0.3

function ejemplo_zona_horaria() {
    echo "Zona horaria es: America/Bogota"
    export TZ=America/Bogota
    date
    echo "Zona horaria es: Asia/Tokio"
    export TZ=Asia/Tokyo
    date
    unset TZ
    echo
}

function ejemplo_parametros_posicionales() {
    echo "Total número de parámetros son: $#"
    echo "Nombre del archivo: $0"
    echo "Primer argumento: $1"
    echo "Segundo argumento: $2"
    echo "Tercer argumento: $3"
    echo "Todos los argumentos: $*"
    echo
}

function ejemplo_fecha_set() {
    echo "La fecha es: $(date)"
    set $(date)
    echo "El mes es: $3"
    echo
}

function ejemplo_shift() {
    echo "Todos los argumentos: $*"
    if (( $# >= 1 )); then
        shift
        echo "Después de shift, el primer argumento es: $1"
    fi
    if (( $# >= 2 )); then
        shift
        echo "Después de otro shift, el primer argumento es: $1"
    fi
    if (( $# >= 2 )); then
        shift 2
        echo "Después de shift 2, el primer argumento es: $1 (si existe)"
    fi
    echo
}

function ejemplo_array() {
    frutas=(aguacate banano manzana)
    echo "Array completo: ${frutas[*]}"
    echo "Primer fruta: ${frutas[0]}"
    echo "Segundo fruta: ${frutas[1]}"
    echo "Tercer fruta: ${frutas[2]}"
    echo
}

function ejemplo_heredoc() {
    cat << QUIT
Nombre archivo: $0
Primer argumento: $1
Segundo argumento: $2
QUIT
    echo
}

while true; do
    clear
    echo "============================"
    echo "   Ejemplos Interactivos"
    echo "============================"
    echo "Seleccione un ejemplo:"
    echo "1) Cambiar y mostrar zona horaria (date, TZ)"
    echo "2) Mostrar parámetros posicionales (\$#, \$0, \$1, \$*)"
    echo "3) Extraer partes de la fecha (set, date)"
    echo "4) Manipular argumentos con shift"
    echo "5) Uso de arrays en Bash"
    echo "6) Here-Document (cat <<)"
    echo "0) Salir"
    read -p "Opción: " opcion

    case $opcion in
        1) ejemplo_zona_horaria ;;
        2) ejemplo_parametros_posicionales "$@" ;;
        3) ejemplo_fecha_set ;;
        4) ejemplo_shift "$@" ;;
        5) ejemplo_array ;;
        6) ejemplo_heredoc "$@" ;;
        0) echo "¡Hasta luego!"; exit 0 ;;
        *) echo "Opción inválida. Intente de nuevo." ;;
    esac

    read -p "Presiona Enter para continuar..."
done


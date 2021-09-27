#!/usr/bin/bash.exe
#Author: Santiago Criollo Bermudez
#Date: 27/09/2021
#Title: Clase de Variables

# Ejemplo 1


# Ejemplo 2
echo "Total numero de parametros son $#"
echo "Nombre del archivo: $0"
echo "Primer parametro: $1"
echo "Segundo parametro: $2"
echo "Tercer parametro: $3"
echo "Todos los parametros: $*"

# Ejemplo 3
echo "La fecha es: $(date)"
set $(date)
echo El mes es: $4
exit 0

# Ejemplo 4 "Pasar argumentos d euna posición a otra"
echo "$*" #todos los argumentos
echo "Shift, en la primera posición: "
shift
# echo "Shift, en la primera posición: "
echo "$1"
shift
echo "shift, en la segunda posicion"
shift 2

# Ejemplo 5
frutas=(banano manzana fresa) #Un arreglo
echo ${frutas[*]} #Tomar todos los arreglos
echo ${frutas[0]} #Tomar solo un arreglo


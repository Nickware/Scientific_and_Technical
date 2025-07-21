#!/usr/bin/bash.exe
#Author: Juan Sebastian Manrique Moreno


# Variables - constantes

# Ejemplo 1

# export TZ=America/Bogota
# echo "Su zona horaria es: $TZ"
# date
# export TZ=Asia/Tokyo
# echo "Su zona horaria es: $TZ"
# date
# unset TZ

# Ejemplo 2

# echo "La cantidad de parámetros de su archivo son: $#"
# echo "El nombre de su archivo es: $0"
# echo "El primer parámetro es: $1"
# echo "El segundo parámetro es: $2"
# echo "El tercer parámetro es: $3"
# echo "Todos los parámetros son: $*"

# Ejemplo 3

# echo "La fecha es: $(date)"
# echo "El mes es: $3"
# exit 0

# Ejemplo 4

# echo "Todos los argumentos: "
# echo "$*"
# echo "Shift, en la primera posición"
# shift
# echo "$1"
# echo "Shift, en la segunda posición"
# shift 2

# Ejemplo 5

# Python - Octave- Matlab - Julia - R - C, C++ - Java
frutas=(aguacate banano manzana)
echo ${frutas[*]}
echo ${frutas[0]}
# Arreglos en bash

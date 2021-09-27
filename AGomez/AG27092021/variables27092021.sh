#!/usr/bin/bash 
#Author: Andres Gomez


# Variables - constantes - array

export TZ=America/Bogota
echo "Su zona horaria es: $TZ"
date 
export TZ=Asia/Tokyo
echo "Su zona horaria es: $TZ"
date
unset TZ

# Ejemplo 2

echo "Total de numero de parametros son: $#"
echo "Nombre del archivo $0"
echo "Primer parámetro: $1"
echo "Segundo parámetro: $2"
echo "Tercer parámetro: $3"
echo "Todos los parámetros: $*"

#Ejemplo 3

echo "La fecha es: $(date)"
set $(date)
echo El dia de la semana es: $1
echo El mes es: $2
echo El dia del mes es: $3
echo La hora es: $4
echo El año es: $6
exit 0

#Ejemplo 4

echo "Todos los argumentos: "
echo "$*"
echo "Shift, en la primera posición: "
shift
#echo "Shift en la segunda posición: "
echo "$1"
shift
echo "Shift en la segunda posición: "
shift 2

#Ejemplo 5

#python - octave -matlab -julia - R
# C, C++, java
frutas=(mango banano manzana)
echo ${frutas[*]}
echo ${frutas[0]}
#arreglo=(x y z)
#!/usr/bin/bash
#author: STalero

#variables constantes array
export TZ=America/Bogota
echo "Zona Horaria es: $TZ"
date
export TZ=Asia/Tokyo
echo "Zona Horaria es: $TZ"
date
unset TZ

# ejemplo 2
echo "Total número de parámetros son: $#"
echo "Nombre del archivo: $0"
echo "Primer parámetro: $1"
echo "Segundo parámetro: $2"
echo "Tercer parámetro: $3"
echo "Todos los parámetros: $*"
exit 0

#ejemplo 3
echo "La fecha es $(date)"
set $(date)
echo El mes es: $2
exit 0

# ejemplo 4
echo "Todos los argumentos"
echo "$*"
echo "Shift, en la primera posicion: "
shift 
echo "$1"
shift
echo "Shift, en la segunda posición: "
shift 2
echo "Shift, en la segunda posición: $2"

#ejemplo 5

#python - octave - matlab - julia
#c - c++ - java
frutas=(mango banano manzana)
echo ${frutas[*]}
echo ${frutas[0]}
# arreglo=(x y z)
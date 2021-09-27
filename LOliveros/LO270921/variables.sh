#! /usr/bin/bash.exe
#author: Laura Oliveros
#data: 27/09/21
#version: 0.0.1

# variables - constantes - array

# Ejemplo 1
# export TZ=America/Bogota
# echo "Zona horaria es: $TZ"
# date
# export TZ=Asia/Tokyo
# echo "Zona horaria es: $TZ"
# date
# unset TZ 

# Ejemplo 2
# echo "Total numero de parametros son: $#"
# echo "Nombre del archivo: $0"
# echo "Primer parametro: $1"
# echo "Segundo parametro: $2"
# echo "Tercer parametro: $3"
# echo "Todo los parametros: $*"

# Ejemplo 3
# echo "La fecha es: $(date)"
# set $(date)
# echo El mes es: $3
# exit 0

# Ejemplo 4
# echo "Todos los argumentos "
# echo "$*"
# echo "Shift, en la primera posicion"
# Shift
# echo 1
# Shift 
# echo "Shift, en la segunda posicion"
# Shift 2
# echo "Mejorar ejemplo 4"

# Ejemplo 5

# python - octave - matlab - julia - R 
# c, c++, java
# frutas=(aguacate banano manzana)
# echo ${frutas[*]}
# echo ${frutas[0]}

# arreglo=(x y z)
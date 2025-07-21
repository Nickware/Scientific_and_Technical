#!/usr/bin/bash.exe 
#Author: Julian Aros
# Date: 27 de septiembre
#version: 1.2


#variables-constantes

# export TZ=America/Bogota
# echo "Zona horaria es: $TZ"
# date 
# export TZ=Asia/Tokyo
# echo "Zona horaria es: $TZ"
# date 
# unset TZ

#definir variables

#example 2

# echo "Total numero de parametros son: $#"
# echo "Nombre del archivo $0"
# echo "Primer parametro $1"
# echo "Segundo parametro $2"
# echo "Tercer parametro $3"
# echo "Todos los parametros $*"

#example 3

# echo "La Fecha es: $(date)"
# set $(date)
# echo El mes es: $3
# exit 0

#example 4

# echo "Todos los arguments: "
# echo "$*"

# echo "Shifh, en la primera posicion: "
# shift
# #echo "Shifh, en la segunda desicion: "----
# echo "$1"
# shift
# echo "Shifh, en la segunda posicion: "
# shift 2



#example 5

frutas=(aguacate banano manzana)
#echo ${[*]}
echo ${frutas[1]}

#>> enviar
#<<< recibir
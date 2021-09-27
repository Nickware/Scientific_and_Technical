#!/usr/bin/bash
#Title: variables-constantes-array
#Author: JAristizabal
#Date: 27-09-21
#Version: 0.0.1

#Ejemplo 1

#export TZ=America/Bogota
#echo "Zona horaria es: $TZ "
#date

#export TZ=Asia/Tokyo
#echo "Zona horaria es: $TZ"
#date
#unset TZ

#Ejemplo 2
#echo "Total número de parámetros son: $#"
#echo "Nombre del archivo: $0"
#echo "Primer parámetro: $1" #Acá con 1 llamamos el primer parámetro
#echo "Segundo parámetro: $2"
#echo "Tercer parámetro: $3"
#echo "Todos los parámetros: $*"

#ejemplo 3
#echo "La fecha es $(date)"
#set $(date)
#echo "El mes es: $3"
#exit 0 #Forma general de terminar el script

#Ejemplo 4
#echo "Todos los argumentos: "
#echo "$*"
#echo "shift, en la primera posición: "
#shift
#echo "shift, en la segunda posición: "
#echo "$1"
#shift
#echo "shift, en la segunda posición: "
#shift 2

#Ejemplo 5

frutas=(aguacate banano manzana)
echo ${frutas[*]}
echo ${frutas[0]} #Acá con 0 llamamos el primer elemento

exit 0

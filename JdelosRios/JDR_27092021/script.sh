#!/usr/bin/bash
#author:juan
#variables -constantes-array
export TZ=America/Bogota
echo "Zona horaria es: $TZ"
date
export TZ=Asia/Tokyo
echo "Zona horaria es: $TZ"
date
unset TZ #Borrar variab
#2
echo "Total numero de parametros son $#:"
echo "primer parametro: $1"
echo "segundo parametro: $2"
echo "tercer parametro: $3"
echo "Todos los parametros: $*" #.* tod-archivos
#3
echo "La fecha es $(date)"
set $(date)
echo "el dia es $1"
echo "El mes es $3"
echo "El año es $4"
echo "La hora es $5"
exit 0
#4
echo "Todos los argumentos
echo "$*"
echo "Shift, en la primera posicion:"
shift
#echo "Shift, en la segunda posicion"
echo "$1"
shift
echo "Shift, en la segunda posicion: $2"
shift 2
#5
$frutas=(manzana lulo pera)
echo ${frutas[*]}
echo ${frutas[2]}
#plano ¿? xd

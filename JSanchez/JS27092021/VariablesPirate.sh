#!/usr/bin/bash
#author: Juan Sánchez
#user: JuanCelPirata

# VARIABLES

#export  TZ=America/Bogota
#echo "Zona Horaria es: $TZ"
#date
#export TZ=Asia/Tokyo
#echo "Zona horario es: $TZ"
#data
#unset TZ

#Ejemplo 2

echo "Total número de parametros son: $#"
echo "Nombre del archivo: $0"
echo "Primer Parametro: $1"
echo "segundo parametro: $2"
echo "tercer parametro: $3"
echo "todos los parametros: $*"

#Ejemplo 3

echo "la fecha es: $(date)"
set $(date)
echo "El mes es $3"
exit 0

#Ejemplo 4

echo "Todos los argumentos"
echo "$*"
echo "Shif, en la primera posición:"
shift
echo  "shift, en la segunda posición"
echo "$1"
shift
echo "shift, en la segunda posición"
shift 2
# python - octave -matlab -julia - R
#Ejemplo 5
frutas=(aguacate banano manzana)
echo ${frutas [*]}
echo ${frutas [0]}
# arreglo=(x y z)


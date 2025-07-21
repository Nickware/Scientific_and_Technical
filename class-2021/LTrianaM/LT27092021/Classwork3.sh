# /usr/bin/bash.exe
# Author: Laura Triana
# Date: 23/09/20210

# EJEMPLO 1
# export TZ=America/Bogota
# echo "Tu zona horaria es: $TZ"
# date
# export TZ=Asia/Tokyo
# echo "Tu zona horaria es: $TZ"
# date


# EJEMPLO 2
# echo "Total número de parámetros son: $#"
# echo "Nombre del archivo: $0"
# echo "Primer parámetro: $1"
# echo "Segundo parámetro: $2"
# echo "Todos los parámetros: $*"

# ¿Cómo comentar en bloque? ctrl k - ctrl c
# Cargar parámetros: bash Classwork3.sh Bogota Medellin Bucaramanga 

echo "................................................................."


# EJEMPLO 3 (no lo entendí)
# echo "La fecha es $(date)"
# set $(date)
# echo "El mes es: $4"
# exit 0  #Etiqueta de finalización

# EJEMPLO 4
# echo "Todos los argumentos:"
# echo "$*"
# echo "Shift, en la primera posición:"
# shift
# echo "$1"
# shift
# echo "Shift, en la segunda posición:"
# shift 2
# echo "Shift, en la segunda posición: $2"

# EJEMPLO 5
# python - octave - matlab - julia -R
frutas=(kiwi pera fresa) #Defino arreglo de variables
#echo ${frutas [*]}
echo ${frutas [0]}
#arreglo=(x y z)

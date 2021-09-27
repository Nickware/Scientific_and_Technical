#!/usr/bin/bash
#author: NTorres
# Examples

# variables - constante - array
# ejemplo 1 
#export TZ=America/Bogota
#echo "Zona horaria es: $TZ"
#date
#export TZ=Asia/Tokio
#echo "Zona horario es: $TZ"
#date
#unset TZ

# ejemplo 2
#echo "Total numero de parametros son: $#"
#echo "Nombre del archivo: $0"
#echo "Primer parametro: $1"
#echo "Segundo parametro: $2"
#echo "Tercero parametro: $3"
#echo "Todos los parametros: $*"

# ejemplo 3
# echo "La fecha es: $(date)"
# set $(date)
# echo El mes es: $3
# exit 0

# ejemplo 4

# echo "Todos los argumentos: "
# echo "$*"
# echo "Shift, en la primera posición: "
# shift
# #echo "Shift, en la segunda posición: "
# echo "$1"
# shift
# echo "Shift, en la segunda posición: "
# shift 2

# ejemplo 5

# python - octave - matlab - julia - R
# c, c++, java
frutas=(aguacate banano manzana)
#echo ${frutas[*]}
#echo ${frutas[0]}
# arreglo=(x y z)
 # >> ENVIAR
 # <<< RECIBIR

 cat << QUIT
 Nombre archivo $0
Primer argumento: $1
Segundo argunto: $2
QUIT


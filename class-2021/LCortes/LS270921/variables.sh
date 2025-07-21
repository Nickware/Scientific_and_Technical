#/usr/bin/bash.exe
#titulo:variables
#autor: Laura Sofia Cortes

#variables - constantes - array

# #fecha-date
# export TZ=America/Bogota          #esportar variables
# echo "Zona hararia es: $TZ"          #llamar
# date                              #fecha
# export TZ=Asia/Tokyo            #redefinir
# echo "Zona horaria es: $TZ"
# date
# unset TZ                            #remover variables

# #ejemplo
# #
# echo "total numero de parametros son: $#"
# echo "Nombre del archivo: $0"
# echo "Primer parametro: $1"
# echo "Segundo parametro: $2"
# echo "Tercer parametro: $3"
# echo "Todos los parametros: $*"

# #ejemplo3
# echo "La fecha es: $(date)"
# set $(date)                     #establecer
# echo "El mes es: $2"            #muestra el parametro 3
# #ex : Mon Sep 27 11:30:33 -05 2021
#      # 1   2  3      4     5    6
# exit 0            #buen final de programacion en srcipt

# #ejemplo 4
# echo "Todos los argumentos"
# echo "$*"
# echo "shift, el la primera posicion: "
# shift
# #echo "shift, el la segunda posicion: "
# echo "$1"
# shift
# echo "shift, el la segunda posicion: "
# shift 2

# #elemplo 5
# #python octave matlab julia R c c++ java
# #llamar varias variables
# frutas=(mango banano manzana)
# echo ${frutas[*]}
# echo ${frutas[0]} 
# echo ${frutas[1]} 
# echo ${frutas[2]} 
# #arreglo=(x y z)
# echo frutas=[mora]
# echo ${frutas[*]} 
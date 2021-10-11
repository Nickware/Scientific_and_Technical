#!/bin/bash/
#autor: Manuel Marroquin
#fecha 27/09/2021

#Variables- contanres- array

# export TZ=America/Bogota
# echo "Su zona horaria es: $TZ"
# date #fecha
# export TZ=Asia/Tokyo #redefinir variables
# Echo "Su zona horaria es: $TZ"
# date
# unset TZ #borra variables
#set y unset para establecer y desestablecer
#crtl k + ctrl c para convertir las lienas seleccionadasd en comentarios


#parametros
# echo "Número total de parametros: $#"
# echo "Nombre del archivo: $0" 
# echo "Primer parametro: $1"
# echo "Segundo parametro: $2"
# echo "Tercer parametro: $3"
# echo "Todos los parametros: $*" #*= todos los archivos


#Ejemplo 3
# echo "La fecha es $(date)"
# set $(date)
# echo el mes es $2
# exit 0 #terminacion de un script


#ejemplo 4
# echo "Todos los argumentos: "
# echo $*
# echo "Shift, en la primera posición: "
# echo "$1"
# shift # ubicarme 
# echo "Shift, en la segunda posición: "
# echo "$2"
# shift


#ejemplo5
frutas=(Mango Banano Manzana) #los array se definen en parentesis
echo ${frutas[*]}
echo ${frutas[0]} #el contador comienza en 0
#Arreglo=(x y z)
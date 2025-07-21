#!/bin/bash 
#Author María Moreno 
#Date 21-09-27
#Version 1.0.0

#Utilizar variables, constantes, array

export TZ=America/Bogota #----> Exporta una funcion 
echo " Zona horaria $TZ"
date #---> funcion de bash para saber la fecha 
export TZ=Asia/Tokyo
echo "Zona horaria es: $TZ"
date 
unset TZ #---> Remover variable 
Para declarar parametos
echo " Total numero de parametros: $#"
echo " Nombre del archivo $0" #---> Nombre del script (int)
echo " Primer parámetro $1" #---> Primer parametro. 
echo " Segundo parameto $2" #---> Segundo parametro dentro del script
echo " Todos los parametros:  $*" #---> Arroja todos los parametros
    ¿Cómo lograr hacer una exclusion ---> pq |?
#Ejemplo #3
echo " La fecha es $(date)" #---> Asgino un parametro a una funcion previa. 
set $(date)#---> Tue Sep 28 01:31:12 JST 2021, en ese orfe de ideas se debe asignar sep a la varible 2 (contar desde 1)
echo "El mes es $2"
exit 0 #---> Etiqueta de finalización, si o si debe terminar el programa con exito. 
    #Cuál es la diferencia ente exit0 y exit1 ?


#Ejemplo 4:
echo "Todos los argumentos (arg= parametros de ingreso)"
echo "Todos los argumentos :"
echo "$*"
echo "Shift, en la orimera posicion:"
shift
echo "$1"
shift
echo "Shift, en la segunda posción "
shift 2
echo "Shift, en la segunda posción $2 "
#Ejemplo 5
frutas=(banano manzana aguacate) #---> Los arrays en bash se definen en parentesis. 
echo ${frutas[*]} #---> Para llamar un array 
echo ${frutas[0]} #--->Para traer las posiciones 





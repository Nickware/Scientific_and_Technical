#!/bin/bash
#Pablo Patiño
#Variables
#0.0.1

#Ejemplo 1: "Array" 
# export TZ=America/Bogota #definir
# echo "Zona horaria: $TZ" #self expl
# unset TZ #desvincular

# #e.g. 2 parámetros
# echo "Total # de parámetros $#"
# echo "1er parámetro: $1"
# echo "2do parámetro: $2"
# echo "todos los parámetros: $*" #* es todos, se usa bastante
# echo "nombre archivo $0"
# #se ingresan los parámetros usando bash [.sh] [par1] [par2] [...] [parn]. Segúramente con read se pueda también.

# # e.g 3
# echo "fecha: $(date)"
# set $(date)
# echo "mes: &3" #tercer parámetro
# exit 0 #dice donde termina el programa

#e.g 4 

# echo "Todos los argumentos: " #shift como variable, parece ser
# echo "$*"
# echo "Shift, Có-Cómo?:"
# shift 
# echo "$1"
# shift
# echo "Shift, 2nd:"
# shift 2

#e.g 5
frutas=(mango banano) #array en paréntesis, (par1 par2 ... parn)
#echo ${frutas[*]} en otros lenguajes creo
echo ${frutas[1]} #elige alguno de los dos [0] ∨ [1] ∨ ... ∨ [n]  
# arreglo (x y) siendo (x y z ... n)


#!/bin/bash
#Numeros Capicua 
#Author: David Santiago Agudelo Villamizar
#Date: 11/10/2021
#version: 0.0.1

#TOMA DE INFORMACION

    clear
    #limpiamos pantalla
    echo
    echo  "El siguiente programa determina si el numero introducido es capicua o no."
    echo
    echo
    echo "Introduzca un numero:  "
    read  numero 
    echo 
    clear
    echo
    echo "Su numero es $numero"
    
    echo
    
  valor=$( echo $numero | rev) #asignamos una variable a la operacion de reversa
 
if [[ $valor = $numero ]]; then # creamos un if para determinar si esos dos valores son iguales 
        echo
         echo "El numero es Capicua."
         echo
         echo
        
     else # el else para saber que si esa regla no se cumple, de otro resultado
     echo
        echo "El numero no es Capicua."
        echo 
        echo 
 fi

exit 0
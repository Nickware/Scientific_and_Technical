#!/bin/bash
#numero al reves
#Author: David Santiago Agudelo Villamizar
#Date: 14/10/2021
#version: 0.0.1


#TOMA DE INFORMACION

    clear
    #limpiamos pantalla
    echo
    echo -e "\t\t▓————————————————————————————————————————————————————————————————————————▓"
    echo -e "\t\t▓    El siguiente programa imprimirá el numero que usted de al reves     ▓"
    echo -e "\t\t▓————————————————————————————————————————————————————————————————————————▓"
    
    sleep 5
    clear
    echo
    read -p "Introduzca un numero por favor:  " numero
    echo 
    clear
    echo 
    echo
    echo "Su numero es $numero"
    echo 
    echo 
    
  valor=$( echo $numero | rev)              #asignamos una variable a la operacion de reversa
    echo "El numero al reves es:  $valor "
    echo
    echo
    echo 
    echo 
    read -n 1 -s -r -p "                    Presione una tecla para continuar" respuesta   
    echo 
    clear  
    echo 
    echo
    echo -e "\t\t\tGracias por usar nuestro programa, tenga un buen dia."
    sleep 3 
    exit 0
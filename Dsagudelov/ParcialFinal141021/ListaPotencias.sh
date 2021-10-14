#!/bin/bash
#Formas imprimir numeros potencia
#Author: David Santiago Agudelo Villamizar
#Date: 14/10/2021
#version: 0.0.1



#defino variables necesarias
contador=0
numero=0
contadorcubo=0
#creo un titulo
clear
echo 
echo -e "\t\t\t\t▓———————————————————▓"
echo -e "\t\t\t\t▓     Potencias     ▓"
echo -e "\t\t\t\t▓———————————————————▓"
echo 
sleep 2
# genero la parte de arriba de la tabla e imagen
echo -e "\t╔════════╗\t╔══════════╗\t╔═══════╗\t╔═══════════════════════╗"
echo -e "\t║ Numero ║ \t║ Cuadrado ║\t║ Cubo\t║\t║\tCuarta\t\t║"
#creo el bucle para que lo haga hasta 20 
while [ $numero -lt 21 ]; do
#hago las respectivas ecuaciones para cada uno de los resultados deseados
contador=$(($numero*$numero))
contadorcubo=$(($numero*$numero*$numero))
contadorcuarta=$(($numero*$numero*$numero*$numero))
#separacion entre ecuaciones verticales
echo -e "\t║════════║\t║══════════║\t║═══════║\t║═══════════════════════║"
#imprimo el resultado
echo -e "\t║  $numero\t ║\t║  $contador\t   ║\t║ $contadorcubo\t║\t║\t $contadorcuarta\t\t║"
numero=$(($numero+1))
done
#estetica de final de cuadro
echo -e "\t╚════════╝\t╚══════════╝\t╚═══════╝\t╚═══════════════════════╝"
echo 
echo
read -n 1 -s -r -p "                    Presione una tecla para cerrar" respuesta  
clear 
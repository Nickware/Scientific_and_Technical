#!/usr/bin/bash 
#Author A Moreno 
#Date 23 sep 2021
#Version 0.1

#Calcular tarea 

#calculadora >>valor 
#Definir variable Pi 
pi=$(echo "scale=10; 4*a(1)" | bc -l)
echo "Programa q calcula volumen de cilindro"
#Entradas por teclado 
echo -e "Ingrese el radio en m"
read radio
echo -e "Ingrese altura en m "
read h 

#Modeloación para calcular areas "cilindro"
Afigcilbase=$(echo "$pi *$radio *$radio" |bc -l) #En el lugar de b se puede utilizar otro 
VfigCil=$(echo "$Afigcilbase*$h" |bc -l)
        #Modelo físico. ---> cualquir tipo de modelo. describe la fenomenología matemática
        #Condiciones. Restricción. 
echo " El cilindro  con altura $h y radio $radio tiene un volumen: "
echo " $VfigCil"
echo "la constante $pi"
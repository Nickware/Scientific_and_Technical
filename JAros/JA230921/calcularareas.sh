#!/usr/bin/bash.exe 
#Author: Julian Aros
# Date: 23 de septiembre
#version: 1.2


#Calculo de areas

#Calculadora >> pasar valores
#Definir variable pi
#Concepto de variable
#Parametro

pi=$(echo "scale=100; 4*a(1)" | bc -l) #La scale es igual al numero de cifras significativas del volumen del cilindro


#Interacción con el usuario
echo "Programa que calcula el volumen de un cilindro"
echo "Las unidades estan dadas de acuerdo al SI"
echo -e "Ingrese el radio: "
read radio
echo -e "Ingrese la altura: "
read altura

#Modelo matemático

baseArea=$(echo "$pi * $radio * $radio" | bc -l)
cilindroVolumen=$(echo "$baseArea * $altura" | bc -l)

echo "Usted ingreso como parametro de radio: $radio"

echo "Usted ingreso como parametro de altura: $altura"
echo "El volumen del cilindro con los datos ingresado es: $cilindroVolumen"


#Modelo físico
#Caida libre
#Mecanica fluidos
#Matriz
#Quimica
#
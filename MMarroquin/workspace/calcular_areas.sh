#!/bin/bash
#autor: Manuel Marroquin
#fecha 23/09/2021

#calculadora de áreas 

#calculadora >> valor
#definir variable. pi

pi=$(echo "scale=5 ; 4*a(1)" | bc -l)

echo "programa para calcular el volumen de un cilindro"
echo "unidades según el SI"
echo -e "ingrese el radio: "
read radio
echo -e "ingrese la altura: "
read altura

#modelo matematico 
baseArea=$(echo "$pi * $radio * $radio " | bc -l)
cilindroVolumen=$(echo "$baseArea * $altura" | bc -l)

echo "el radio ingresado es: $radio"
echo "la altura ingrsada es: $altura" 

echo "el volumen del cilindro es: $cilindroVolumen"
#!/bin/bash
#title: Calcular areas
#author: Laura Oliveros
#data: 23/09/21
#version: 0.0.1

#calculadora >> valor
#definir variable. Pi
#concepto variable (parametro)
pi=$(echo "scale=10 ; 4*a(1)" | bc -l)

#para el usuario
echo "Calcula volumen de un cilindro"

echo -e "Ingrese el radio"
read radio
echo -e "Ingrese la altura"
read altura

#modelo matematico:
baseArea=$(echo "$pi * $radio * $radio" | bc - l)
echo "Puedo reemplazar el comando `bc - 1` por python, gnuplot, etc si asi lo deseo"

cilindroVolumen=$(echo "$baseArea * $altura" | bc -l)

echo "Usted ingreso el parametro de radio: $radio"
echo "Usted ingreso el parametro de altura: $altura"
echo "El volumen del cilindro es: $cilindroVolumen"


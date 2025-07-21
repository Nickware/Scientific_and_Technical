#!/usr/bin/bash.exe
#author: STalero
#version 0.0.1

#Calcular áreas

#definir varibale. Definiendo Pi
#concepto de variable. Se habla de parámetros
pi=$(echo "scale=10; 4*a(1)" | bc -l)

#Interacción con el usuario
echo "Programa que calcula el volumen de un cilindro"
echo -e "Ingrese el radio: "
read radio
echo -e "Ingrese la altura: "
read altura

#modelo matemático
baseArea=$(echo "$pi * $radio * $radio" | bc -l)
cilindroVolumen=$(echo "$baseArea * $altura" | bc -l)

#modelo físico
#free fall
#charge interaction
#fluid mechanics
#matriz
#química

echo "Usted ingresó como parámetro de radio: $radio"
echo "Usted ingresó como parámetro de radio: $altura"
echo "El volumen con los datos ingresados del cilindro es: $cilindroVolumen"
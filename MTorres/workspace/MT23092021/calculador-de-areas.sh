#!/usr/bin/bash
# Autor : MArcos Torres
# Version: 0.1

# Calcula areas

#calculadora >> valor

#definir la variable pi, la  dejo en escala de 9 decimales porque al dejar 10 me arroja un error y fue la unica manera que vi para corregirlo

pi=$(echo "scale=9; 4*a(1)" | bc -l)

# Se le informa al usuario la funcion que cumple el programa
echo "programa que calcula el volumen de figuras cilindricas"


echo "Señor usuario por favor"
echo -e "Ingrese el radio en metros:  "
read radio

echo -e "Ingrese altura en metros: "
read altura

echo "los datos ingresados anteriormente fueron: "
echo -e "radio: $radio metros"
echo -e "altura: $altura metros"

#formula matematica para calcular el area base del cilindro

baseArea=$(echo "$pi * $radio * $altura" | bc -l)

echo -e "La area de la base es de: $baseArea metros cuadrados"


# formula para calcular el volumen

cilindroVolumen=$(echo "$baseArea * $altura" | bc -l)

echo -e "El volumen del cilindro anteriormente ingresado es de: $cilindroVolumen metros cubicos"

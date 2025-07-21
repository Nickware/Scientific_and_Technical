# /usr/bin/bash.exe
# Author: Laura Triana
# Date: 23/09/20210
# Version: 

echo "Calculadora de áreas"

#Defino la variable pi. ¿Por qué 4*a(1)?

pi=$(echo "scale=10; 4*a(1)" | bc -l)   

#Verifico el valor de la variable

echo $pi

echo "Programa que calcula el volumen de un cilindro"
echo "Las unidades utilizadas serán del Sistema Internacional"

#Interactúo con el usuario preguntando los datos corresppndientes:

echo -e "Ingresa el radio del cilindro"
read radio
echo -e "Ingresa la altura del cilindro"
read altura

#Proceso para el cálculo del volumen:


#Opciones para realizarlo:
#baseArea = $(echo "$pi * $radio *$radio | python -l)
#baseArea = $(echo "$pi * $radio * $radio" | gnuplot -l)
#baseArea = $(echo "$pi * $radio * $radio" | latex -l)


baseArea=$( echo "$pi * $radio * $radio" | bc -l)

cilindroVolumen=$( echo "$baseArea * $altura" | bc -l)


#Muestro el valor resultante al usuario:

echo "El volumen del cilindro es igual a $cilindroVolumen"

echo "Gracias por usar este programa"


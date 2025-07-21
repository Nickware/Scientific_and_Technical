#/usr/bin/bash.exe
#autor:LCortes
#date: 230921
#version: 0.1

#calcula areas

#calculadora >> valor
#definir variable pi
pi=$(echo "scale=10; 4*a(1)" | bc -l)
#interaccion con usuario
echo "programa que calcula el volumen de un cilindro"
echo -e "ingrese el radio: "
read radio
echo -e "ingrese la altura: "
read altura

#modelo matematico
baseArea=$(echo "$pi * $radio * $radio" | bc -l)
echo $baseArea
cilindroVolumen=$(echo "$baseArea * $altura" | bc -l)
echo $cilindroVolumen

#modelo fisica
#free fall
# modelos de cualquier cosa xd
#modelos de negocio    ...
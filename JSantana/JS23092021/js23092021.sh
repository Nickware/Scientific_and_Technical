#!/usr/bin/bash
#autor;justin santana
#VERSION:0.01
#titulo:calcula areas
#calculadora >> valores
#define variable pi
pi=$(echo "scale=10; 4*a(1)" | bc -l)
#interaccion con ususario
echo "programa que calcula volumenes(cilindros)"
echo -e "ingrese el radio:"
read radio
echo -e "ingrese la altura:"
read altura
#modelo matematico
basearea=$(echo "$pi * $radio *$radio" | bc -l)
volumen=$(echo "$basearea * $altura" | bc -l)

echo "datos ingresados :"
echo "radio=$radio"
echo "altura=$altura"
echo "el volumen del cilindro es:$volumen"
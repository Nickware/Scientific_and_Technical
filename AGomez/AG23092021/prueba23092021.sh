#!/bin/bash
#Author: Andres Gomez.
#Version: 0.0.1.
#Calculadora de areas.
#Calculadora >> valor.
#Definir variable pi.
pi=$(echo "scale=10 4*(a)" | bc -l)
echo "Programa que calcula el volumen de un cilindro"
#Interaccion con usuario
echo -ne "Ingrese el radio: "$radio
read radio
echo -ne "Ingrese la altura: "$altura
read altura
#Modelo matematico
baseArea=$(echo "$pi * $radio * $radio" | bc -l)
cilindroVolumen=$(echo "$baseArea * $altura" | bc -l)
#Modelo fisico

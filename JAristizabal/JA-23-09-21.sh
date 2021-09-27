#!/usr/bin/bash
#Title: Calcular áreas
#Author: JAristizabal
#Date: 23-09-21
#Version: 0.0.1

#Definir variable pi
#concepto de variable
#parametro=variable
pi=$(echo "scale=10; 4*a(1)" | bc -l)

echo "PROGRAMA PARA CALCULAR VOLÚMEN DE UN CILINDRO"

echo "Las unidades deben ser ingresadas en el Sistema Internacional"

echo -ne "Ingrese el rádio: "

read radio

echo -ne "Ingrese la altura: "

read altura

#Modelo matemático

baseArea=$(echo "$pi * $radio * $radio" | bc -l)

cilindroVolumen=$(echo "$pi * $baseArea * $altura" | bc -l)

#Modelo físico
#free fall
#interacción entre dos cargas
#Matriz
#
#mecánica de fluidos

echo -e "Usted ingreso como parámetro de rádio: $radio"

echo -e "Usted ingreso como parámetro de altura: $altura"

echo -e "El área del cilindro es: $baseArea"

echo -e "El volumen del cilindro es: $cilindroVolumen"

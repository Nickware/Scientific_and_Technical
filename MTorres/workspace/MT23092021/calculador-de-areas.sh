#!/usr/bin/bash
# Autor : MArcos Torres
# Version: 0.1

# Calcula areas

#calculadora >> valor

#definir una variable pi
pi=$(echo "scale=10" ; "4*(a)" | bc -l)


# en este punto se interactua con el usuario
echo "programa que calcula el volumen de figuras cilindricas"

echo -e "Ingrese el radio:  "
read radio

echo -e "Ingrese altura: "
read altura

#formula matematica

baseArea=$(echo "$pi * $radio * $altura" | bc -l)

cilindroVolumen=$(echo "$baseArea * $altura" | bc -l)

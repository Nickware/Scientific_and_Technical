#!/usr/bin/bash
# PPatiño
# 23092021
# 0.0.1

#Calcular Volumem
#variables same as parámetros
#deff pi = 3.1416

pi=$(echo "scale=10; 4*a(1)" | bc -l) 

echo "Programa para calcular volumen de cilindro"
echo -e "Radio igual a"
read r
echo "altura igual a"
read h

#modelo mat
baseA=$(echo "$pi * $r * 2" | bc -l)
VolCilin=$(echo "$baseA * $h" | bc -l)

#parte de echo

echo "Radio: $r"
echo "altura: $h"

echo "base del cilindro = $baseA"
echo "Volumen total = $VolCilin"



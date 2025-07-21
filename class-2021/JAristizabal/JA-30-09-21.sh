#!/usr/bin/bash
#Title: Script raices de una ecuación
#Author: JAristizabal
#Date: 30-09-21
#Version: 0.0.1

echo "Programa para calcular raices"
echo "Ingrese el valor de a"
read valorA
echo "Ingrese el valor de b"
read valorB
echo "Ingrese el valor de c"
read valorC
raiz=$(($valorB*$valorB-4*$valorA*$valorC))


if [ $raiz -gt 0 ]
then
  echo ""
else
  echo "Tiene raices complejas"
fi

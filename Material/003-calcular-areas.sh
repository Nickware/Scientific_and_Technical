#!/usr/bin/bash
#author. NTorres
# Date: 23 sep 2021
# version 0.1

#Calcula areas

#calculadora >> valor

#definir variable. Pi
#concepto variable, 
#parametros
pi=$(echo "scale=10; 4*a(1)" | bc -l)

#Interaccion usuario
echo "Programa que calcula el volumen de un cilindro"
echo "Las unidades son SI"
echo -e "Ingrese el radio: "
read radio
echo -e "Ingrese la altura: "
read altura

#modelo matematico
baseArea=$(echo "$pi * $radio * $radio" | bc -l)
echo $baseArea
cilindroVolumen=$(echo "$baseArea * $altura" | bc -l)

# modelo fisico
#free fall <<<
#interracion entre cargas
# matriz
# quimica, elemento base arroja elemento
#mecanica fluidos 
# modelo de negocio

#ENVIAR MENSAJES
#archivos - leer  - datos
#pasar datos - texto 
# decisiciones

echo "Usted ingreso como parametro de radio: $radio"
echo "Usted ingreso como parametro de altura: $altura"

echo "El volumen con los datos ingresados del cilindro es: $cilindroVolumen"
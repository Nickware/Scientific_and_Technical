#!/usr/bin/bash.exe
# Author: Santiago Criollo
# Date: 23/09/2021
# version 0.2
# Title: calculador de área y volumen de un cilindro en metros


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
cilindroArea=$(echo "(2 * $pi * $radio * $altura) + (2 * $pi * $radio * $radio)" | bc -l)

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

echo "El area en metros con los datos ingresados del cilindro es: $cilindroArea"
echo "El volumen en metros con los datos ingresados del cilindro es: $cilindroVolumen"

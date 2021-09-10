#!/bin/bash                                              ID:20202107038
#Títle: Rurina para descomprimir                             
#Author: Juan Sebastián Sánchez
#User: JuanCelPirata                                     C.C:1001269776
#Date: 09/09/2021

echo "Hola Bienvenido a la rutina para descomprimir la carpeta gzip Pro20202107038.tar.gz"
echo 
echo "presiona 1 para descomprimir la carpeta Pro20202107038.tar.gz"
read uno

if [ "$uno" = "1" ]; then  
tar -xzvf Pro20202107038.tar.gz #el comando tar -xzvf nos permite descomprimir la carpeta 
echo "!En Hora buena ya has descomprimido tu carpeta!"
fi

#En bi20202107038 hay una explicación más completa de los comados usados aquí  
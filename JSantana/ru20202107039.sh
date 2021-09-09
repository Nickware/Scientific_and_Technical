#!/bin/bash
#title: Parcial/ turing
#author: descomprimir archivo
#date:31/08/2021
#version:0.0.4

#rutina para descomprimir el archivo pro20202107039.tar
echo -n "Escribe tu nombre"
read var1
echo "hola $var1, estamos descomprimendo el archivo"
tar -xvf pro20202107039.tar 
echo "listo, esta descomprimido:)" 

##!/usr/bin/bash.exe
#titulo: Bitácora
#autor: Santiago Criollo Bermudez
#fecha: 09/09/2021
#version: 0.0.2
#codigo: 2
#identificacion: 1

echo "Año: 1940"
echo "Programa para cifrar numeros hexagecimales" >> salida.txt
echo "Recuerde que las tropas nazis avanzan hacia Paris, su mensaje puede salvar vidas"
echo -e \ "ingrese el texto que quiere cifrar:" >> salida.txt
read $texto >> salida.txt
echo "Codificando su mensaje, espere por favor" >> salida.txt
echo "Su mensaje en hexagecimales:" >> salida.txt
echo $texto | hexdump >> salida.txt
echo $texto | hexdump




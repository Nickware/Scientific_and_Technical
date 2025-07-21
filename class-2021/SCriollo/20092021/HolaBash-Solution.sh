#!/usr/bin/bash.exe
#Author: Santiago Criollo Bermudez
#Date: 20/09/2021
#Title: Una posible solución al taller HolaBash

# Primera linea de prueba
# Segunda linea de visualizacion (.txt)
# Tercera línea instalador o ejecutable (.run)

echo "Borrando archivos anteriores" #Es necesario para no tener archivos clonados
rm *.txt
rm *.run
rm *.sh~
rm *.run~

echo "echo "Borrando Archivos txt"" >> 20202107022.run 
echo "rm example.txt" >> 20202107022.run

echo -e "Indiqueme su nombre: "
echo "echo -e "Indiqueme su nombre: "" >> 20202107022.run

read nombre
echo "read nombre" >> 20202107022.run

echo "Su nombre es: $nombre" >> salida.txt
echo "echo "Su nombre es: '$nombre'" >> example.txt" >> 20202107022.run

echo "Ubicando su posición"
echo "echo "Ubicando su posición" >> example.txt" >> 20202107022.run

echo "Su ubicación es: `pwd`"
echo "Su ubicación es: `pwd`" >> salida.txt
echo "echo "Su ubicación es: `pwd`" >> example.txt" >> 20202107022.run

echo "Indique el nombre de la carpeta a revisar los permisos"
echo "echo "Indique el nombre de la carpeta a revisar los permisos"" >> 20202107022.run

echo "NOTA:Coloque coma justo antes del nombre de la carpeta a revisar"
echo "echo "NOTA:Coloque coma justo antes del nombre de la carpeta a revisar"" >> 20202107022.run

read carpeta
echo "read 'carpeta'" >> 20202107022.run

# Set comma as delimiter
IFS=','
echo "IFS=','" >> 20202107022.run

read -a strarr <<< "$carpeta"

echo "read -a strarr <<< '$carpeta'" >> 20202107022.run

echo "Ubicacion carpeta de trabajo : "$carpeta""
echo "echo "Ubicacion carpeta de trabajo : '$carpeta'"" >> 20202107022.run

echo "Los permisos asociados de la carpeta "${strarr[1]}" son: "
echo "Los permisos asociados de la carpeta "${strarr[1]}" son: " >> salida.txt
echo "echo "Los permisos asociados de la carpeta '${strarr[1]}' son: '`ls -la`'"" >> 20202107022.run
echo "echo "Los permisos asociados de la carpeta '${strarr[1]}' son: '`ls -la`'" >> example.txt" >> 20202107022.run

echo `ls -la`
echo `ls -la` >> salida.txt

echo "El nombre de este archivo es: $(basename $0)"
echo "El nombre de este archivo es:  $(basename $0)" >> salida.txt
echo "echo "El nombre de este archivo es: $(basename $0)"" >> 20202107022.run
echo "echo "El nombre de este archivo es:  $(basename $0)" >> example.txt" >> 20202107022.run

exit 0
less salida.txt

# Una forma de verificación es que los dos archivos de texto (example.txt y salida.txt) queden iguales
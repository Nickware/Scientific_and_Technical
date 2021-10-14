#! /usr/bin/bash.exe
#author: Laura Oliveros 
#data: 13/10/21 
#version: 0.0.1

echo "Una bola lanzada desde una torre"
echo "Caída Libre"
echo 
echo -e \ "Ingrese la altura de la torre en metros: "
read altura
echo 

R1=$(echo "scale=2; sqrt((2*$altura)/9.8)" | bc)

echo "El tiempo de caída del objeto: $R1"
echo
echo "Si se realiza un lanzamiento vertical hacia arriba"
echo
tT=$(echo "scale=2; ($R1*2)" | bc)
echo
echo "El tiempo total es: $tT"

exit 0
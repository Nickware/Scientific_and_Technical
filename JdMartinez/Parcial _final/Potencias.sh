#!/usr/bin/bash.exe
#Authors: Juan Diego Martinez Ayala & Santiago Criollo Bermúdez
#Date: 13/10/2021
#Title: Potencias de números
#Version: 1.0.3

clear
#DAR INFORMACION AL USUARIO
echo "Bienvenido $USER al programa de potencias"
echo "En este programa va a ver las potencias al cuadrado, cubo y cuarta de los numeros del 0 al 20"
read -p "Oprima la tecla ENTER para continuar: " ENTER
echo

    echo -e " No.       Cuadrado     Cubo       Cuarta "
for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20

do
#ASIGNAR VALORES PARA LAS VARIABLES
    s=$(echo "$i^2" | bc -l )
    t=$(echo "$i^3" | bc -l )
    c=$(echo "$i^4" | bc -l )

#CREAR TABLA
    echo -e " $i        $s          $t          $c "
done

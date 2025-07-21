#!/usr/bin/bash
#Title: Calculadora
#Author: Juan A. y Laura O.
#Date: 01/10/21
#Version: 0.0.1

while true
do
   echo "Calculadora de números enteros, los resultados también serán enteros"
   echo "Ingrese el tipo de operación a realizar, si es suma digite +, si es resta digite -, si es multiplicación digite * o si es división digite /"
   read ope
   echo "Ingrese el primer número"
   read num1
   echo "Ingrese el segundo número"
   read num2

   num3=$(echo "scale=2; $num1 $ope $num2" | bc )
   echo "El resultado es $num3"

   echo "¿Desea continuar?, si la respuesta es afirmativa escriba (s), de lo contrario escriba (n)"
   read resp

     if [ $resp == s ]
     then
      echo "Continuamos"
     else
      exit
     fi

done

exit 0

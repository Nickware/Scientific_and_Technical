#!/usr/bin/bash
#Title: Números al revés
#Author: Juan A.
#Date: 13-10-21
#Version: 1.0.0

opc=0

while [ $opc -ne 5 ]
do

echo "Programa para invertir el orden de los números"
echo
echo "Escriba un número que desee invertir el orden, dicho número debe ser de máximo de 5 dígitos"
echo "Primero escriba el número de la opción que necesita según la cantidad de digitos que tiene su número"
echo
echo -e " Escriba (1) si su número tiene dos cifras"
echo -e " Escriba (2) si su número tiene tres cifras"
echo -e " Escriba (3) si su número tiene cuatro cifras"
echo -e " Escriba (4) si su número tiene cinco cifras"
echo -e " Escriba (5) si desea salir del programa"

read opc

case $opc in

          1)clear
  		  echo "Ingrese el primer dígito de su número: "
  		  read num1
  		  echo "Ingrese el segundo dígito de su número: "
 		  read num2
		  echo "Su número con orden invertido es: $num2$num1"
		  sleep 3
		  ;;
	  2)clear
  		  echo "Ingrese el primer dígito de su número: "
		  read num1
  	 	  echo "Ingrese el segundo dígito de su número: "
		  read num2
		  echo "Ingrese el tercer dígito de su número"
		  read num3
		  echo "Su número con orden invertido es: $num3$num2$num1"
		  sleep 3
		  ;;
	  3)clear
                  echo "Ingrese el primer dígito de su número: "
                  read num1
                  echo "Ingrese el segundo dígito de su número: "
                  read num2
                  echo "Ingrese el tercer dígito de su número"
                  read num3
                  echo "Ingrese el cuarto dígito de su número"
		  read num4
	 	  echo "Su número con orden invertido es: $num4$num3$num2$num1"
        	  sleep 3
		  ;;
	  4)clear
		  echo "Ingrese el primer dígito de su número: "
                  read num1
                  echo "Ingrese el segundo dígito de su número: "
                  read num2
                  echo "Ingrese el tercer dígito de su número"
                  read num3
                  echo "Ingrese el cuarto dígito de su número"
                  read num4
                  echo "Ingrese el quinto dígito de su número"
		  read num5
		  echo "Su número con orden invertido es: $num5$num4$num3$num2$num1"
		  sleep 3
		  ;;
	  5)clear
		  ;;

esac

done

exit 0

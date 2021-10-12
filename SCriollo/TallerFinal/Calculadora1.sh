#!/usr/bin/bash.exe
#Date: 04/10/2021
#Authors: Santiago Criollo Bermudez & Juan Diego Martinez Ayala
#Version: 1.0.3
#Title: Calculadora que hace 4 operaciones

opc=0
con=0

while [ $opc -ne 4 ] && [ $con -ne 2 ] ; do

echo "CALCULADORA"
echo
echo "1. Sumar"
echo "2. Restar"
echo "3. Multiplicar"
echo "4. Dividir"
echo
echo " Hola $USER"
read -p "Escriba el numero de la operacion que quiere hacer: " opc


case $opc in
    1) clear
        read -p "Ingrese el primer número: " uno
        read -p "Ingrese el segundo número: " dos
        suma=$(echo "$uno + $dos" | bc -l)
        echo "El resultado es: $suma"

        case $con in
            1) echo "Volviendo al menu principal ..."
                sleep 3
                ;;
        esac

        sleep 3
        ;;

    2) clear
        read -p "Ingrese el primer número: " uno
        read -p "Ingrese el segundo número: " dos
        resta=$(echo "$uno - $dos" | bc -l)
        echo "El resultado es: $resta"

        case $con in
            1) echo "Volviendo al menu principal ..."
                sleep 3
                ;;
        esac

        sleep 3
        ;;

    3) clear
        read -p "Ingrese el primer número: " uno
        read -p "Ingrese el segundo número: " dos
        multiplicacion=$(echo "$uno * $dos" | bc -l)
        echo "El resultado es: $multiplicacion"

        case $con in
            1) echo "Volviendo al menu principal ..."
                sleep 3
                ;;
        esac

        sleep 3
        ;;

    4) clear 
        read -p "Ingrese el primer número: " uno
        read -p "Ingrese el segundo número: " dos
        division=$(echo "$uno / $dos" | bc -l)
        echo "El resultado es: $division"

        case $con in
            1) echo "Volviendo al menu principal ..."
                sleep 3
                ;;
        esac

        sleep 3
        ;;

    *) echo $opc no es una opcion valida
        ;;



esac

echo
echo "1. SI"
echo "2. NO"
read -p "¿Desea hacer otra operacion?: " con
case $con in
        2) clear
            echo "Saliendo de la CALCULADORA ..."
                sleep 2
                echo "Hasta luego"
                ;;
        *) echo "$con No es una opcion valida"
esac

sleep 3
clear

done
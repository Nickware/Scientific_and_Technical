#!/bin/bash
#Taller operaciones matematicas 
# Author: Alejandra Moreno. 
# Versión 1.0.0


touch toBinary.txt
touch toOctal.txt

#Crear una funcion que convierta a Binario. 
function toBinary {
    echo -e  "Ingrese un numero por favor"
    read numero
    echo -e "El numero ingresado es $numero."
    echo " Su correspondiente valor en el sistema  binario es: "
    echo "obase=2; ibase=10; $numero" | bc
    echo "obase=2; ibase=10; $numero" | bc  >> toBinary.txt 

#echo "Sus numeros son `bash Script_operaciones.sh`" >> Los_numeros.txt ----> No funciona como quiero 

}

function toOctal {
    echo -e "Ingrese el numero octal que quiera convertir a binario "
    read octalnum
    echo -e "El número ingresado es: $octalnum ."
    echo "El correspondiente valor en el sistema octal es:  "
    echo " obase=2 ; ibase=8 ; $octalnum " | bc -l 
    echo " obase=2 ; ibase=8 ; $octalnum " | bc -l >>toOctal.txt

}



opc=0
while [ $opc -ne 4 ] ; do 
echo "1. Pasar de decimal a binario"
echo "2. Pasar de bianario a decimal"
echo "3. Salir "
echo
read -p "Selccionar una opción: " opc

case $opc in 
1)
    echo "Convertir de decimal a binario"
    toBinary
    ;;
2)  
    echo "Convertir de octal a binario"
    toOctal
    ;;

3) 
    echo "Hasta la proxima!!"
    break
    ;;
*)
    echo "Opción no valida, intente de nuevo "
    ;;




esac

done 
less toBinary.txt
less toOctal.txt

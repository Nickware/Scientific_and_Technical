#!/usr/bin/bash
# Autores : Marcos Torres / Julian Aros / Norman Romero
# Date: 10/ octubre / 2021
# Version: 0.0.1
# Title: Calculadora para realizar operaciones basicas de matematicas

echo "Bienvenido a Operaciones matematicas basicas"

echo "Esta calculadora le permitira realizar operaciones matematicas basicas"

echo -e "Por favor ingrese el primer numero: "
read num1

echo -e "Por favor ingrese el segundo numero diferente de 0: "
read num2

echo -e "Los numeros ingresados fueron: $num1 y $num2"


s=$(echo "$num1+$num2" | bc -l)
r=$(echo "$num1-$num2" | bc -l)
p=$(echo "$num1*$num2" | bc -l)
d=$(echo "$num1/$num2" | bc -l)


echo "Por favor elija la operacion que desea realizar: "
echo "Tenga en cuenta que la opcion elegida debe ser escrita en mayuscula"
echo " "
echo "S=suma"
echo " "
echo "R=resta"
echo " "
echo "P=producto"
echo " "
echo "D=division"

S=suma; R=resta; P=producto; D=division
read var


if [ "$var" == S ]
then
echo -e "la suma es: $s"
fi
if [ "$var" == R ]
then
echo -e "la resta es: $r"
fi
if [ "$var" == P ]
then
echo -e "la multiplicacion es: $p"
fi
if [ "$var" == D ]
then
echo -e "el cociente es: $d"
fi

echo "Le gustaria realizar otra operacion?"
echo " "
echo "digite yes para continuar"
echo " "
echo "digite no para terminar"
echo " "

read var2

if [ "$var2" == yes ]
then
bash Calculadora.sh
else
exit
fi
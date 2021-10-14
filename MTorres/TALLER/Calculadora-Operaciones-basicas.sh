#!/usr/bin/bash
# Autores : Marcos Torres / Julian Aros / Norman Romero
# Date: 10/ octubre / 2021
# Version: 0.0.1
# Title: Calculadora para realizar operaciones basicas de matematicas

echo "Bienvenido a Operaciones matematicas basicas"

echo -e "Por favor ingrese el primer numero: "
read num1

echo -e "Por favor ingrese el segundo numero diferente de 0: "
read num2

echo -e "Los numeros ingresados fueron: $num1 y $num2"

#echo "Que operacion desar realizar: "

#echo "A Suma"
#echo "B Resta"
#echo "C Multiplicacion"
#echo "D Division"

s=$(echo "$num1+$num2" | bc -l)
r=$(echo "$num1-$num2" | bc -l)
p=$(echo "$num1*$num2" | bc -l)
d=$(echo "$num1/$num2" | bc -l)



#echo -e " la suma es: $suma"
#echo -e " la resta es: $resta"
#echo -e " la multiplicacion es: $producto"
#echo -e " el cociente es: $division"

echo "Para realizar alguna operacion elija: "
echo "S=suma"
echo "R=resta"
echo "P=producto"
echo "D=division"

S=suma; R=resta; P=producto; D=division
read var

#if 
#if [ "$var" == S ]; echo -e " la suma es: $s"
#then
#if [ "$var" == R ]; echo -e " la resta es: $r"
#then
#if [ "$var" == P ]; echo -e " la multiplicacion es: $p"
#then
#if [ "$var" == D ]; echo -e " el cociente es: $d"
#fi 
#then echo -e " la suma es: $s"
#else
#echo "realice otra operacion"
#fi 


#let suma=$num1+$num2
#echo -e "la suma es: $suma"

#let resta=$num1-$num2
#echo -e "la resta es: $resta"

#let multiplicacion=$num1*$num2
#echo -e "el producto es: $multiplicacion"

#let division=$num1/$num2
#echo -e "el cociente es: $division"

if [ "$var" == S ]
then
echo -e " la suma es: $s"
fi
if [ "$var" == R ]
then
echo -e " la resta es: $r"
fi
if [ "$var" == P ]
then
echo -e " la multiplicacion es: $p"
fi
if [ "$var" == D ]
then
echo -e " el cociente es: $d"
fi

echo "realizar otra operacion?"
echo "yes"
echo "no"
read var2
if [ "$var2" == yes ]
then
bash Calculadora-Operaciones-basicas.sh
else
exit
fi
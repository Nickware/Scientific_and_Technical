#! /usr/bin/bash.exe
#title: Convertidor de Numeros Octales a Binarios
#author: STalero
#date: 06/09/21
#version: 0.0.1

echo "¿Cuál es su nombre?: "
read
echo "Hola $REPLY, bienvenido al Convertidor de Números Octales a Binarios"
echo "Ingrese el numero octal que desee: "
read numero
echo "El numero ingresado es $numero "
echo "Su correspondiente valor en el sistema binario se mostrará en breve: "
echo "obase=2; ibase=8; $numero" | bc >> ValorOctal.txt   #convirtiendo números octales a binarios y pasandolos al ValorOctal.txt
less ValorOctal.txt   #mostrando respuesta
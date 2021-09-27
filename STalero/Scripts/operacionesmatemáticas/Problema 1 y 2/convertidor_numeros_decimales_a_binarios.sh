#! /usr/bin/bash.exe
#title: Convertidor de Numeros Decimales a Binarios
#author: STalero
#date: 06/09/21
#version: 0.0.1

echo "¿Cuál es su nombre?: "
read
echo "Hola $REPLY, bienvenido al Convertidor de Números Decimales a Binarios"
echo "Ingrese el numero decimal que desee: "
read numero
echo "El numero ingresado es $numero "
echo "Su correspondiente valor en el sistema binario se mostrará en breve: "
echo "obase=2; ibase=10; $numero" | bc >> ValorDecimal.txt   #convirtiendo números decimales a binarios y pasandolos al archivo.txt
less ValorDecimal.txt   #mostrando respuesta
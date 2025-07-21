#!/usr/bin/bash.exe
#Authors: Juan Diego Martinez Ayala & Santiago Criollo Bermúdez
#Date: 12/10/2021
#Title: Números al revés
#Version: 1.0.0

#DANDO VALOR A LAS VARIABLES
a=0
b=0
c=0
d=0
e=0

#INDICACIONES AL USUARIO SOBRE EL PROGRAMA
echo "Bienvenido $USER a un nuevo programa" 
echo "En este programa deberá ingresar 5 números y se le imprimirán al revés"
echo

#INGRESAR LOS NUMEROS
read -p "Ingrese el primer número: " a
read -p "Ingrese el segundio número: " b
read -p "Ingrese el tercer número: " c
read -p "Ingrese el cuarto número: " d
read -p "Ingrese el quinto número: " e
echo
echo "El número que ingresó fue: $a$b$c$d$e"
echo

#IMPRIMIENDO LOS VALORES 
echo "El número al revés es: $e$d$c$b$a"
sleep 2

#CERRANDO EL PROGRAMA
echo 
echo "Hasta luego $USER"



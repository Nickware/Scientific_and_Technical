#! /usr/bin/bash.exe
#title: Parcial 1 Computational Elements
#author: Santiago Talero Parra
#date: 08/09/2021
#version: 0.0.1

echo "Empezando con información del desarrollador"
echo "Santiago Talero Parra"
echo "Código Estudiantil: 20202107025"
echo "Numero de Identificación Personal: 1000589589"
echo "Último Dígito de Codigo Estudiantil: 5"
echo "Último Dígito de Documento de Identidad: 9"
echo "Ambos numeros son impares, puedo optar por cualquier equipo"
echo "Elegí el equipo octal" #se facilitará más adelante con sistema hexal

echo "Cambiando permisos de bitácora"
chmod 710 bi20202107025.sh
echo "Creando programas de cifrado"
touch cifradooctal.sh
echo "echo "Cifrado Octal"" >> cifradooctal.sh
echo "echo "El archivo a analizar es: Ingreso.txt"" >> cifradooctal.sh
echo "cat Ingreso.txt" >> cifradooctal.sh
echo "echo "Pasando de texto a sistema octal"" >> cifradooctal.sh
echo "od -t o1 Ingreso.txt" >> cifradooctal.sh
echo "echo "El mensaje cifrado en octal"" >> cifradooctal.sh
echo "touch Mensajeoctal.txt"
echo "od -t o1 Ingreso.txt >> Mensajeoctal.txt"

echo "Cifrado Hexal"
echo "El archivo a analizar es: Ingreso.txt"
cat Ingreso.txt
echo 
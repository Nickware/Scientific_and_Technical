#!/usr/bin/bash 

#Author: Andres Gomez

#Title: Programa de cifrado 

#Date: 09/09/2021

#Version: 0.0.1

#UltimoDigitoCodigo: 2

#UltimoDigitoIdentifiacion: 0

echo "Esta es la rutina de descompresión de los archivos de gzip"

gzip -dv Pro20202107002.gz #Comando que descomprime la carpeta donde están los archivos.

chmod 740 Pro20202107002 #Se agregan permisos correspondientes.

echo "Finalizado."
#!/bin/bash

# Title: Rutina de descompresión (ru20202107016)
# Author: Juan Sebastian Manrique Moreno
# Date: 6 de septiembre de 2021

# FUNCIONAMIENTO DEL PROGRAMA: La siguiente rutina tiene como objetivo descomprimir archivos .zip
# a elección del usuario que lo ejecute, siendo así, que le solicita el nombre del archivo sin la
# extensión .zip al final, ya que independientemente de el único archivo que puede descomprimir
# es de ese tipo. Espero le guste el programa, es intuitivo y además tiene una opción de reinicio.

# 1. Solicitar el nombre del archivo el cuál desee descomprimir

echo "========================================================================================================="
echo "                                              ¡Hola!"
echo "                     Bienvenido a la rutina de descompresión de archivos .zip"
echo -e "A continuación, escriba el nombre del archivo que desea descomprimir (sin la extensión .zip al final):"
read name # Toma de datos
echo ""
echo "El nombre del archivo a descomprimir es el siguiente: $name"

# 2. Identificación del archivo y respuesta

if [ -e $name.zip ] # Condicional para la descompresión del archivo basado en la toma de datos previa
then #Si el archivo existe, descomprime y lo guarda dentro de una carpeta con su mismo nombre
    mkdir $name
    cp $name.zip $name
    cd $name 
    unzip -q $name.zip
    rm $name.zip
    cd ..
    echo "¡La descompresión ha sido exitosa, no olvide revisar sus archivos!"
    echo ""
    echo "     ¿Desea volver a ejecutar el programa?"
    echo -e "1 = Sí             |             Presione cualquier tecla = No"
    read decision
    echo ""
    if [ $decision -eq "1" ] # Módulo de elección para una reejecución del programa o finalización del mismo
    then
        bash ru20202107016.sh # Reejecución del programa
    else
        echo "¡Gracias por usar nuestro programa!"
        echo ""
        echo "Vuelva pronto..." # Finalización del programa
    fi
else # Si no, arroja mensaje de error
    echo "Lo lamentamos, pero el archivo que usted indicó no se encuentra"
    echo ""
    echo "     ¿Desea volver a ejecutar el programa?"
    echo -e "1=Sí             |             Presione cualquier tecla=No"
    read decision
    echo ""
    if [ $decision -eq "1" ] # Módulo de elección para una reejecución del programa o finalización del mismo
    then
        bash ru20202107016.sh # Reejecución del programa
    else
        echo "¡Gracias por usar nuestro programa!"
        echo ""
        echo "Vuelva pronto..." # Finalización del programa
    fi
fi

# 3. Referencias

# Variables en bash: https://atareao.es/tutorial/scripts-en-bash/variables-en-bash/
# Condicionales y ciclos en bash: https://bioinf.comav.upv.es/courses/unix/scripts_bash.html
# Compresión y descompresión de archivos .zip: https://www.youtube.com/watch?v=iNjOJ2EfhSw
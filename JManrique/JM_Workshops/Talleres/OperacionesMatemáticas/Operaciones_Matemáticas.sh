#!/bin/bash

# Título: Operaciones Matemáticas
# Autor: Juan Sebastian Manrique Moreno
# Fecha: 26/08/2021
#                   -  RESUMEN Y EXPLICACIÓN DEL FUNCIONAMIENTO DEL PROGRAMA  -
# El programa a continuación es un conversor de números binarios a decimales y de octales a binarios,
# a su vez genera un archivo .txt que está en constante actualización por cada vez que utilice el programa,
# esto debido a qué lleva un filtro de creación previa, dónde si este ha sido creado previamente, se elimnará
# y se procederá a crear un archivo completamente nuevo, esto con el fin de evitar la acumulación de resultados.
# En dicho archivo podrá encontrar un resumen detallado de todas las entradas y los resultados respectivos a dichas 
# entradas, no siendo más, usé un ciclo 'while' con la declaración de unas variables que recopilan datos
# como por ejemplo, la cantidad de elementos que va a registrar, esto con el fin de no tener que ejecutar todo
# el programa cada vez que quiera convertir un nuevo número, junto a un contador para que no sea infinito 
# ese ciclo, al terminar todo el programa, se va a imprimir todo el contenido que está dentro del archivo .txt 
# (que en este caso se llama Resultados.txt) para que usted lo pueda visualizar directamente sin tener la necesidad 
# de abrir el documento .txt generado cada vez que quiera saber el resumen de los resultados.

# 1. Actualización del archivo Resultados.txt, junto al inicio del programa

if [ -e Resultados.txt ]
then
    rm Resultados.txt
    touch Resultados.txt
else
    touch Resultados.txt
fi

echo "Bienvenido al sistema de conversión de unidades"
echo "Bienvenido al reporte final con los resultados de las conversiones" >> Resultados.txt
echo "==============================================="
echo "==================================================================" >> Resultados.txt

# 2. Solicitud de datos para convertir de binario a decimal, junto a su ciclo y variables

let m=0
echo "A continuación registrará los valores que quiera convertir de binario a decimal"
echo "A continuación los datos convertidos de binario a decimal:" >> Resultados.txt
echo -n "¿Cuántos elementos desea convertir? "
read
let n=$REPLY

if [ $m -lt $n ]
then
    while [ $m -lt $n ]
    do
        echo -n "¿Qué número desea convertir?: "
        read numero
        echo "El número registrado fue: $numero" >> Resultados.txt
        echo "Y su valor en decimal es: $((2#$numero))" >> Resultados.txt
        echo "====================" >> Resultados.txt
        echo "Su valor en decimal es: $((2#$numero))"
        ((m++))
    done
else
    echo "¡Ojo, usted no registró ningún dato!" >> Resultados.txt
fi

# 3. Solicitud de datos para convertir de octal a binario, junto a su ciclo y variables

let o=0
echo "A continuación registrará los valores que quiera convertir de octal a binario"
echo "========================================================" >> Resultados.txt
echo "A continuación los datos convertidos de octal a binario:" >> Resultados.txt
echo -n "¿Cuántos elementos desea convertir? "
read
let h=$REPLY

if [ $o -lt $h ]
then
    while [ $o -lt $h ]
    do
        echo -n "¿Qué número desea convertir?: "
        read octal
        echo "Su número en binario es:"
        echo "obase=2; ibase=8; $octal" | bc
        echo "El número registrado fue: $octal, y su número en binario es:" >> Resultados.txt
        echo "obase=2; ibase=8; $octal" | bc >> Resultados.txt
        echo "====================" >> Resultados.txt

        ((o++))
    done
else 
    echo "¡Ojo, usted no registró ningún dato!" >> Resultados.txt
fi

# 4. Finalización del programa, junto al resumen de los resultados en consola

echo "======================================================" >> Resultados.txt
echo "Gracias por utilizar nuestro programa... vuelva pronto" >> Resultados.txt

echo "======================================================"
echo "A continuación, aparecerá en pantalla los resultados resumidos:"
echo "==============================================================="
cat Resultados.txt
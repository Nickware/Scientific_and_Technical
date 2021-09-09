#!/bin/bash

# Title: bi20202107016
# Author: Juan Sebastian Manrique Moreno
# Date: 6 de septiembre de 2021

# 1. Actualizador de creación de archivos.

echo ""

if [ -e Pro20202107016.zip ] # Este condicional es para que identifique si el archivo Pro20202107016.zip existe
then # Si dicho archivo existe, descomprime el archivo y recupera el archivo Mensaje.txt, necesario para el resto del programa
    unzip -q Pro20202107016.zip
    rm bi20202107016.run Resultado.txt Pro20202107016.zip
fi

if [ -e Resultado.txt ] # Este condicional es para que identifique si el archivo Resultado.txt existe
then # Si dicho archivo existe, lo borra y crea uno nuevo
    rm Resultado.txt
    touch Resultado.txt
else # Si no está creado, crea el archivo
    touch Resultado.txt
fi

touch bi20202107016.run # Creación del archivo bi20202107016.run
chmod 740 bi20202107016.run # Declaración de permisos

cp bi20202107016.sh bi20202107016.run # Copia de la bitácora original al archivo con extensión .run nuevo

# 2. Cifrar el mensaje secreto

hexdump -C Mensaje.txt >> Resultado.txt # Cifrado a hexadecimal del mensaje

inicial_h=`awk '/000000/ {print $1}' Resultado.txt` # Filtro de obtención

# En este caso se usó el comando 'awk', para la búsqueda de las palabras 
# dentro de Resultado.txt que cumpla el parámetro que ahí está mencionado

palabras_h=$(echo $inicial_h | wc -w) # Cantidad de palabras obtenidas con 'awk'

# Las siguientes son variables que funcionan como contadores, necesarias para el ciclo 'While'

let ph=$palabras_h
let ah=1
let ih=0

while [ $ah -le $ph ] # Ciclo para eliminar los parámetros obtenidos con 'awk'
do
    cadena_h=${inicial_h:$ih:8}
    sed -i 's/'$cadena_h'//g' Resultado.txt

    let ih=$ih+9
    ((ah++))
done

resultados_h=`cat Resultado.txt` # Recopilación del archivo final sin los elementos eliminados

# Actualización de Resulado.txt
rm Resultado.txt
touch Resultado.txt

od -b Mensaje.txt >> Resultado.txt # Cifrado a octal del mensaje

inicial_o=`awk '/0000/ {print $1}' Resultado.txt` # Filtro de obtención

# En este caso se usó el comando 'awk', para la búsqueda de las palabras 
# dentro de Resultado.txt que cumpla el parámetro que ahí está mencionado

palabras_o=$(echo $inicial_o | wc -w) # Cantidad de palabras obtenidas con 'awk'

# Las siguientes son variables que funcionan como contadores, necesarias para el ciclo 'While'

let po=$palabras_o
let ao=1
let io=0

while [ $ao -le $po ] # Ciclo para eliminar los parámetros obtenidos con 'awk'
do
    cadena_o=${inicial_o:$io:7}
    sed -i 's/'$cadena_o'//g' Resultado.txt

    let io=$io+8
    ((ao++))
done

resultados_o=`cat Resultado.txt` # Recopilación del archivo final sin los elementos eliminados

# Actualización de Resulado.txt
rm Resultado.txt
touch Resultado.txt

# 3. Parámetros que contendrá el archivo Resultado.txt

echo "Title: Resultado.txt" >> Resultado.txt
echo "Author: Juan Sebastian Manrique Moreno" >> Resultado.txt
echo "Date: 6 de septiembre de 2021" >> Resultado.txt
echo "ID: 1.000.942.101" >> Resultado.txt
echo "Institucional ID: 20202107016" >> Resultado.txt

echo "" >> Resultado.txt # Espacios dentro del archivo Resultado.txt

echo "A continuación encontrará el mensaje cifrado en hexadecimal y octal respectivamente:" >> Resultado.txt

echo "" >> Resultado.txt # Espacios dentro del archivo Resultado.txt

echo "Estos son los resultados de hexadecimal:" >> Resultado.txt
echo "$resultados_h" >> Resultado.txt

echo "" >> Resultado.txt # Espacios dentro del archivo Resultado.txt

echo "Estos son los resultados de octal:" >> Resultado.txt
echo "$resultados_o" >> Resultado.txt

echo "" >> Resultado.txt

echo "Buena suerte señor Turing..." >> Resultado.txt

# 4. Ejecuciones finales y compresión

cat Resultado.txt # Visualización del archivo Resultado.txt en la terminal

zip -q Pro20202107016.zip *bi20202107016.run *Mensaje.txt *Resultado.txt # Creación del comprimido

rm bi20202107016.run Resultado.txt Mensaje.txt # Eliminación de los archivos incluidos en el comprimido
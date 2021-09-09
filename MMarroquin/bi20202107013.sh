#!/bin/bash
#Title: Parcial 1
#Author: Manuel Marroquín
#Date: 06/09/2021
#Version: 1.0
#ID: 20202107013
#Identification document: 1000349591

rm -rf Salida.txt
touch Salida.txt

rm -rf Salida_hexadecimal.txt
touch Salida_hexadecimal.txt 

touch bi20202107013.run
chmod 740 bi20202107013.run

echo "Señor Turing el mensaje codificado en el sistema octal es:"

od -b msg20202107013.txt >> Salida.txt  #od para convertir de texto a octal; -b para que muestre los bytes de salida en octal
#usos od con sus banderas: tomado de https://programmerclick.com/article/89431229076/

contador_por_borrar=`awk '/0000/ {print $1}' salida.txt` #awk para buscar texto especifico con el cual el comando realizará una opción
#awk: tomado de https://atareao.es/tutorial/terminal/filtros-awk-grep-sed-y-cut/

N_de_palabras=$(echo $contador_por_borrar | wc -w) #contar cuantas entradas fueron halladas en "awk"

#contadores para el ciclo

let m=$N_de_palabras #transformar texto en número
let x=0 #contador de incremento 
let y=0 #contador de extracción

while [ $x -lt $m ] #while ejecutar un bloque de código hasta que se cumpla: [condición]

#Usando el ciclo para eliminar el contador de bytes convertidos el cual aparece al principio de cada linea de lectura en octal; 
#lo elemino para que este no me genere problemas al convertir del sistema octal a cualquier otro sistema; en este caso, hexadecimal

do #inicio del ciclo
    palabra=${contador_por_borrar:$y:7}
    sed -i 's/'$palabra'//g' Salida.txt #sed para buscar ua cadena de caracteres y reemplazarlo por otra (en este caso cambia el valor de $palabra por un espacio en blanco)

    let y=$y+8
    ((x++)) #incremento del ciclo
done #fin del ciclo

#Ciclos while: tomado de https://bioinf.comav.upv.es/courses/unix/scripts_bash.html

cat Salida.txt #leer el contenido de "archivo"

echo "Señor Turing el mensaje codificado en el sistema hexadecimal es:"

hexdump -C Salida.txt >> Salida_hexadecimal.txt #hexdump para convertir de octal a hexadecimal; -C para que muestre los bytes de salida en hexadecimal
#hexdump : tomado de https://www.sololinux.es/como-usar-el-comando-hexdump-en-linux/

Por_borrar=`awk '/000000/ {print $1}' Salida_hexadecimal.txt` #awk para buscar texto especifico con el cual el comando realizará una opción

caracteres_por_borrar=$(echo $Por_borrar | wc -w) #contar cuantas entradas fueron halladas en "awk"

#contadores para el ciclo

let a=$caracteres_por_borrar #transformar texto en número
let b=0 #contador de incremento 
let c=0 #contador de extracción

while [ $b -lt $a ] #while para ejecutar un bloque de código hasta que se cumpla: [condición]
do #inicio del ciclo
    borrar=${Por_borrar:$c:8}
    sed -i 's/'$borrar'//g' Salida_hexadecimal.txt #sed para buscar ua cadena de caracteres y reemplazarlo por otra (en este caso cambia el valor de $palabra por un espacio en blanco)

    let c=$c+9
    ((b++)) #incremento del ciclo
done #final del ciclo

cat Salida_hexadecimal.txt #leé la informacion del archivo.txt en la terminal

cp bi20202107013.sh bi20202107013.run #copia de la bitacora al archivo.run

tar cf Pro20202107013.tar bi20202107013.run msg20202107013.txt Salida.txt Salida_hexadecimal.txt #tar para comprimir, c para que cree un nuevo archivo y f para decir que el archivo que vas a crear sea un .tar
#uso comenado tar: tomado de https://www.youtube.com/watch?v=7VdcJ5HcDxI&ab_channel=SistemaGeek
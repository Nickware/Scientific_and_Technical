#!/bin/bash
#title: Parcial/ turing
#author: Justin Santana ultimo digito de codigo inst=9 ultimo digito de cedula=4
#date:31/08/2021
#version:0.0.4

touch salida20202107039.txt
#cd /home/justin/Elementos_computacionales
echo "Sistema codificador y descodificador de numeros octales"  >> run20202107039.run >> salida20202107039.txt 
echo "Digita tu nombre:"
echo -n "Digita tu nombre:"  >> run20202107039.run >> salida20202107039.txt 
 read var1  #utlizamos read para que el usuario pueda escribir su nombre
echo "Hola $var1"  >> run20202107039.run >> salida20202107039.txt #utilizando una variable imprimimos lo escrito en read
echo "Comencemos!!" 
echo "Ahora digite lo que quiere codificar" 
echo -n "Digite:"  >> run20202107039.run >> salida20202107039.txt 
 read var2  
echo "El texto ingresado es: $var2"   >> run20202107039.run >> salida20202107039.txt 
echo "pasando a octal es:"  >> run20202107039.run >> salida20202107039.txt 
echo $var2 | od -An -b   >> run20202107039.run >> salida20202107039.txt 
echo "pasando a octal es:"  
echo $var2 | od -An -b   # Aqui utlizamos od (El comando od en Linux se usa para convertir el contenido de entrada en diferentes formatos con formato octal como formato predeterminado)
                         #luego añadimos -An para eliminar la primera columna y -b para pasar de texto a binario
 less salida20202107039.txt 


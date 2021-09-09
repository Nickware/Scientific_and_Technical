#!/usr/bin/bash 

#Author: Andres Gomez

#Title: Programa de cifrado 

#Date: 09/09/2021

#Version: 0.0.1

#UltimoDigitoCodigo: 2

#UltimoDigitoIdentifiacion: 0

echo "Este será un porgrama de cifrado de mensajes al sistema binario."

pwd #Se usa el comando para asegurar que se está en la carpeta correcta.

echo "Ahora se hará una preuba de conversión de mensajes."

rm -rfv TextoEntradaPrueba.txt

rm -rfv Prueba.hex

rm -rfv ejecutable_prueba.run

rm -rfv TextoSalidaPrueba.txt #Se deben borrar los archivos para que no se sobrepongan al volver a ejecutar el programa.

touch TextoEntradaPrueba.txt

touch Prueba.hex

touch ejecutable_prueba.run

touch TextoSalidaPrueba.txt #Se deben crear nuevamente los archivos.

chmod 740 TextoEntradaPrueba.txt

chmod 740 Prueba.hex

chmod 740 ejecutable_prueba.run

chmod 740 TextoSalidaPrueba.txt #Se otorgan permisos de lectura, escritura y ejecución al propietario, lectura a los usuarios del equipo y ninguno al público.

ls -la #Se busca probar que los archivos tienes los permisos otorgados.

echo "Se introducirá un comando de prueba al texto de entrada."

echo "Los alemanes estan retrocediendo en Leningrado." >> TextoEntradaPrueba.txt #Se crea un texto y se introduce al archivo de extensión .txt

echo "Presione q para continuar." >> TextoEntradaPrueba.txt #Se da una aclaración para poder continuar con el ejecutable.

less TextoEntradaPrueba.txt #Se da la orden de abrir el archivo de texto.

echo "Ahora se ejecutará el archivo de extensión .run en el cual se hará la conversión."

echo 'echo "En primer lugar, se convertirá el texto a número hexal."' >> ejecutable_prueba.run #Se le dice al archivo que enuncie lo dicho.

echo 'xxd -plain TextoEntradaPrueba.txt > Prueba.hex' >> ejecutable_prueba.run #Se le da la orden al ejecutable de que ejecute el comando que permite leer un archivo de texto y pasarlo a sistema hexal. Fuente: https://www.it-swarm-es.com/es/linux/como-convertir-datos-de-archivo-hexadecimal-plano/959486832/                     

echo 'less Prueba.hex' >> ejecutable_prueba.run #Se le da la instrucción al ejecutable de que abra el archivo hexal. 

echo 'echo "Ahora se deberá convertir el archivo hexadecimal a binario."' >> ejecutable_prueba.run #Se le dice al ejecutable que diga lo anterior. 

strings TextoEntradaPrueba.txt | perl -lpe '$_=unpack "B*"'  >> TextoSalidaPrueba.txt #Se le dice al ejecutable que procese la información dada, y que el resultado se pase al archivo de salida.

echo 'less TextoSalidaPrueba.txt' >> ejecutable_prueba.run #Se le dice al ejecutable que abra la salida.

./ejecutable_prueba.run #Se da la orden de ejecutar el archivo de extensión .run.

echo "Ahora usted deberá ingresar un mensaje aleatorio."

rm -rfv TextoEntradaIngreso.txt

rm -rfv Ingreso.hex

rm -rfv ejecutable_Ingreso.run

rm -rfv TextoSalidaIngreso.txt #Se deben borrar los archivos para que no se sobrepongan al volver a ejecutar el programa.

touch TextoEntradaIngreso.txt

touch Ingreso.hex

touch ejecutable_Ingreso.run

touch TextoSalidaIngreso.txt #Se deben crear nuevamente los archivos.

chmod 740 TextoEntradaIngreso.txt

chmod 740 Ingreso.hex

chmod 740 ejecutable_Ingreso.run

chmod 740 TextoSalidaIngreso.txt #Se otorgan permisos de lectura, escritura y ejecución al propietario, lectura a los usuarios del equipo y ninguno al público.

ls -la #Se busca probar que los archivos tienes los permisos otorgados.

echo 'echo -n "Ingrese un mensaje: " $mens' >> ejecutable_Ingreso.run #Se le pide al ejecutable que pida un mensaje.

echo 'read mens' >> ejecutable_Ingreso.run #El ejecutable debe leer el mensaje.



echo 'echo "$mens" >> TextoEntradaIngreso.txt' >> ejecutable_Ingreso.run #Se le dice al ejecutable que debe recolectar la información e indicarla en este punto.

echo 'less TextoEntradaIngreso.txt' >> ejecutable_Ingreso.run #Se le dice al ejecutable que abra el archivo de entrada.


echo "Ahora se ejecutará el archivo de extensión .run en el cual se hará la conversión."

echo 'echo "En primer lugar, se convertirá el texto a número hexal."' >> ejecutable_Ingreso.run #Se le dice al archivo que enuncie lo dicho.

echo 'xxd -plain TextoEntradaIngreso.txt > Ingreso.hex' >> ejecutable_Ingreso.run #Se le da la orden al ejecutable de que ejecute el comando que permite leer un archivo de texto y pasarlo a sistema hexal. Fuente: https://www.it-swarm-es.com/es/linux/como-convertir-datos-de-archivo-hexadecimal-plano/959486832/                     

echo 'less Ingreso.hex' >> ejecutable_Ingreso.run #Se le da la instrucción al ejecutable de que abra el archivo hexal. 

echo 'echo "Ahora se deberá convertir el archivo hexadecimal a binario."' >> ejecutable_Ingreso.run #Se le dice al ejecutable que diga lo anterior. 

'strings Ingreso.hex | perl -lpe '$_=unpack "B*"'' >> ejecutable_Ingreso.run


  #Se le dice al ejecutable que procese la información dada, y que el resultado se pase al archivo de salida.

echo 'less TextoSalidaIngreso.txt' >> ejecutable_Ingreso.run #Se le dice al ejecutable que abra la salida.

./ejecutable_Ingreso.run #Se da la orden de ejecutar el archivo de extensión .run.


echo "Ahora se comprimirán los archivos."

rm -rfv Pro20202107002 #Se elimina por si se ha usado la rutina de descompresión.

rm -rfv Pro20202107002.gz #Se debe eliminar para que no se sobreescriba.

cat ejecutable-Ingreso.run ejecutable_prueba.run Ingreso.hex Prueba.hex TextoEntradaIngreso.txt TextoEntradaPrueba.txt TextoSalidaIngreso.txt TextoSalidaPrueba.txt | gzip > Pro20202107002.gz #Se envían todos los archivos a una carpeta comrpimida.

rm -rfv ejecutable_Ingreso.run ejecutable_prueba.run Ingreso.hex Prueba.hex TextoEntradaIngreso.txt TextoEntradaPrueba.txt TextoSalidaIngreso.txt TextoSalidaPrueba.txt #Se eliminan para que no aparezcan fuera de su carpeta.

chmod 740 Pro20202107002.gz #Se agregan los permisos. 

echo "Se enlistarán los archivos."

ls -la #Se asegura que estén las tres carpetas con sus permisos. 










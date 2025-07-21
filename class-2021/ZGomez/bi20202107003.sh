#!/bin/bash
#author: Zaudi Gomez
#último digito código 3
#último digito CC 0
#No se pudieron asignar los permisos correspondientes a los archivos
echo "crear un archivo de texto"

echo "###############################################"
echo "#       Octal-Enigma Encryptor/Decryptor      #"
echo "#           © 1939 - ULTRA Project            #"
echo "#  Government Code and Cypher School (GC&CS)  #"
echo "#       From Bletchey Park Headquarters       #"
echo "###############################################"
#Mostrar las opciones el menú principal
echo "1 - Codificar mensaje"
echo "2 - Decodificar mensaje"
#Leer por teclado la opción que requiera el usuario
read option
#Codicional if. Ejecuta la tarea, ya sea codificar o decodificar según la opción
#del usuario
#EN caso de ingresar 1, se ejecuta la tarea de codificar mensaje
if [[ $option -eq 1 ]]
then
    echo "Por favor ingresa la ruta del archivo a codificar"
    # Leer ruta del archivo a codificar
    read encpath
    #El comando od convierte los caracteres de un archivo de texto plano a octal.
    # El argumento -An es para evitar que se muestre la compensación de bytes (offset),
    # que no es necesaria para codificar el mensaje.
    # El argumento -b indica al comando que se quiere una salida octal. Enseguida
    # se indica la ruta de archivo especificada por el usuario,
    # El comando od completo se concatena con el comando tr. Este sirve para 
    # quitar los saltos de linea que genera el formato od, para evitar errores
    # de visualización a la hora de decodificar el mensaje.
    # Se indica la salida del comando hacia el archivo encoded.txt
    od -An -b $encpath | tr -d '\n' > encoded.txt
    # Mostrar mensaje de confirmación
    echo "El mensaje ha sido codificado y está en el archivo encoded.txt"
    echo "Hasta pronto"
#En caso de ingresar 2, se ejecuta la tarea de codificar mensaje
elif [[ $option -eq 2 ]]
then
    echo "Por favor ingresa la ruta del archivo a decodificar"
    #Leer la ruta del archivo a decodificar
    read decpath
    #Echo permite interpretar directamente los carácteres en octal y mostrarlos
    #como texto normal. Sin embargo hay que indicar el carácter reservado "\0" antes de cada caracter 
    #en octal, además de añadir el argumento -e para que reconozca los caracteres reservados. 
    #Se aprovechan los espacios entre octales para insertar el carácter reservado.
    #El comando cat muestra el contenido del archivo.
    #El comando sed permite reemplazar texto, con las opciones 's///g'. cat y sed
    #se concatenan y se ejecutan dentro de echo, para poder anidar un comando se usa $(),
    #se encierra entre comillas y se indica la salida del comando hacia el archivo decoded.txt
    echo -e "$(cat $decpath | sed 's/ /\\0/g')" > decoded.txt
    # Mostrar mensaje de confirmación
    echo "El mensaje ha sido codificado y está en el archivo decoded.txt"
    echo "Hasta pronto"   
fi
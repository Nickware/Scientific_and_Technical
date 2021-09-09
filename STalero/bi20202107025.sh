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
echo "Mensaje de SUMA IMPORTANCIA para el señor Turing en Ingreso.txt"   #crear archivo de texto desde bitácora
touch Ingreso.txt
echo "Señor Turing, buenos días, no hay mucho tiempo, los nazis planean invadir Polonia y no tenemos suficiente tiempo. Un agente pudo conseguir la siguiente informacion: Caso Blanco 01 09 39" > Ingreso.txt

#eliminando programas y resultados desde el principio para evitar errores
rm -rf cifradooctal.run
rm -rf cifradohexal.run
rm -rf Mensajeoctal.txt
rm -rf Mensajehexal.txt
echo "Cambiando permisos de bitácora"
chmod 740 bi20202107025.sh   #chmod para cambiar permisos a owner y group, public no tendrá permisos
echo "Creando programas de cifrado"
touch cifradooctal.run   #se crea primer programa de cifrado
echo "echo "Cifrado Octal"" >> cifradooctal.run    #se pasarán datos directamente al programa desde la bitácora
echo "echo "El archivo a analizar es: Ingreso.txt"" >> cifradooctal.run   #pasando datos al programa
echo "cat Ingreso.txt" >> cifradooctal.run   #revisando el mensaje para Turing 
echo "echo "Pasando de texto a sistema octal"" >> cifradooctal.run
echo "od -b Ingreso.txt" >> cifradooctal.run   #con base en man od, se utiliza el comando od para codificar texto a sistema octal, la característica -b permite seleccionar unidades octales de 2 bytes
echo "echo "El mensaje cifrado en octal será almacenado en Mensajeoctal.txt"" >> cifradooctal.run
echo "touch Mensajeoctal.txt" >> cifradooctal.run   #se crea la salida .txt para el programa cifradooctal.run
echo "od -b Ingreso.txt >> Mensajeoctal.txt" >>cifradooctal.run   #pasando cifrado al archivo de texto
bash cifradooctal.run   #se ejecuta el programa para automatizar y generar los resultados de conversion

touch cifradohexal.run   #secuencialmente se crea el programa de cifradohexal
echo "echo "Cifrado Hexal"" >> cifradohexal.run   #se opta por pasar instrucciones a cifradohexal.run desde la bitácora
echo "echo "El archivo a analizar es: Ingreso.txt"" >> cifradohexal.run   #se analizará Ingreso.txt directamente
echo "cat Ingreso.txt" >> cifradohexal.run  #revisando el mensaje para Turing
echo "echo "Pasando de texto a sistema hexal"" >> cifradohexal.run
echo "od -x Ingreso.txt" >> cifradohexal.run   #con base en man od, se ejecuta el comando análogo para cifrar texto a octal, en este caso la característica "-x" selecciona unidades hexadecimales de 2 bytes
echo "echo "El mensaje cifrado en hexal se encuentra en Mensajehexal.txt"" >> cifradohexal.run
echo "touch Mensajehexal.txt" >> cifradohexal.run   #se crea la salida .txt para el programa cifradohexal.run
echo "od -x Ingreso.txt >> Mensajehexal.txt" >> cifradohexal.run   #pasando cifrado al archivo de texto
bash cifradohexal.run   #se ejecuta el programa para automatizar y generar los resultados de conversion

echo "Modificando permisos para los programas"   #segun indicaciones de taller
chmod 740 cifradooctal.run   #se otorgan permisos de rwx al owner, r-- al group y --- a public
chmod 740 cifradohexal.run   #se otorgan permisos de rwx al owner, r-- al group y --- a public
echo "Generando archivo comprimido para los programas y sus resultados"
rm -rf Pro20202107025.tar   #se elimina para evitar una sobreescritura en caso de que se ejecute otra vez los programas
touch Pro20202107025.tar   #creacion de archivo .tar
echo "Comprimiendo programas y archivos"
#la característica -cvf permite -c crear archivo .tar  -v mostrar progreso de compresion  -f asignar nombre al archivo
tar -cvf Pro20202107025.tar cifradooctal.run
tar -cvf Pro20202107025.tar cifradohexal.run
tar -cvf Pro20202107025.tar Mensajehexal.txt
tar -cvf Pro20202107025.tar Mensajeoctal.txt
tar -cvf Pro20202107025.tar Ingreso.txt
echo "Compresión realizada"
rm -rf v
echo "Eliminando evidencia de programas en la carpeta"
#con el propósito de obtener solo tres archivos en la carpeta STalero
rm -rf cifradooctal.run
rm -rf cifradohexal.run
rm -rf Mensajeoctal.txt
rm -rf Mensajehexal.txt

echo "Generando rutina para descompresion de Pro20202107025.tar"   #se creará del mismo modo desde la bitácora
rm -rf ru20202107025.sh    #por si se desea ejecutar de nuevo
touch ru20202107025.sh
#datos del desarrollador
#se pasarán los datos a la rutina creada, la rutina es un archivo .sh
echo "#! /usr/bin/bash.exe" >> ru20202107025.sh
echo "#title: Rutina de Descompresion" >> ru20202107025.sh
echo "#author: Santiago Talero Parra" >> ru20202107025.sh
echo "#date: 08/09/2021" >> ru20202107025.sh
echo "#version: 0.0.1" >> ru20202107025.sh
echo "echo "Bienvenido a la rutina de descompresion de archivos"" >> ru20202107025.sh
echo "echo "confirme su identidad:"" >> ru20202107025.sh
echo "read nombre" >> ru20202107025.sh   #la rutina pide una entrada para ejecutar la descompresion
echo "$nombre" >> ru20202107025.sh #asignación de variable
echo "echo "Bienvenido: $nombre"" >> ru20202107025.sh
echo "echo "Ejecutando descompresion"" >> ru20202107025.sh
echo "tar -xf Pro20202107025.tar" >> ru20202107025.sh  #con el comando tar y la característica -x se descomprime los archivos
echo "echo "Proceso finalizado"" >> ru20202107025.sh

#Fuentes y datos de comandos: 
#man od
#man tar
#man rm
#man chmod
#https://www.geeksforgeeks.org/od-command-linux-example/
#https://www.geeksforgeeks.org/hexdump-command-in-linux-with-examples/   (aunque no fue utilizado)
#https://www.howtogeek.com/248780/how-to-compress-and-extract-files-using-the-tar-command-on-linux/
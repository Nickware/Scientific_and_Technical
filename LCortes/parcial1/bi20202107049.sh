#/usr/bin/bash.exe
#Titulo: Parcial 1 Elementos Computacionales
#Autor: Laura Sofia Cortes Rodriguez
#Fecha: 6/09/21
#Version: 0.0.1

echo "Parcial 1 Elementos Computacionales"           #se nombra datos basicos de quien desarrolla
echo "Autor: Laura Sofia Cortes Rodriguez"
echo "Código estudiantil: 20202107049"               #se nombra datos para corroborar equipo
echo "Último dígito: 9"
echo "Número de indentificación: 1070467413"
echo "Último dígito: 3"


echo "Decidí trabajar en el equipo octal"         #como los dos números son impares, puedo elegir equipo
rm octal1.txt                      #borrando lo antes crado para no generar error
rm hexal1.txt
rm run20202107049.run
echo "Cambiando permisos de la bitacora"
chmod 740 bi20202107049.sh                           #cambiando permisos del script
echo "La bitacora contiene todos los programas"      #indicación: voy a realizar los programas en la misma bitacora

#problema 1: cifrar texto
echo "Programa 1: Cifrar texto"
echo "El archivo a cifrar es: texto1.txt"
echo "El mesaje es:"
echo -e "Inicio del mensaje:"
cat texto1.txt                                       #leer txt de entrada en la terminal
echo ""
echo "Fin del mensaje"

#cifrar a octal
echo "Mensaje cifrado en octal"
#para esto uso el comando od
#nuevo comando: od --> Cifra texto a sistema octal y otros. Algunas fuentes:https://planetatty.wordpress.com/2009/07/08/comando-od/ , 
                                                      #http://linuxcomandos.blogspot.com/2008/04/comando-od.html , 
                                                      #man de visual, 
                                                      #https://www.geeksforgeeks.org/od-command-linux-example/
                                                      #https://www.linuxito.com/gnu-linux/nivel-basico/1303-volcar-archivos-en-octal-y-otros-formatos-con-od
#nombre en man: od - dump files in octal and other formats.
#od , permite cifrar un texto completo a sistema octal y otros.
#algunas opciones: 
 #-t: seleccionar formato de salida o formatos
 #-b: cifrar byte por byte (de a 3 dígitos). 
 #-o: de a 2 bytes(de a 6 dígitos)
 #-x: cifra hexadecimal de a 2 bytes (de a 4 caracteres). La base hexadecimal emplea 4 bits por dígito (de esta forma 2 dígitos hexadecimales caben exactamente en 1 byte).
 #-t x: me muestra el texto en hexadecimal, 8 dígitos hexadecimales caben perfectamente en cada paquete de 4 bytes
 #-t o: muestra el texto en octal, caben 3 digitos en 1 byte.
 #si escribo un número después de las dos anteriores opciones representa el número de a cuantos bytes que quiero que me aparezca
od -t o1 texto1.txt                           #cifrar texto a octal de a 1 byte
echo "Creando nuevo archivo para guardar el texto cifrado en octal"
touch octal1.txt                 #crea archivo txt
echo "Guardando texto cifrado en octal"
od -t o1 texto1.txt >> octal1.txt          #pasando lo cifrado en octal a un nuevo archivo de texto

#cifrar a hexadecimal
echo "Mensaje cifrado en hexadecimal:"
#para esto uso el comando od y las opciones -t x y quiero que sea de a 2 bytes
od -t x2 texto1.txt                           #cifrar texto a hexadecimal de a 2 bytes
echo "Creando nuevo archivo para guardar el texto cifrado en hexadecimal"
touch hexal1.txt                               #crear archivo txt
echo "Guardando texto cifrado en hexadecimal"
od -t x2 texto1.txt >> hexal1.txt                             #pasando lo cifrado en hexal a un nuevo archivo de texto
echo "Fin programa de cifrado"

echo "Creando copia en .run"
cp bi20202107049.sh run20202107049.run                     #copia el sh a run
echo "Cambiando permisos del .run"
chmod 740 run20202107049.run                               #cambiar permisos a los estblecidos en el parcial para los programas                                               
echo "Comprobando todos los archivos creados"
ls -la                                                     #muestra todos los archivos y su información
echo "Fin problema 1"

#equipo octal: comprime con comando tar
#tar fuentes: man de visual, https://www.hostinger.co/tutoriales/como-usar-comando-tar-linux
#tar comando para comprimir archivos principarlmente
#algunas opciones de tar: 
                         #-c	Crear un nuevo archivo .tar
                         #-v	Muestra una descripción detallada del progreso de la compresión
                         #-f	Nombre del archivo
                         #-r	Actualizar o agregar un archivo o directorio en un archivo .tar existente

echo "Rutina para comprimir archivos con tar"
echo "cambiando permisos de este script"
chmod 740 ru20202107049.sh                           #cambiando permisos a los establecidos en el parcial para los programas
echo "Creando archivo .tar (comprimido)"
rm -rf comp20202107049.tar
touch comp20202107049.tar                            #crear archivo .tar
echo "Comprobando .tar"
ls -la *.tar                                         #muestra con informacion archivos con extencion .tar
echo "Añadir archivos al comprimido"
tar -rvf comp20202107049.tar run20202107049.run           #añade archivo .run al comprimido
tar -rvf comp20202107049.tar texto1.txt                   #añade texto de enytrada al comprimido
tar -rvf comp20202107049.tar octal1.txt                   #añade cifrado octal al comprimido
tar -rvf comp20202107049.tar hexal1.txt                   #añade cifrado hexadecimal al comprimido
echo "El comprimido esta listo"
echo "Eliminando archivos que se añadieron al comprimido"
rm run20202107049.run
rm octal1.txt
rm hexal1.txt
rm texto1.txt
echo "Fin. Carpeta lista para su envío"
#problema 2: descifrar texto 

#/usr/bin/bash.exe
#Titulo: Rutina para comprimir parcial 1
#Autor: Laura Sofia Cortes Rodriguez
#Fecha: 7/09/21
#Version: 0.0.1


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
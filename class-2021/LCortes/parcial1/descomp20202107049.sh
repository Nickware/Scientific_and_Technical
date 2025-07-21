#/usr/bin/bash.exe
#Titulo: Rutina para comprimir parcial 1
#Autor: Laura Sofia Cortes Rodriguez
#Fecha: 7/09/21
#Version: 0.0.1


#equipo octal: descomprime con comando tar
#tar fuentes: man de visual, https://www.hostinger.co/tutoriales/como-usar-comando-tar-linux
#tar comando para comprimir archivos principarlmente
#algunas opciones de tar: 
                         #-c	Crear un nuevo archivo .tar
                         #-v	Muestra una descripción detallada del progreso de la compresión
                         #-f	Nombre del archivo
                         #-r	Actualizar o agregar un archivo o directorio en un archivo .tar existente
#opciones para decomprimir con tar:
                         #comando: tar -xvf archivo.tar : extraerá los archivos en el directorio actual
                         #-x : Extraer el archivo en el directorio actual
                         #-C : Extraer archivos en un directorio diferente

echo "Rutina para descomprimir archivos con tar"
echo "Descomprimiendo archivos de comp20202107049.tar "
tar -xvf comp20202107049.tar              #comando para descomprimir archivos .tar en la misma carpeta
echo "Archivos extraidos. Fin."
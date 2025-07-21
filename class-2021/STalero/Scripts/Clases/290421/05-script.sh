echo Coco
echo "Coco"
echo 'Coco'
echo `pwd` #interpreta los comandos y se pueden imprimir
echo $((2+2))
echo $((2#10010)) #pasando numeros binarios a decimales
echo "ibase=2;10011" | bc #pasando numeros binarios a decimales usando bc y la tecla pecla |

echo $((2#10011))
echo $((2#1100))
echo $((2#10))
echo $((2#10001))
echo $((2#11111))

#! /usr/bin/bash.exe
#title: Hello Bash
#author: STalero
#date: 06/09/21
#version: 0.0.1

echo Ingresando a la raíz del sistema
cd C:\\   #Entrando al disco local C del equipo
echo elementos del sistema
ls   #Enlistando elementos del disco local
echo numero de elementos del sistema
ls | wc -l   #numero de elementos en la carpeta raíz del sistema a partir del enlistamiento

echo "Ingresando a la workspace"
cd /home/santi/STalero   #Se ingresa directamente la ruta donde se creará la carpeta con el ID
pwd   #Obteniendo la ubicaion de mi workspace
#Si se desea repetir el proceso se deja el comando rm -rvf para empezar desde cero y evitar error
rm -rvf 20202107025  #-rvf para eliminar carpetas con archivos. No se describe con echo ya que el usuario lo va a ejecutar una vez
echo "Creando carpeta de trabajo"
mkdir 20202107025
echo Observemos los permisos
ls -la
echo Otorgaremos permisos a la carpeta
chmod 777 20202107025
echo Verificamos permisos otorgados
ls -la
echo Entro a la carpeta de trabajo
cd 20202107025
echo Creo el archivo.run
rm 20202107025.run   #para evitar algún error se escribe el comando para eliminar y generar uno nuevo
touch 20202107025.run

echo "#! /usr/bin/bash.exe" >> 20202107025.run
echo "#title: 20202107025.run" >> 20202107025.run
echo "#author: STalero" >> 20202107025.run
echo "#date: 06/09/21" >> 20202107025.run
echo "#version: 0.0.1" >> 20202107025.run
echo "echo -n "nombre del usuario:"" >> 20202107025.run
echo "read nombre" >> 20202107025.run
echo "$nombre" >> 20202107025.run
echo "echo "Ubicandome en la carpeta ID"" >> 20202107025.run
echo "echo "`pwd`"" >> 20202107025.run
echo "echo "saliendo de la carpeta ID"" >> 20202107025.run
echo "echo "cd /home/santi/STalero"" >> 20202107025.run
echo "echo "ls"" >> 20202107025.run
echo "echo "la carpeta 20202107025 posee los siguientes permisos `ls -la`"" >> 20202107025.run
echo "echo "el nombre del archivo que ejecuta esta información es: "" >> 20202107025.run
echo "echo $(basename $0)!" >> 20202107025.run
echo "echo "`touch 20202107025.txt`"" >> 20202107025.run
echo cp 20202107025.run 20202107025.txt >> 20202107025.run
echo less 20202107025.txt >> 20202107025.run
bash 20202107025.run
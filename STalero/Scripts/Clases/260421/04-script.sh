#title: "Actividad 1"
#author: STalero
#date: 05/09/2021
#version: 0.0.1

echo "Arrojar la ubicación en la carpeta"
pwd
echo "Ubicarme en una carpeta"
cd /home/santi/20202107025/260421
echo "Borrando carpeta si ya existe"
rm -rf parcial
echo "Creando una carpeta"
mkdir parcial
echo "Entrando a la carpeta"
cd parcial
echo "Creando un archivo"
touch file.txt
echo "Enviando valor desde la terminal hasta el archivo"
echo "ESTOY EN MI ARCHIVO" >> file.txt
echo "Abriendo archivo"
less file.txt

#averiguar tíldes en un archivo bash (Configuración)
#actividad 26 de abril
#script .sh
#archivos .sh que incluyen rutinas -automatización de rutinas
#acciones a ejecutar
#fases de un ejecutable

#WARNING
#borrar archivos
#sustituir archivos
#guardar archivos
#no guarda no pregunta

#cd /bin
#ls *.exe
#ls -la *.exe
cd /home/santi/20202107025/Clases/260421
ls | wc -l
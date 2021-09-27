#title: Script
#author: STalero
#date: 05/09/2021
#version: 0.0.1

cd /home/santi/20202107025/Clases
echo "Borrando actividad-01"
rm -rfv actividad-01 #eliminar archivo
echo "Creando carpetas"
mkdir actividad-01 #crear carpeta
echo "Entrando a la carpeta actividad-01"
cd actividad-01 #ingresar
echo "Borrando guión.txt"
rm guión.txt
echo "Creando guión.txt"
touch guión.txt #crear archivos
file guión.txt #revisar propiedades, no es type
mv guión.txt actividad-01.sh
cd ..
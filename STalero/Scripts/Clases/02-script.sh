echo "Entrando a carpeta de trabajo"
cd /home/santi/20202107025/Clases
echo "Borrando carpeta si ya existe"
rm -rvf actividad-02
echo "Creando carpeta"
mkdir actividad-02
echo "entrando en carpeta"
cd actividad-02
echo "creando archivo"
touch archivo.txt
echo "Renombrando archivo"
mv archivo.txt 02-actividad.sh
echo "Viendo características de archivo"
file 02-actividad.sh
echo "Volviendo a la carpeta"
cd ..
echo "Viendo permisos de carpeta"
ls -la
echo "Entrando de nuevo a carpeta"
cd actividad-02
echo "Viendo permisos de archivos"
ls -la
echo "Ver contenido de archivo"
less 02-actividad.sh
#/usr/bin/bash.exe
#title: Script para subir carpetas o archivos al repositorio de la clase
#author: Laura Sofia Cortes Rodriguez
#date: 20 sep 2021

#nota: correr en la terminal de git bash

echo "Ir a carpeta de repositorio"
cd /c/cygwin64/home/PC/Elementos_computacionales
echo "Si desea copie el nombre del archivo o carpeta que desea subir"
ls
echo "Su archivo o carpeta a subir a repositorio Elementos_computacionales es: "
read nube
echo "Se subirá $nube"

#inicio de subida o como se diga xd
echo "Reiniciar repositorio"
git init
echo "Actualizar"
git pull
echo "Muestreme el estado"
git status
echo "Agregar archivo o carpeta"
git add $nube
echo "Agregar comentario"
git commit -m "Subiendo nuevo archivo o carpeta"
echo "Actualizando de nuevo"
git pull
echo "Enviando"
git push origin main
echo "Fin"
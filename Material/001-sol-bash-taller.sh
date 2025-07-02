#!/bin/bash

# Limpieza segura de archivos previos (solo si existen)
echo "Limpieza de archivos temporales y de salida previos..."
rm -f salida.txt example.txt 20202135080.run

# Solicitar nombre al usuario
read -p "Indique su nombre: " nombre
echo "Su nombre es: $nombre" | tee -a salida.txt

# Mostrar y guardar ubicación actual
ubicacion=$(pwd)
echo "Su ubicación es: $ubicacion" | tee -a salida.txt

# Solicitar nombre de la carpeta para revisar permisos
read -p "Indique el nombre de la carpeta a revisar permisos: " carpeta

# Validar que la carpeta exista
if [ -d "$carpeta" ]; then
    permisos=$(ls -ld "$carpeta")
    echo "Los permisos asociados de la carpeta '$carpeta' son: $permisos" | tee -a salida.txt
else
    echo "La carpeta '$carpeta' no existe." | tee -a salida.txt
fi

# Mostrar el nombre de este script
nombre_script=$(basename "$0")
echo "El nombre de este archivo es: $nombre_script" | tee -a salida.txt

# Mostrar contenido final
less salida.txt

exit 0

#! /usr/bin/bash
# Title: "PArcial 2"
# Author: Marcos Torres
# Date: 07/09/2021
# Version: 0.0.1
# Ultimo digito documento : 8
# ultimo digito codigo estudiantil : 4


# le muestro al usuario que voy a descomprimir el archivo
echo "Descomprimiendo archivo:"
# como inicialmente  tengo un comprimido gzip, con ayuda de -d procedo a hacer la descompresion
gzip -d Pro20202107044.tar.gz
echo "archivo descomprimido"
#muestro directorios actuales para mostrar que el gzip se descomprimio y me quedo un .tar ya que gzip no deja comprimir directorios
ls -la
echo "Desempaquetar archivos"
# ahora procedo a desempaquetar el .tar con ayuda de la -x para poder extraer todos los archivos que trae el empaquetado
tar -xvf Pro20202107044.tar
echo "desempaquetando archivos"
#muestro los archivos finales del desempaquetado con sus caracteristicas
ls -la
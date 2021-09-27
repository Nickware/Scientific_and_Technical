#!/usr/bin/bash
#autor;justin santana
#VERSION:0.01

#variable-constante array
export TZ=America/Bogota
echo "zona horaria: $TZ"
date
export TZ=Asia/Tokyo
echo "zona horaria: $TZ"
date
unset TZ
#ejemplo 2

echo "total numero de paramtros son: $#"
echo "nombre del archivo: $0"
echo "primer parametro: $1"
echo "segundo parametro: $2"
echo "tercer parametro: $3"
echo "todos los parametros: $*"


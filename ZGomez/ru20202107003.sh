#!/bin/bash
echo "Selecciona una opción del menú"
echo "1 - Comprimir"
echo "2 - Descomprimir"
read option
if [[ $option -eq 1  ]]
then
    echo "Ingresa un nombre para el archivo (sin espacios)"
    read packname
    echo "Ingresa una contraseña para el archivo (sin espacios)"
    read packpass
    # --exclude para excluir el script del proceso de empaquetado
    # -c para crear archivo, f para indicar el nombre del archivo seguido
    # de un espacio. Asterisco para indicar que se quiere comprimir todos los archivos y carpetas
    tar --exclude 'ru20202107003.sh' -cf $packname.tar * 
    # EL comando gpg permite cifrar archivos. 
    # El argumento --batch --yes para quitar el modo interactivo y especificar directamente
    # la contraseña con el argumento --passphrase. --symmetric para indicar el tipo de cifrado
    # y o para indicar el nombre de archivo de salida. Por último el nomre del archivo que se quiere
    # encriptar
    gpg --batch --yes --passphrase $packpass -o $packname.tar.gpg --symmetric $packname.tar
    rm $packname.tar
    echo "El archivo sido creado y encriptado satisfactoriamente. Se guardó como $packname.tar.gpg"
    echo "Hasta pronto"
 
elif [[ $option -eq 2 ]]
then
    echo "Escribe la ruta del archivo que quieres descomprimir, sin la extensión (.tar.gpg)"
    read unpackname
    echo "Escribe la contraseña para desencriptar"
    read unpackpass
    # -d para desencrptar, y se indica la salida de la desencriptación hacia el archivo tar
    gpg --batch --yes --passphrase $unpackpass -d $unpackname.tar.gpg >$unpackname.tar
    tar -xf $unpackname.tar
    echo "El archivo se ha descomprimido"
    echo "Hasta pronto"
    
fi
 
#!/bin/bash

# Title: 20202107016.sh
# Author: Juan Sebastian Manrique Moreno
# Date: 26 de agosto de 2021
# Versión:

echo "Bienvenido al Taller Hola Bash, disfrute su estadía :)"

# 1. Declaración de las variables, solicitud de datos y enlistado de la raíz

codigo=" "

echo -n "Por favor, digite su código estudiantil: "
read cod
echo ""
codigo=$cod

ruta_antigua=$PWD
permisos=$(ls -la Hola_Bash.sh)

cd /
echo "A continuación un listado de la raíz del sistema:"
ls
echo "A continuación la cantidad del carpetas que hay en la raíz:"
ls | wc
cd $ruta_antigua

# 2. Filtro de creación previa, creación de los archivos ID.sh, ID.run y el directorio ID junto a la delegación de permisos

if [ -e $codigo ]
then
    cd $codigo
    rm $codigo.sh $codigo.run $codigo.txt
    cd ..
    rmdir $codigo
    mkdir $codigo
else
    mkdir $codigo
fi

chmod 777 $codigo

mv Hola_Bash.sh $PWD/$codigo

cd $codigo

touch $codigo.sh $codigo.run

cp Hola_Bash.sh $codigo.sh
sed -i 's/20202107016.sh/'$codigo'.sh/g' "$codigo.sh"

chmod 751 $codigo.sh $codigo.run

# 3. Datos que contendrá el ejecutable ID.run

codigo=$cod >> $codigo.run

echo "#!/bin/bash" >> $codigo.run
echo "# Title: $codigo.run" >> $codigo.run
echo "# Author: Juan Sebastian Manrique Moreno" >> $codigo.run
echo "# Date: 26 de agosto de 2021" >> $codigo.run

echo "" >> $codigo.run # Espacios entre el código ID.run

echo "touch $codigo.txt" >> $codigo.run

echo "" >> $codigo.run # Espacios entre el código ID.run

echo "nombre=" "" >> $codigo.run

echo "" >> $codigo.run # Espacios entre el código ID.run

echo "echo """ >> $codigo.run
echo "echo -e "Por favor, digite su nombre completo:" """ >> $codigo.run
echo "read name" >> $codigo.run
echo "nombre=vname" >> $codigo.run
sed -i 's/vname/$name/g' "$codigo.run"
echo "echo """ >> $codigo.run

echo "" >> $codigo.run # Espacios entre el código ID.run

echo "echo "Su nombre es: vnombre" >> $codigo.txt" >> $codigo.run
echo "echo "Su nombre es: vnombre"" >> $codigo.run
sed -i 's/vnombre/$nombre/g' "$codigo.run"

echo "" >> $codigo.run # Espacios entre el código ID.run

echo "echo "Su nombre de usuario es: $USER" >> $codigo.txt" >> $codigo.run
echo "echo "Su nombre de usuario es: $USER"" >> $codigo.run
echo "echo""" >> $codigo.run
echo "echo "" >> $codigo.txt" >> $codigo.run # Espacios entre el archivo ID.txt

echo "" >> $codigo.run # Espacios entre el código ID.run

echo "echo "Usted está ubicado en: $PWD" >> $codigo.txt" >> $codigo.run
echo "echo "" >> $codigo.txt" >> $codigo.run # Espacios entre el archivo ID.txt
echo "echo "Usted está ubicado en: $PWD"" >> $codigo.run

echo "" >> $codigo.run # Espacios entre el código ID.run

echo "echo "Los permisos que posee la carpeta donde usted está ubicado son los siguientes:" >> $codigo.txt" >> $codigo.run
echo "ls -la -d >> $codigo.txt" >> $codigo.run
echo "echo "" >> $codigo.txt" >> $codigo.run # Espacios entre el archivo ID.txt
echo "echo "Los permisos que posee la carpeta donde usted está ubicado son los siguientes:"" >> $codigo.run
echo "ls -la -d" >> $codigo.run

echo "" >> $codigo.run # Espacios entre el código ID.run

echo "echo "Los permisos de los archivos que están dentro de la carpeta $codigo son:" >> $codigo.txt" >> $codigo.run
echo "ls -la >> $codigo.txt" >> $codigo.run
echo "echo "" >> $codigo.txt" >> $codigo.run # Espacios entre el archivo ID.txt
echo "echo "Los permisos de los archivos que están dentro de la carpeta $codigo son:"" >> $codigo.run
echo "ls -la" >> $codigo.run

echo "" >> $codigo.run # Espacios entre el código ID.run

echo "echo "El nombre del archivo de dónde usted está ejecutando este programa es: $codigo.run" >> $codigo.txt" >> $codigo.run
echo "echo "" >> $codigo.txt" >> $codigo.run # Espacios entre el archivo ID.txt
echo "echo "El nombre del archivo de dónde usted está ejecutando este programa es: $codigo.run"" >> $codigo.run

# 4. Recuperación del archivo original y ejecución final del programa

mv Hola_Bash.sh $ruta_antigua

bash $codigo.run

echo ""
echo "Usted ha ejecutado todo este programa desde: $0"
echo "Los permisos del archivo dónde usted ejecutó todo el programa son: $permisos"
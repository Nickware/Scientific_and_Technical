#! /usr/bin/bash.exe
#title: Hello Bash
#author: STalero
#date: 06/09/21
#version: 0.0.1

echo "Ubicándome en mi workspace `pwd`" #echo con doble comillas se utiliza para albergar comandos de tilde invertida como pwd
echo Si ya tengo carpeta, la borro para seguir desde cero el proceso  #se puede dejar la impresion sin comillas dobles
rm -rvf 20202107025  #-rvf para eliminar carpetas con archivos
echo "Creando carpeta de trabajo `mkdir 20202107025`"
echo Entro a la carpeta de trabajo
cd 20202107025
echo "Creo el script"
touch elejecutable.sh
echo "#! /usr/bin/bash.exe" >> elejecutable.sh
echo "#title: elejecutable.run" >> elejecutable.sh
echo "#author: STalero" >> elejecutable.sh
echo "#date: 06/09/21" >> elejecutable.sh
echo "#version: 0.0.1" >> elejecutable.sh
echo "echo "¿Cuál es su nombre? "" >> elejecutable.sh
echo "read " >> elejecutable.sh
echo "echo "Su nombre es "" >> elejecutable.sh
echo "cd /home/santi/20202107025/Clases/290421" >> elejecutable.sh
echo "echo "Usted se encuentra ubicado en la carpeta `pwd`"" >> elejecutable.sh
echo "echo "la carpeta posee los siguientes perimsos:"" >> elejecutable.sh
echo "ls -la" >> elejecutable.sh
echo "echo "el nombre del archivo que ejecuta esta información es: "" >> elejecutable.sh
echo "echo $(basename $0)!" >> elejecutable.sh
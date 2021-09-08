!/bin/bash
echo  "\0033[30;47mSistema conversor de sistema decimal a sistema binario\0033[0m"
#Muestra lo que esta dentro de las dobles comillas, el codigo \0033[30;47m----\0033[0m unicamente selecciona un codigo-color(el codigo no se muestra por medio de echo)
echo  "\0033[37;40mIngrese el numero, en el sistema decimal\0033[0m"
read numero
#el comando read nos permite interactuar con el usuario para que pueda introducir datos#
echo  "El numero ingresado es $numero" |tee -a  datos_almacenados_sistema-C_D-B.txt 
#comando tee -a Secuencia de salida estándar, se redirigirá a un archivo y también se mostrará en la terminal. Si el archivo existe, los nuevos datos se copiaran al final del archivo#
echo  "\0033[44;181mSu correspondiente valor en el sistema binario es:\0033[0m"
echo "obase=2; ibase=10; $numero" | bc |tee -a datos_almacenados_sistema-C_D-B.txt 
echo "datos_almacenados_sistema-C_D-B.txt creado, en este archivo se almacena el codigo binario de cada valor digitado"
sh sistemaDB.sh
#ejecuta el script nuevamente#

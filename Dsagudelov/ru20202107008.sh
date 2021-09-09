#descompresor
#Author David Santiago Agudelo VIllamizar
#Date 09/09/2021
#version 0.0.1


#creamos un menu basico para la toma del nombre del zip y proceder a su descompresion 
echo "bienvenido al descompresor para el de zip's"
echo 
echo 
echo " es necesario que nos del el nombre a descoprimir sin el .zip al final"
read nombrezip
echo
echo "el nombre escrito es $nombrezip "
sleep 2
#descomprimimos 
unzip -q $nombrezip.zip
clear 
echo "se ha descomprimido con exito"
sleep 2
echo
echo " danos el nombre del texto que salio sin el txt"
read documento
echo " el texto es '$documento'" 
sleep 2
mv $documento.txt texto.txt
clear
echo " gracias por usar nuestro programa"
sleep 2 




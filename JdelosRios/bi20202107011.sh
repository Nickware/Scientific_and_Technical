#!/bin/bash
#parcial-1#
cp bi20202107011.sh programa.run
echo "Juan David de los Rios Mahecha"
sleep 3
cat problema.txt
sleep 10
echo "ultimo digito del codigo institucional:"
echo "1"
echo "ultimo digito del documento personal"
echo "8"
echo "\0033[30;47mPrograma Turing\0033[0m"
sleep 3
echo "\0033[37;40mEquipo Octal\0033[0m"
echo "Funcion del programa Turing"
sleep 2
echo "Cifrar mensajes de texto"
echo "cambiando permisos"
chmod 740 bi20202107011.sh
echo "\0033[30;47mCodigo de Prueba\0033[0m"
echo "codigo sin cifrar:"
cat prueba.txt
echo "Codigo cifrado:"
od -b prueba.txt
echo "Creando ad.txt"
sleep 2 
echo "En este archivo.txt debera escribir el mensaje que desea cifrar"
touch ad.txt
echo "listando archivos"
ls
echo "a continuacion de muestra una interfaz en la que debera escribir el mensaje de texto que desea cifrar"
chmod 777 ad.txt
sleep 30
nano ad.txt
sleep 2
echo "el codigo(sin cifrar) ingresado fue"
cat ad.txt|tee -a codigo.txt|tee -a historial.txt
echo "su codigo cifrado es:"
rm ad.txt
od -b codigo.txt |tee -a historial.txt
rm codigo.txt
chmod 777 historial.txt
sh programa.run 
                        

#!/usr/bin/bash
#Title: Bitácora
#Author: Juan Esteban Aristizabal
#Date: 06/09/21
#Version: 0.0.1
#ID:9
#C.C.:8

chmod a+x bi20202107019.sh #cambiando permisos de la bitacora
mkdir Pro20202107019 #creando carpeta
touch ru20202107019.sh #creando .sh de rutina de descompresióm
chmod a+x ru20202107019.sh #cambiando permisos de la rutina .sh
echo "tar xvf Pro20202107019.tar" >> ru20202107019.sh #enviando rutina de descompresión al archivo .sh
cd Pro20202107019/ #accediendo a la carpeta
touch programacifrar.run #creando .run
chmod 740 programacifrar.run #cambiando permisos al .run
echo "#!/usr/bin/bash" >> programacifrar.run #pasando al .run
echo "#Title: Bitácora" >> programacifrar.run #pasando al .run
echo "#Author: Juan Esteban Aristizabal" >> programacifrar.run #pasando al .run
echo "#Date: 06/09/21" >> programacifrar.run #pasando al .run
echo "#Version: 0.0.1" >> programacifrar.run #pasando al .run
echo "#ID:9" >> programacifrar.run #pasando al .run
echo "#C.C.:8" >> programacifrar.run #pasando al .run
echo "touch entrada.txt" >> programacifrar.run #creando txt de entrada de texto
echo "touch salidaoct.txt" >> programacifrar.run #creando txt de salida en octal
echo "El siguiente ataque es el 05 de Julio de 1943, el blanco es el frente de la URSS en Kursk, se ordena atacar con blitzkrieg. Att: Heinz Guderian. Heil Hitler" >> entrada.txt #pasando texto al txt

#echo "hexdump -v -e '/1 "%03o "' entrada.txt >> salidaoct.txt" >> programacifrar.run #forma correcta de convertir texto a octal, pero de esta forma, al pasarla al .run no me lee las dobles comillas del centro.
#la -v me indica que el texto será volcado sin los números de los grupos. La -e me indica el formato de la cadena, lo que está escrito a su derecha es dicho formato, el cual indica que me va a convertir a octal, el 03 indica que será de a tres digitos. 

echo "hexdump -v -e '/1 "'"%03o "'" ' entrada.txt >> salidaoct.txt" >> programacifrar.run #forma en la que me reconozce las comillas dobles del comentario de arriba, porque al pasarlo al .run no me leia esas dobles comillas

echo "hexdump -v -e '/1 "'"%04X "'" ' salidaoct.txt >> salidahex.txt" >> programacifrar.run #pasando números de octal a hexadecimal
echo "hexdump -v -e '/1 "'"%03i "'" ' salidaoct.txt >> salidadec.txt" >> programacifrar.run #pasando números de octal a decimal

./programacifrar.run #ejecutando programa

cd .. #devolviendose un nivel
tar cf Pro20202107019.tar Pro20202107019/ #comprimiendo carpeta

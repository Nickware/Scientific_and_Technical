# Programas traídos por el profe Jhon.

echo "A continuación un menú de los programas que se pueden ejecutar:"
echo ""
echo "        MENÚ"
echo "1. Juego de números"
echo "2. Usuario y clave"
echo "3. Un contador"
echo "4. Número de la suerte"
echo "5. Tablas de multiplicar"
echo "0. Salir del aplicativo"
echo ""
echo -n "A continuación escriba el programa que desea utilizar: "
read program

if [ $program -eq "0" ]
then
    echo ""
    echo "Gracias por usar nuestro programa"
    echo "Hasta pronto..."
elif [ $program -eq "1" ]
then
    echo ""
    cd Programas_Clase
    bash 01-script.sh
    cd ..
    echo ""
    echo "Gracias por usar nuestro programa"
    echo "Hasta pronto..."
elif [ $program -eq "2" ]
then
    echo ""
    cd Programas_Clase
    bash 02-script.sh
    cd ..
    echo ""
    echo "Gracias por usar nuestro programa"
    echo "Hasta pronto..."
elif [ $program -eq "3" ]
then
    echo ""
    cd Programas_Clase
    bash 03-script.sh
    cd ..
    echo ""
    echo "Gracias por usar nuestro programa"
    echo "Hasta pronto..."
elif [ $program -eq "4" ]
then
    echo ""
    cd Programas_Clase
    bash 04-script.sh
    cd ..
    echo ""
    echo "Gracias por usar nuestro programa"
    echo "Hasta pronto..."
elif [ $program -eq "5" ]
then
    echo ""
    cd Programas_Clase
    bash 05-script.sh
    cd ..
    echo ""
    echo "Gracias por usar nuestro programa"
    echo "Hasta pronto..."
else
    echo ""
    echo "Código erróneo, reejecución del programa..."
    echo ""
    bash Programas_Clase.sh
fi
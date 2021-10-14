#!/bin/bash
#autor:Juan David de los Rios Mahecha
#fecha: 13/10/2021


#dialog --title "sever21" --msgbox "v1.0" 0 0
#dialog --title "Objetivo" --msgbox "Imprimir al reves los numeros o palabras que sean ingresados por el usuario" 0 0
#dialog --title "Objetivo2" --msgbox "a continuacion debera ingresar el numero o la palabras que desea ver al reves" 0 0
#dialog --title "Ingrese el numero o la palabra" --inputbox "Ingresar:" 0 0 2>entrada.txt



#reves=`cat entrada.txt`
echo "$reves" | rev
#dialog --title "asd" --msgbox  "echo $reves | rev" 0 0
clear
echo "El objetivo de este programa es imprimir al reves los numeros o las palabras que sean ingresados por el usuario"
sleep 2
echo "A continuacion debera ingresar el numero o la palabra que desea ver al reves"
echo "Ingresar:"
read rev
echo "Su palabra o numero al reves es:"
sleep 2
echo "$rev" | rev
exit


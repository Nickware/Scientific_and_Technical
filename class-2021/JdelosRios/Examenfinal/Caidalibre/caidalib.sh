#!/bin/bash
#Autor: Juan David de los Rios Mahecha
#fecha: 13/10/21
dialog --title "Galileo" --msgbox "v1.0" 0 0
dialog --title "Objetivo" --msgbox "Una particula se deja caer desde una torre cuya altura es h, con una velocidad inicial de cero, el objetivo de este programa es calcular el tiempo en el que la particula esta cayendo, con  base a una  altura ingresada " 0 0
dialog --title "Nota" --msgbox "A continuacion debera ingresar la altura en metros desde la cual la particula cae, con referencia al suelo" 0 0

dialog --title "altura" --inputbox "Por favor ingresa la altura desde la cual la particula cae, con referencia al suelo (en metros):" 0 0 2>T.txt

T=`cat T.txt`

#Operaciones con bc#
g=$(echo "9.80665*1" | bc -l) 
tf=$(echo "$T*2" | bc -l) 
g=$(echo "9.80665*1" | bc -l) 
s=$(echo "$tf/$g" | bc -l) 
fin=$(echo "sqrt($s)" | bc -l) 



dialog --title "El tiempo en el que la particula cae es de (segundos)" --msgbox "$fin" 0 0

clear



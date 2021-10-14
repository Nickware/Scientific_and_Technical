#!/bin/bash
#Titulo: Orbitas de satelites
#Autor: Juan David de los Rios Mahecha
#Fecha: 12/10/21


dialog --title "Copernico" --msgbox "V1.0" 0 0
dialog --title "Objetivo" --msgbox "Un satelite es lanzado dentro de una orbita circular alrededor de la Tierra, A continuacion, podra ingresar T, donde T es igual al tiempo en el que el satelite completa una vuelta a su orbita" 0 0
dialog --infobox "Espera 4 segundos" 0 0 ; sleep 4


dialog --infobox "Nota" --msgbox "El programa funciona con T, cuando T esta dada en segundos, por ese motivo, se ha implementado un conversor de unidades, de horas y minutos a segundos."
dialog --title "Nota" --msgbox "El programa funciona con T, cuando T esta dada en segundos, por ese motivo, se ha implementado un conversor de unidades, de horas y minutos a segundos." 0 0

dialog --title "Titulo"  --yesno "¿Desea usar el conversor de unidades para T?" 0 0
dialog --menu "¿Por favor, seleccione que unidad de tiempo tiene como base para convertir?": 0 0 0 1 "Horas" 2 "Minutos" 2>Seleccion0.txt
dialog --title "Conversion" --inputbox "Por favor ingresa el valor que deseas convertir:" 0 0 2>datosconv.txt


datosconv=`cat datosconv.txt`
Conversor=`cat Seleccion0.txt`

notify-send "$ConH"

if [ "$Conversor" = "1" ]
then
ConH=$(echo "$datosconv*3600" | bc -l)     
fi
echo "$ConH" >ConH.txt

notify-send "$ConH"


if [ "$Conversor" = "2" ]
then
ConM=$(echo "$datosconv*60" | bc -l)     
fi
echo "$ConM" >ConM.txt

notify-send "$ConM"

dialog --title "Siguiente paso" --msgbox "A continuacion se mostrara un mensaje interactivo, donde debera digitar el correspondiente valor de T en segundos" 0 0
dialog --title "T" --inputbox "ingrese T:" 0 0 2>T.txt


#Espacio para definir variables#
T=`cat T.txt`
var1=$T
var2=$ConvH
var3=$ConvM
var4=6,67*10⁻¹¹   #Constante grav#
var5=5.97*10²⁴    #Masa de la tierra#
var6=6371         #Radio de la tierra#
#Fin del espacio para definir variables#



#Operaciones con bc#
G=$(echo "scale=13; 6.67*10^-11" | bc -l)         #escala 20; G#
echo "$G"
M=$(echo "scale=5; 5.97*10^24" | bc -l)           #MasaTierra#
echo "$M"
T2=$(echo "$T*$T" | bc -l)                        #T²# 
echo "$T2"
res1=$(echo "scale=13;$G*$M" | bc -l)             #G*M# 
echo "$res1"
pi=$(echo "4*a(1)" | bc -l)                       #Se define pi#
echo "$pi"
pi2=$(echo "$pi*$pi" | bc -l)                     #pi²# 
echo "$pi2" 
pi22=$(echo "$pi2*4" | bc -l)                     #4*pi²#
echo "$pi22"
GMT2=$(echo "$G*$M*$T2" | bc -l)                  #GMT2#
echo "$GMT2"
Resul1=$(echo "$GMT2/$pi22" | bc -l)              #Resultado /pi2*4#
echo "$Resul1"
Fin=$(echo "scale=20; e( l($Resul1) / 3 )" | bc -l) 
echo "$Fin"
RT=$(echo "$Fin-6371000" | bc -l)
echo "$RT"
Sol=$(echo "$RT/1000" | bc -l)

dialog --title "La altura del satelite es de (kilometro)" --msgbox "$Sol" 0 0

clear
exit


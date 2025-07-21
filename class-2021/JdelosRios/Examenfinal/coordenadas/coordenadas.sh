#!/bin/bash
#autor: Juan David de los Rios Mahecha
#fecha:13/10/21
#titulo: Hiparco

dialog --title "Hiparco" --msgbox "v1.0" 0 0
dialog --title "Objetivo" --msgbox "Convertir de coordenadas polares a coordenadas cartesianas y de coordenadas cartesianas a coordenadas polares" 0 0
dialog --menu "Por favor, seleccione en que tipo de coordenadas realizara el ingreso para la conversion": 0 0 0 1 "Coordenadas polares" 2 "Coordenadas cartesianas" 2>Seleccion0.txt

selec=`cat Seleccion0.txt`

if [ "$selec" = "2" ]
then
dialog --title "Cartesianas" --inputbox "ingrese las coordenadas cartesianas, ingrese x:" 0 0 2>cartesianasx.txt
dialog --title "Cartesianas" --inputbox "ingrese las coordenadas cartesianas, ingrese y:" 0 0 2>cartesianasy.txt
fi



#variables polares ingresadas"
cartesianasx=`cat cartesianasx.txt`                                                         #coordenada x cartesianas#
cartesianasy=`cat cartesianasy.txt`                                                         #Coordenada y cartesianas#



concarx=$(echo "$cartesianasx^2" | bc -l)                                                   #Inicio conversion a r#
concary=$(echo "$cartesianasy^2" | bc -l)
sumcxcy=$(echo "$concarx+$concary" | bc -l)
fincx=$(echo "sqrt($sumcxcy)" | bc -l)                                                      #Fin conversion a r#

dialog --title "r" --msgbox "$fincx" 0 0


ang=$(echo "$cartesianasy/$cartesianasx" | bc -l)
dialog --title "angulo" --msgbox "$ang" 0 0



clear


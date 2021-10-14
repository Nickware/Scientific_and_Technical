#!/bin/bash
#Formas con Asteriscos
#Author: David Santiago Agudelo Villamizar
#Date: 14/10/2021
#version: 0.0.1

menu=0


echo    
echo "                     ▓———————————————————————————————▓"
echo "                     ▓     Formas con Asteriscos     ▓"
echo "                     ▓———————————————————————————————▓"
echo 
echo 
sleep 2
clear
while [ $menu -ne 5 ] ; do
echo 
echo "                       ¿Qué figura le gustaria ver ?"
echo
echo
echo "1. Cuadrado"
echo "2. Circulo"
echo "3. Flecha"
echo "4. Rombo"
echo "5. salir "
echo 
echo
read -n 1 -s -r -p "" menu


case $menu in 
1) clear
echo 
echo
echo "          *****************"
echo "          *               *"
echo "          *               *"
echo "          *               *"       
echo "          *               *"
echo "          *               *"
echo "          *               *"
echo "          *               *"
echo "          *****************"
echo
sleep 4
clear
;;
2) clear
echo 
echo
echo "                 ***"
echo "             *         *"
echo "           *             *"
echo "          *               *"       
echo "          *               *"
echo "          *               *"
echo "           *             *"
echo "             *         *"
echo "                 ***"
echo
sleep 4
clear
;;
3) clear 
echo 
echo
echo "                  *"
echo "                 * *"
echo "                * * *"
echo "                  *"       
echo "                  *"
echo "                  *"
echo "                  *"
echo "                  *"
echo "                  *"
echo
sleep 4
clear
;;
4) clear  
echo 
echo "                  *"
echo "                 * *"
echo "                *   *"
echo "               *     *"       
echo "              *       *"
echo "               *     *" 
echo "                *   *"
echo "                 * *"
echo "                  *"
echo
sleep 4
clear
;;
5) clear 
echo "Saliendo del programa"
sleep 2
;;
*) clear
echo "Opcion no valida"
sleep 2
clear
;; 
esac 
done 
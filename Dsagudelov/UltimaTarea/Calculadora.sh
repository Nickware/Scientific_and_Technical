#!/bin/bash
#Calculadora basica 
#Author: David Santiago Agudelo Villamizar
#Date: 11/10/2021
#version: 0.0.1

#damos variables
salir=0000
menu=0
menusuma=0
menuresta=0
menumulti=0
menudivi=0
while [ $menu -ne 5 ] ; do   # menu constante en 4 opciones fijas 
echo 
echo
echo "                  ¿Qué operación desea realizar?"
echo
echo "  1. Sumar (+)"
echo "  2. Restar (-)"
echo "  3. Multiplicar (*)"
echo "  4. Dividir (/)"
echo "  5. Salir"
echo
read -p " Seleccione una opción del 1 al 4              " menu
case $menu in # un case para darle la selectividad y lo que tiene que hacer
 
    1) clear 
  
    echo "                  Escogiste sumar "
    sleep 1
    echo
    while [ $menu -ne $salir ] ; do #un while que cumplirar hara ciclico todo hasta que le digan que no
    echo
    echo "Dame el primero numero"
    echo
    read numero1
    echo
    clear
    echo "                          El primer numero es $numero1"
    echo 
    echo
    echo 
    sleep 2
    clear
    echo "Dame el segundo numero"
    echo
    read numero2
    echo 
    echo  "                         El segundo numero es $numero2 "
    sleep 2
    clear
    echo
    resultado1=$(($numero1+$numero2))
    echo 
    echo  "El resultado de $numero1 + $numero2 es: $resultado1 "
    echo
    sleep 3
    clear 
    echo "¿quiere hacer otra suma?"
    echo
    echo "1) si  "
    echo "2) no  "
    read  -p "escriba si o no            " menusuma
    case $menusuma in # la parte donde toma la seleccion y dice si lo hace de nuevo o regresa 
   si) clear
   sleep 2
   ;;
  no)
   break
   
   esac 
   done
    ;;
    2) clear # lo mismo pero para las otras 3 operaciones 
    echo "                  Escogiste restar "
    sleep 1
    echo
    while [ $menu -ne $salir ] ; do 
    echo
    echo "Dame el primero numero"
    echo
    read numero3
    echo
    clear
    echo "                          El primer numero es $numero3"
    echo 
    echo
    echo 
    sleep 2
    clear
    echo "Dame el segundo numero"
    echo
    read numero4
    echo 
    echo  "                         El segundo numero es $numero4 "
    sleep 2
    clear
    echo
    resultado2=$(($numero3-$numero4))
    echo 
    clear
    echo  "El resultado de $numero3 - $numero4 es: $resultado2 "
    echo
    sleep 3
    clear 
    echo "¿quiere hacer otra resta?"
    echo
    echo "1) si "
    echo "2) no  "
    read  -p "escriba si o no            " menuresta
    case $menuresta in
   si) clear
   sleep 2
   ;;
   no) clear
   
   break
    ;;
   esac 
   done 
    
    ;;
    3) clear 
    echo "                  Escogiste multiplicar "
    sleep 1
    echo
    while [ $menu -ne $salir ] ; do 
    echo
    echo "Dame el primero numero"
    echo
    read numero5
    echo
    clear
    echo "                          El primer numero es $numero5"
    echo 
    echo
    echo 
    sleep 2
    clear
    echo "Dame el segundo numero"
    echo
    read numero6
    echo 
    echo  "                         El segundo numero es $numero6 "
    sleep 2
    clear
    echo
    resultado3=$(($numero5 * $numero6))
    echo 
    echo  "El resultado de $numero5 * $numero6 es: $resultado3 "
    echo
    sleep 4
    clear 
    echo "¿quiere hacer otra multiplicacion?"
    echo
    echo "1) si  "
    echo "2) no  "
    read  -p "seleccione si o no " menumulti
    case $menumulti in
   si) clear 
   sleep 2
   ;;
   no) clear
   break
    ;;
   esac 
   done 
    ;;
    4) clear 
    echo "                  Escogiste dividir "
    sleep 1
    echo
    while [ $menu -ne $salir ] ; do 
    echo
    echo "Dame el primero numero"
    echo
    read numero7
    echo
    clear
    echo "                          El primer numero es $numero7"
    echo 
    echo
    sleep 2
    clear
    echo "Dame el segundo numero"
    echo
    read numero8
    echo 
    echo  "                         El segundo numero es $numero8 "
    sleep 2
    clear
    echo
    resultado4=$(($numero7/$numero8))
    echo 
    echo  "El resultado apoximanado a un entero  de $numero7 / $numero8 es: $resultado4 "
    echo
    sleep 4
    clear 
    echo "¿quiere hacer otra divisi?"
    echo
    echo "1) si  "
    echo "2) no "
    read  -p "escriba si o no               " menudivi
    case $menudivi in
   si) sleep 2
   ;;
   no) clear
   break
    ;;
   esac 
   done 
    ;;
     
    
esac 
done 

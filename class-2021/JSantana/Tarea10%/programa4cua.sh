#!/usr/bin/bash
#titulo:calcula raices de un trinomio cuadrado AX^2+BX+C=0
#autor: Justin Santana, Laura Sofia Cortes, Juan Sebastian Sanchez
#version:0.0.01

#inicio del programa
echo "Bienvenido al programa que calcula las raices de un trinomio cuadrado AX^2+BX+C=0"
echo -e "Ingrese el termino A"
read varA                                               #leer variabre A
echo -e "Ingrese el termino B"
read VarB                                               #leer variabre B
echo -e "Ingrese el termino C"
read VarC                                               #leer variabre C
#determinando operaciones por debajo
B2=$(echo "$VarB^2" | bc -l)                           #B al cuadrado
ac=$(echo "4*$varA*$VarC" | bc -l)                     #A por C 
Dis=$(echo "$B2-$ac" | bc -l)                          #determinar discriminante b al cuadrado menos a por c

echo "Sus terminos son A=$varA,B=$VarB y C=$VarC"     #definiendo coeficientes
if [[ $Dis -lt 0 ]];                                  #si el discriminante es menor a 0
then                                                  #entonces muestre lo siguiente
echo "El discriminante es: $Dis"
echo "Por lo tanto no tine solucion en los numeros reales"
#de lo contrario (discriminante mayor o igual a 0)
else                    
raiz=$(echo "sqrt($Dis)" | bc -l)                  #hallando la raiz cuadrada del discriminante
#operaciones de por debajo
abajo=$(echo "$varA*2" | bc -l)                    
mb=$(echo "$VarB-$VarB*2" | bc -l)                  
rmas=$(echo "($mb+$raiz)/$abajo" | bc -l)
rmenos=$(echo "($mb-$raiz)/$abajo" | bc -l)    
#muestre lo siguiente
echo "El discriminante es: $Dis"
echo "Por lo tanto tiene racices reales"
echo "La primera raiz es x1=$rmas"
echo "La segunda raiz es x2=$rmenos"
fi                                                   #final del programa
echo "Gracias por usar el programa :)"
#!/usr/bin/bash
#autor:justin santana
#VERSION:0.01
#titulo:calcula raices de un trinomio cuadrado perfecto AX^2+BX+C=0


echo "programa que calcula raices de un trinomio cuadrado perfecto AX^2+BX+C=0 "
echo -e "ingrese el termino A"
read varA
echo -e "ingrese el termino B"
read VarB
echo -e "ingrese el termino C"
read VarC

B2=$(echo "$VarB^2" | bc -l)
ac=$(echo "4*$varA*$VarC" | bc -l)
Dis=$(echo "$B2-$ac" | bc -l) 


echo "sus terminos son A=$varA,B=$VarB y C=$VarC"
if [[ $Dis -lt 0 ]];
then
echo "el discriminante es: $Dis"
echo "por lo tanto no tinen solucion en los numeros reales"

else                    
raiz=$(echo "sqrt($Dis)" | bc -l)
abajo=$(echo "$varA*2" | bc -l)
mb=$(echo "$VarB-$VarB*2" | bc -l)
rmas=$(echo "($mb+$raiz)/$abajo" | bc -l)
rmenos=$(echo "($mb-$raiz)/$abajo" | bc -l)               
echo "el discriminante es: $Dis"
echo "por lo tanto tienen solucion en los numeros reales"
echo "una posible raiz es x=$rmas"
echo "una posible raiz es x=$rmenos"
fi

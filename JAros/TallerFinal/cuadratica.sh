#!/usr/bin/bash.exe

#Title: Raices de una ecuacion 
#Authors: Julián Aros, Marcos Torres, Norman Romero
#Version: 1.2

echo "¡Bienvenido! Este programa calcula las soluciones de una ecuación de segundo grado"
echo "ax^2+bx+c=0"
echo "El valor que tome -a- debe ser diferente de cero, ya que no seria una ecuación cuadrática"
echo -e "Por favor ingrese el valor de a: "
read a
if [[ ( $a -eq 0  ) ]]
then
echo "Ingrese un valor para -a- diferente de cero"
exit 0;
fi

echo -e "Por favor ingrese el valor de b: "
read b
echo -e "Por favor ingrese el valor de c: "
read c
echo "Los valores ingresados de a, b y c respectivamente son: $a $b $c"

d=$(( ($b)*($b)-4*($a)*($c) )); #Cálculo del discriminante

if [ $d -eq 0 ]; then
echo "Valor discriminante:"
echo -e "scale=5; -0.5*($b)/($a)" | bc #Caso hipotético, si el usuario llegara a meter valores que hicieran que nuestro discriminante fuera cero
exit 0;
fi

echo "Valor discriminante:"
echo $d

if [ $d -gt 0 ]; then #cuando el discriminante es mayor que cero
echo -n "solucion 1 = "
echo -e "scale=5; 0.5*(-($b)+sqrt($d))/($a)" | bc
echo -n "solucion 2 = "
echo -e "scale=5; 0.5*(-($b)-sqrt($d))/($a)" | bc
else                                                #Cuando el discriminante es menor que cero
echo -n "solucion 1 = ("
echo -e "scale=5; -0.5*($b)/($a)" |bc
echo -n ", "
echo -e "scale=5; 0.5*sqrt(-($d))/($a)" | bc 
echo ")"
echo -n "solucion 2 = ("
echo -e "scale=5; -0.5*($b)/($a)" | bc
echo -n ", "
echo -e "scale=5; 0.5*sqrt(-($d))/($a)" | bc
echo ")"

fi

echo "Gracias por utilizar esta calculadora"

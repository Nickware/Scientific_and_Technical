# Autor: Jorge Garzón
# Fecha: 9/10/2021
# Programa que calcule las raices de una ecuación

clear
echo "Bienvenido al programa que calcula las raíces de una ecuación"
echo ""
echo "Ingrese los valores de los coeficientes de teniendo organizada la ecuación"
echo -e "Ingrese el valor de A"
read A 
echo -e "Ingrese el valor de B"
read B 
echo -e "Ingrese el valor de C"
read C

echo "Determinante de la ecuacion"

# modelo matematico del determinante
Determinante= $(expr $B * $B - 4 * $A * $C)

if [ $Determinante -lt 0 ]
then 
echo "El determinante es menor que 0 por lo tanto la solucion es compleja"
else 

	X1= $(echo - "$B + sqrt($B * $B - 4 * $A * $C ) / 2 * $A" | bc -l )
    X2= $(echo - "$B - sqrt($B * $B - 4 * $A * $C ) / 2 * $A" | bc -l)
	echo "El resultado x1 es:$X1"
	echo "El resultado x2 es:$X2"

fi


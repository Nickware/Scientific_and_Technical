#!/usr/bin/bash
#autor:Sofia Cortes
#VERSION:0.01
#titulo:calculadora que suma, resta multiplica y divide entre dos digitos
siono="1"
while [ "$siono" -eq "1" ]
do
echo "Calculadora que suma, resta multiplica y divide"
echo "Nota:Si decea salir digite 0 en cada pregunta"
echo "1=suma, 2=resta, 3=division y 4=multiplicacion"
echo -e "Digite el numero segun la opreacion que desee"
read operacion
echo -e "digite el primer digito"
read var1
echo -e "digite el segundo digito"
read var2
if [ $operacion == "1" ] 
then
echo "suma de $var1 y $var2"
suma=$(echo "$var1+$var2" | bc -l)
echo "su sumatoria es: $suma" 
elif [ $operacion == "2" ]  
then 
echo "resta de $var1 y $var2"
resta=$(echo "$var1-$var2" | bc -l)
echo "su resta es: $resta"
elif [ $operacion == "3" ] 
then 
echo "resta de $var1 y $var2"
division=$(echo "$var1/$var2" | bc -l)
echo "su division es: $division"
elif [ $operacion == "4" ] 
then 
echo "resta de $var1 y $var2"
multiplicacion=$(echo "$var1*$var2" | bc -l)
echo "su multiplicacion es es: $multiplicacion"
else
siono="0"
fi
done
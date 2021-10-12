# Autor: Jorge Garzon
# Fecha: 5/10/2021
# Titulo: Calculadora
# C:\Program Files\Git\usr\bin\bash.exe

falg="1"
while [ "$falg" -eq "1" ]
do
echo "CALCULADORA BASICA"
echo "Seleccione el número segun lo que desee hacer:"
echo "1: indica adición"
echo "2: indica resta"
echo "3: significa multiplicación"
echo "4: significa división"
echo "5: ¡Sal de la calculadora!"
read check
echo "Valor: $check"
if [ "$check" -eq "1" ]
then
	echo "Ingrese el primer número:"
	read a
	echo "Ingrese el segundo número:"
	read b
	result=`expr $a + $b`
	echo "El resultado es:$result"
elif [ "$check" -eq "2" ]
then
	echo "Ingrese el primer número:"
	read a
	echo "Ingrese el segundo número:"
	read b
	result=`expr $a - $b`
	echo "El resultado es:$result"
elif [ "$check" -eq "3" ]
then
	echo "Ingrese el primer número:"
	read a
	echo "Ingrese el segundo número:"
	read b
	result=`expr $a \* $b`
	echo "El resultado es:$result"
elif [ "$check" -eq "4" ]
then
	echo "Ingrese el primer número:"
	read a
	echo "Ingrese el segundo número:"
	read b
	result=`expr $a / $b`
	echo "El resultado es:$result"
else
	falg="0"
fi
done
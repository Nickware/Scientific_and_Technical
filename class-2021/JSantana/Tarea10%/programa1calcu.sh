#!/usr/bin/bash
#Title: Programa calculadora: suma, resta multiplica y divide entre dos digitos
#autor: Laura Sofia Cortes Rodriguez
#version:0.0.1

#inicio programa
siono="1"
while [ "$siono" -eq "1" ]
do
    echo "Bienvenido a la calculadora que suma, resta, multiplica y divide"
    echo "Nota: Si decea salir digite 0 en cada pregunta hasta que salga del programa"
    echo "Teniendo en cuenta que: 1=suma, 2=resta, 3=division y 4=multiplicacion"
    echo -e "Digite el numero segun la opreacion que desee"
    read operacion                                         #pide operación a realizar
    echo -e "Digite el primer numero a operar"
    read var1                                              #pide primera variable (primer numero)
    echo -e "Digite el segundo numero a operar"
    read var2                                              #pide segunda variable (segundo numero)
    #si es suma
    if [ $operacion == "1" ]                              #si la operacon elegida es 1
    then                                                  #entonces haga lo siguiente
    echo "Suma de $var1 y $var2"
    suma=$(echo "$var1+$var2" | bc -l)                     #sumar variable 1 + variable 2
    echo "La suma es: $suma" 
    #si es resta
    elif [ $operacion == "2" ]                             #si la operacon elegida es 2
    then                                                  #entonces haga lo siguiente
    echo "Resta de $var1 y $var2"
    resta=$(echo "$var1-$var2" | bc -l)                   #restar variable 1 - variable 2
    echo "La resta es: $resta"
    #si es division
    elif [ $operacion == "3" ]                           #si la operacon elegida es 3
    then                                                  #entonces haga lo siguiente
    echo "La variable 2 debe ser diferente de 0"
    echo "Divisón de $var1 entre $var2"
    division=$(echo "$var1/$var2" | bc -l)               #dividir variable 1 entre variable 2
    #si es multiplicacion
    elif [ $operacion == "4" ]                            #si la operacon elegida es 4
    then                                                  #entonces haga lo siguiente
    echo "Multiplicación de $var1 por $var2"
    multiplicacion=$(echo "$var1*$var2" | bc -l)          #multiplicar variable 1 por variable 2
    echo "La multiplicacion es : $multiplicacion"
else
siono="0"                                            
fi
echo "Gracias por usar la calculadora. Fin"
done
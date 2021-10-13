#!/usr/bin/bash.exe

# Title: Una bola lanzada desde una torre
# Authors: Juan Sebastian Manrique Moreno, Manuel Augusto Marroquín Torres
# Date: 14/10/2021
# Version: 4.4.12(3)-release (x86_64-unknown-cygwin)

while true
do
    clear
    echo "                                    Bienvenido a la calculadora de caída libre"
    echo "Este programa está diseñado para el cálculo de una pelota cayendo desde una altura 'h', donde dicha altura es equivalente"
    echo "a la altura de una torre, lugar de donde será lanzada la pelota. También se tomará desde una altura superior, donde dicha"
    echo "altura superior será equivalente a la estatura de la persona que lo lance, en este caso, de quien ejecute el programa."
    echo ""
    echo -n "A continuación, digite la altura 'h' en metros: "
    read h
    echo -n "A continuación, digite su estatura en metros: "
    read e

    negativo_h=${h:0:1}
    negativo_e=${e:0:1}

    if [ "$negativo_h" == "-" ] || [ "$negativo_e" == "-" ] 
    then
        echo ""
        echo "No están permitidos valores negativos para la altura y estatura, por favor vuelvalos a indicar"
        echo ""
        echo "Reejecutando..."
        sleep 5
    else
        t1=$(echo "scale=5; sqrt((2 * $h) / 9.8)" | bc -l)
        t2=$(echo "scale=5; sqrt((2 * ($h + $e)) / 9.8)"| bc -l)

        if [ "$t1" == "0" ] || [ "$t2" == "0" ]
        then
            echo ""
            echo "Caracter inválido, por favor vuelva a indicar la altura y estatura"
            echo ""
            echo "Reejecutando..."
            sleep 5
        else
            echo ""
            echo "Calculando..."
            sleep 5
            echo ""

            echo "Primer caso dejando caer desde la altura 'h' de la torre"
            echo "El valor del tiempo (t) es igual a: $t1 segundos"
            echo ""
            echo "Segundo caso dejando caer desde la altura de la torre más la estatura del usuario"
            echo "El valor del tiempo (t) es igual a: $t2 segundos"

            echo ""
            echo "Gracias por ejecutar nuestro programa, vuelva pronto."
            echo ""
            echo "Saliendo..."
            sleep 3
            exit 0
        fi
    fi
done
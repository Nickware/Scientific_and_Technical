#!/usr/bin/bash.exe

# Title: Una bola lanzada desde una torre
# Authors: Juan Sebastian Manrique Moreno, Manuel Augusto Marroquín Torres
# Date: 14/10/2021
# Version: 4.4.12(3)-release (x86_64-unknown-cygwin)

while true # Ciclo infinito, esto permite reejecuciones del programa a menos que se llame a la función 'exit 0'
do
    clear # Limpia la terminal, usado para una mejor experiencia de usuario
    echo "                                    Bienvenido a la calculadora de caída libre"
    echo "Este programa está diseñado para el cálculo de una pelota cayendo desde una altura 'h', donde dicha altura es equivalente"
    echo "a la altura de una torre, lugar de donde será lanzada la pelota. También se tomará desde una altura superior, donde dicha"
    echo "altura superior será equivalente a la estatura de la persona que lo lance, en este caso, de quien ejecute el programa."
    echo ""
    echo -n "A continuación, digite la altura 'h' en metros: "
    read h # Solicitud y lectura del valor solicitado (h)
    echo -n "A continuación, digite su estatura en metros: "
    read e # Solicitud y lectura del valor solicitado (e)

    # Aplicando el manejo de una cadena de texto, se extrae el primer caracter y se guarda en una variable

    negativo_h=${h:0:1}
    negativo_e=${e:0:1}

    if [ "$negativo_h" == "-" ] || [ "$negativo_e" == "-" ] # Si dicho primer caracter es igual a "-" arroja error y reejecuta
    then
        echo ""
        echo "No están permitidos valores negativos para la altura y estatura, por favor vuelvalos a indicar"
        echo ""
        echo "Reejecutando..."
        sleep 5 # Delay o tiempo de espera de 5 segundos, usado para una mejor experiencia de usuario
    elif [ "$h" == "0" ] && [ "$e" == "0" ] # Si los valores ingresados son 0, indica que el tiempo es 0 y termina el programa
    then
        echo ""
        echo "Para ambos casos el tiempo es nulo, es decir, equivalente a 0."

        echo ""
        echo "Gracias por ejecutar nuestro programa, vuelva pronto."
        echo ""
        echo "Saliendo..."
        sleep 3 # Delay o tiempo de espera de 3 segundos, usado para una mejor experiencia de usuario
        exit 0 # Función de terminación del programa
    else # Sino se cumplen ambas condiciones, sigue ejecutando con normalidad pero con una condición especial
        t1=$(echo "scale=5; sqrt((2 * $h) / 9.8)" | bc -l) # Operación para caso 1
        t2=$(echo "scale=5; sqrt((2 * ($h + $e)) / 9.8)"| bc -l) # Operación para caso 2

        # Debido a que de ninguna manera el valor de tiempo puede ser 0, a excepción del primer caso, pero aún así en el segundo caso
        # no puede ser 0, descartando que ambos valores sean 0 con la condición número 2 puesta dentro del programa, por ende, según
        # el funcionamiento del comando bc, cuando se ingresa una letra, se toma como valor nulo, es decir, se toma como 0, arrojando
        # que alguno de las dos operaciones para cada caso sea 0, por ende, un error en la escritura de los datos.

        if [ "$t1" == "0" ] || [ "$t2" == "0" ] # Si alguna operación es igual a 0 arroja error y reejecuta
        then
            echo ""
            echo "Caracter inválido, por favor vuelva a indicar la altura y estatura"
            echo ""
            echo "Reejecutando..."
            sleep 5 # Delay o tiempo de espera de 5 segundos, usado para una mejor experiencia de usuario
        else # Sino se cumple la condición, sigue ejecutando con normalidad
            echo ""
            echo "Calculando..."
            sleep 5 # Delay o tiempo de espera de 5 segundos, usado para una mejor experiencia de usuario
            echo ""

            echo "Primer caso dejando caer desde la altura 'h' de la torre"
            echo "El valor del tiempo (t) es igual a: $t1 segundos" # Impresión del valor del tiempo para el primer caso
            echo ""
            echo "Segundo caso dejando caer desde la altura de la torre más la estatura del usuario"
            echo "El valor del tiempo (t) es igual a: $t2 segundos" # Impresión del valor del tiempo para el segundo caso

            echo ""
            echo "Gracias por ejecutar nuestro programa, vuelva pronto."
            echo ""
            echo "Saliendo..."
            sleep 3 # Delay o tiempo de espera de 3 segundos, usado para una mejor experiencia de usuario
            exit 0 # Función de terminación del programa
        fi
    fi
done

# 'fi' y 'done' indican la terminación de los condicionales y el ciclo respectivamente
#!/usr/bin/bash.exe

# Title: Convirtiendo coordenadas polares
# Authors: Juan Sebastian Manrique Moreno, Manuel Augusto Marroquín Torres
# Date: 14/10/2021
# Version: 4.4.12(3)-release (x86_64-unknown-cygwin)

while true
do
    clear
    echo "                      Bienvenido a el conversor de coordenadas"
    echo ""
    echo "Por favor, indique que tipo de conversión desea hacer, si de cartesiano a polar o biceversa"
    echo ""
    echo "                                 ----- MENÚ -----"
    echo "                             1. Cartesianas a polares."
    echo "                             2. Polares a cartesianas."
    echo "                             3. Salir del programa."
    echo ""
    echo -n "Digite el número del tipo de conversión que desee realizar: "
    read conversion

    if [ "$conversion" == "1" ]
    then
        echo "A continuación, digite los valores de 'x' y 'y' que desea convertir"
        echo -n "Valor de 'x': "
        read val_x
        echo -n "Valor de 'y': "
        read val_y

        val_r=$(echo "scale=5; sqrt(($val_x * $val_x) + ($val_y * $val_y))" | bc -l)
        val_theta=$(echo "scale=5; a($val_y / $val_x)" | bc -l)

        echo ""
        echo "Calculando..."
        sleep 5
        echo ""

        echo "El valor de 'r' es igual a: $val_r"
        echo "El valor de 'theta' es igual a: $val_theta radianes"

        echo ""
        echo "Gracias por ejecutar nuestro programa, vuelva pronto."
        echo ""
        echo "Saliendo..."
        sleep 3
        exit 0
    elif [ "$conversion" == "2" ]
    then
        echo "A continuación, digite los valores de 'r' y 'theta' que desea convertir"
        echo -n "Valor de 'r': "
        read val_r

        while true
        do
            echo -n "Previamente, indique si theta está en radianes (r) o en grados (g), para ello digite la letra que corresponda: "
            read
            type=${REPLY^^}
            echo -n "Valor de 'theta': "
            read val_theta

            if [ "$type" == "R" ]
            then
                val_x=$(echo "scale=5; $val_r * c($val_theta)" | bc -l)
                val_y=$(echo "scale=5; $val_r * s($val_theta)" | bc -l)

                echo ""
                echo "Calculando..."
                sleep 5
                echo ""

                echo "El valor de 'x' es igual a: $val_x"
                echo "El valor de 'y' es igual a: $val_y"

                echo ""
                echo "Gracias por ejecutar nuestro programa, vuelva pronto."
                echo ""
                echo "Saliendo..."
                sleep 3
                exit 0
            elif [ "$type" == "G" ]
            then
                pi=$(echo "scale=5; 4*a(1)" | bc -l)
                rad=$(echo "scale=5; ($val_theta / 180) * $pi" | bc -l)

                val_x=$(echo "scale=5; $val_r * c($rad)" | bc -l)
                val_y=$(echo "scale=5; $val_r * s($rad)" | bc -l)
            
                echo ""
                echo "Calculando..."
                sleep 5
                echo ""

                echo "El valor de 'x' es igual a: $val_x"
                echo "El valor de 'y' es igual a: $val_y"

                echo ""
                echo "Gracias por ejecutar nuestro programa, vuelva pronto."
                echo ""
                echo "Saliendo..."
                sleep 3
                exit 0
            else
                echo ""
                echo "Caracter inválido, por favor vuelva a indicar que tipo de representación desea usar"
                echo ""
                echo "Reejecutando..."
                sleep 3
            fi
        done
    elif [ "$conversion" == "3" ]
    then
        echo ""
        echo "Gracias por ejecutar nuestro programa, vuelva pronto."
        echo ""
        echo "Saliendo..."
        sleep 3
        exit 0
    else
        echo ""
        echo "Caracter inválido, por favor vuelva a indicar que tipo de conversión desea realizar"
        echo ""
        echo "Reejecutando..."
        sleep 3
    fi
done
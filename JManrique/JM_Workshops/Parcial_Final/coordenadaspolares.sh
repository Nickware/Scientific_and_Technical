#!/usr/bin/bash.exe

# Title: Convirtiendo coordenadas polares
# Authors: Juan Sebastian Manrique Moreno, Manuel Augusto Marroquín Torres
# Date: 14/10/2021
# Version: 4.4.12(3)-release (x86_64-unknown-cygwin)

while true # Ciclo infinito, esto permite reejecuciones del programa a menos que se llame a la función 'exit 0'
do 
    clear # Limpia la terminal, usado para una mejor experiencia de usuario
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
    read conversion # Solicitud y lectura del valor solicitado (conversion)

    if [ "$conversion" == "1" ] # Si el valor solicitado es igual a 1, ejecutar el programa dentro de la condición
    then
        echo ""
        echo "A continuación, digite los valores de 'x' y 'y' que desea convertir"
        echo -n "Valor de 'x': "
        read val_x # Solicitud y lectura del valor solicitado (val_x)
        echo -n "Valor de 'y': "
        read val_y # Solicitud y lectura del valor solicitado (val_y)

        val_r=$(echo "scale=5; sqrt(($val_x * $val_x) + ($val_y * $val_y))" | bc -l) # Operación para calcular el valor de r
        val_theta=$(echo "scale=5; a($val_y / $val_x)" | bc -l) # Operación para calcular el valor de theta

        echo ""
        echo "Calculando..."
        sleep 5 # Delay o tiempo de espera de 5 segundos, usado para una mejor experiencia de usuario
        echo ""

        echo "El valor de 'r' es igual a: $val_r" # Impresión del valor de r
        echo "El valor de 'theta' es igual a: $val_theta radianes" # Impresión del valor de theta

        echo ""
        echo "Gracias por ejecutar nuestro programa, vuelva pronto."
        echo ""
        echo "Saliendo..."
        sleep 3 # Delay o tiempo de espera de 3 segundos, usado para una mejor experiencia de usuario
        exit 0 # Función de terminación del programa
    elif [ "$conversion" == "2" ] # Si el valor solicitado es igual a 2, ejecutar el programa dentro de la condición
    then
        echo ""
        echo "A continuación, digite los valores de 'r' y 'theta' que desea convertir"
        echo -n "Valor de 'r': "
        read val_r # Solicitud y lectura del valor solicitado (val_r)

        while true # Ciclo infinito, esto permite reejecuciones del programa a menos que se llame a la función 'exit 0'
        do
            echo ""
            echo -n "Previamente, indique si theta está en radianes (r) o en grados (g), para ello digite la letra que corresponda: "
            read # Solicitud y lectura del valor solicitado
            type=${REPLY^^} # Convierte el último valor leído en mayúscula siempre, esto evita errores de escritura

            if [ "$type" == "R" ] # Si la variable 'type' es igual a R, ejecutar el programa dentro de la condición
            then
                echo -n "Valor de 'theta': "
                read val_theta # Solicitud y lectura del valor solicitado (val_theta)

                val_x=$(echo "scale=5; $val_r * c($val_theta)" | bc -l) # Operación para calcular el valor de x
                val_y=$(echo "scale=5; $val_r * s($val_theta)" | bc -l) # Operación para calcular el valor de y

                echo ""
                echo "Calculando..."
                sleep 5 # Delay o tiempo de espera de 5 segundos, usado para una mejor experiencia de usuario
                echo ""

                echo "El valor de 'x' es igual a: $val_x" # Impresión del valor de x
                echo "El valor de 'y' es igual a: $val_y" # Impresión del valor de y

                echo ""
                echo "Gracias por ejecutar nuestro programa, vuelva pronto."
                echo ""
                echo "Saliendo..."
                sleep 3 # Delay o tiempo de espera de 3 segundos, usado para una mejor experiencia de usuario
                exit 0 # Función de terminación del programa
            elif [ "$type" == "G" ] # Si la variable 'type' es igual a G, ejecutar el programa dentro de la condición
            then
                echo -n "Valor de 'theta': "
                read val_theta # Solicitud y lectura del valor solicitado (val_theta)

                pi=$(echo "scale=5; 4*a(1)" | bc -l) # Operación para definir la constante pi
                rad=$(echo "scale=5; ($val_theta / 180) * $pi" | bc -l) # Operación para convertir grados a radianes

                val_x=$(echo "scale=5; $val_r * c($rad)" | bc -l) # Operación para calcular el valor de x
                val_y=$(echo "scale=5; $val_r * s($rad)" | bc -l) # Operación para calcular el valor de y
            
                echo ""
                echo "Calculando..."
                sleep 5 # Delay o tiempo de espera de 5 segundos, usado para una mejor experiencia de usuario
                echo ""

                echo "El valor de 'x' es igual a: $val_x" # Impresión del valor de x
                echo "El valor de 'y' es igual a: $val_y" # Impresión del valor de y

                echo ""
                echo "Gracias por ejecutar nuestro programa, vuelva pronto."
                echo ""
                echo "Saliendo..."
                sleep 3 # Delay o tiempo de espera de 3 segundos, usado para una mejor experiencia de usuario
                exit 0 # Función de terminación del programa
            else # Sino se cumplen ambas condiciones, arroja error y reejecuta el programa
                echo ""
                echo "Caracter inválido, por favor vuelva a indicar que tipo de representación desea usar"
                echo ""
                echo "Reejecutando..."
                sleep 3 # Delay o tiempo de espera de 3 segundos, usado para una mejor experiencia de usuario
            fi
        done
    elif [ "$conversion" == "3" ] # Si el valor solicitado es igual a 3, ejecutar el programa dentro de la condición
    then
        echo ""
        echo "Gracias por ejecutar nuestro programa, vuelva pronto."
        echo ""
        echo "Saliendo..."
        sleep 3 # Delay o tiempo de espera de 3 segundos, usado para una mejor experiencia de usuario
        exit 0 # Función de terminación del programa
    else # Sino se cumplen ambas condiciones, arroja error y reejecuta el programa
        echo ""
        echo "Caracter inválido, por favor vuelva a indicar que tipo de conversión desea realizar"
        echo ""
        echo "Reejecutando..."
        sleep 3 # Delay o tiempo de espera de 3 segundos, usado para una mejor experiencia de usuario
    fi
done

# 'fi' y 'done' indican la terminación de los condicionales y los ciclos respectivamente
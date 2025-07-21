#!/usr/bin/bash.exe

# Title: Lista de cuadrados cubos
# Authors: Juan Sebastian Manrique Moreno, Manuel Augusto Marroquín Torres
# Date: 14/10/2021
# Version: 4.4.12(3)-release (x86_64-unknown-cygwin)

while true # Ciclo infinito, esto permite reejecuciones del programa a menos que se llame a la función 'exit 0'
do
    clear # Limpia la terminal, usado para una mejor experiencia de usuario
    echo "        Bienvenido a la calculadora de potencias"
    echo "A continuación, se le solicitará el rango de números a operar"
    echo ""
    echo -n "Ingrese el primer valor del rango a calcular: "
    read primero # Solicitud y lectura del valor solicitado (primero)
    let primero=${primero} # Transfornación de la variable a número
    echo -n "Ingrese el segundo valor del rango a calcular: "
    read segundo # Solicitud y lectura del valor solicitado (primero)
    let segundo=${segundo} # Transformación de la variable a número

    if [ $primero -lt $segundo ] # Si la variable 'primero' es menor que la variable 'segundo', ejecutar el programa dentro de la condición
    then
        echo ""
        echo "Calculando..."
        sleep 5 # Delay o tiempo de espera de 5 segundos, usado para una mejor experiencia de usuario
        echo ""

        echo "======================================================"
        echo "Numero          Cuadrado        Cubo            Cuarta"
        echo ""
        let i=${primero} # Se declara a la variable 'primero' como un contador númerico además como operador

        while [ $i -le $segundo ] # Ciclo mientras que la variable 'i' sea menor o igual que 'segundo'
        do
            let power2=($i*$i) # Operación para calcular el cuadrado de i
            let power3=($i*$i*$i) # Operación para calcular el cubo de i
            let power4=($i*$i*$i*$i) # Operación para calcular i elevada a la cuarta potencia
            echo -e " ${i} \t\t $power2 \t\t $power3 \t\t $power4" # Impresión de los valores de i obtenidos
            ((i++)) # Contador i+1, útil para el avance del ciclo y del programa, sin él el ciclo sería infinito
        done

        echo "======================================================"

        echo ""
        echo "Gracias por ejecutar nuestro programa, vuelva pronto."
        echo ""
        echo "Saliendo..."
        sleep 3 # Delay o tiempo de espera de 3 segundos, usado para una mejor experiencia de usuario
        exit 0 # Función de terminación del programa
    else # Sino se cumple la condición, arroja error y reejecuta el programa
        echo ""
        echo "Rango de valores invalido, ingreselos nuevamente"
        echo ""
        echo "Reejecutando..."
        sleep 5 # Delay o tiempo de espera de 5 segundos, usado para una mejor experiencia de usuario
    fi
done

# 'fi' y 'done' indican la terminación de los condicionales y los ciclos respectivamente
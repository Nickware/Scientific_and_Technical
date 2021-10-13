#!/usr/bin/bash.exe

# Title: Lista de cuadrados cubos
# Authors: Juan Sebastian Manrique Moreno, Manuel Augusto Marroquín Torres
# Date: 14/10/2021
# Version: 4.4.12(3)-release (x86_64-unknown-cygwin)

while true
do
    clear
    echo "        Bienvenido a la calculadora de potencias"
    echo "A continuación, se le solicitará el rango de números a operar"
    echo ""
    echo -n "Ingrese el primer valor del rango a calcular: "
    read primero
    let primero=${primero} 
    echo -n "Ingrese el segundo valor del rango a calcular: "
    read segundo
    let segundo=${segundo}

    if [ $primero -lt $segundo ]
    then
        echo ""
        echo "Calculando..."
        sleep 5
        echo ""

        echo "======================================================"
        echo "Numero          Cuadrado        Cubo            Cuarta"
        echo ""
        let i=${primero}

        while [ $i -le $segundo ]
        do
            let power2=($i*$i) 
            let power3=($i*$i*$i)
            let power4=($i*$i*$i*$i)
            echo -e " ${i} \t\t $power2 \t\t $power3 \t\t $power4"
            ((i++))
        done

        echo "======================================================"

        echo ""
        echo "Gracias por ejecutar nuestro programa, vuelva pronto."
        echo ""
        echo "Saliendo..."
        sleep 3
        exit 0
    else
        echo ""
        echo "Rango de valores invalido, ingreselos nuevamente"
        echo ""
        echo "Reejecutando..."
        sleep 5
    fi
done
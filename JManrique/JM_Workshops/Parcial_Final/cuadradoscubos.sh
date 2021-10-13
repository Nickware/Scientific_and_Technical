#!/usr/bin/bash.exe

# Title: Lista de cuadrados cubos
# Authors: Juan Sebastian Manrique Moreno, Manuel Augusto Marroquín Torres
# Date: 14/10/2021
# Version: 4.4.12(3)-release (x86_64-unknown-cygwin)

while true
do
    echo -n "ingrese el primer valor del rango a calcular: "
    read primero
    let primero=${primero} 
    echo -n "ingrese el segundo valor del rango a calcular: "
    read segundo
    let segundo=${segundo}
    if [ $primero -lt $segundo ] # -lt menor que en números 
    then
        echo "Numero  Cuadrado Cubo  Cuarta"
        let i=${primero} # con let decimos que la variable i es un numero entero
        while [ $i -le $segundo ] # -le menor o igual que en comparación de números
        do
            let "power2 = i*i" 
            let "power3 = i*i*i"
            let "power4 = i*i*i*i"
            echo -e "${i} \t $power2 \t $power3 \t $power4" # -e para validar los espcios entre columnas
            ((i++))
        done
        exit 0
    else
        echo ""
        echo "rango de valores invalido, ingreselos nuevamente"
        echo ""
    fi
    
done
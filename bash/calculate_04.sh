#!/usr/bin/env bash
# Author: NTorres 
# Date: 20 Jul 2025
# Version: 0.3

# Definir la constante pi con precisión
pi=$(echo "scale=10; 4*a(1)" | bc -l)

echo "Programa para calcular el volumen de figuras geométricas (SI: metros, metros cúbicos)"
echo "Seleccione la figura:"
echo "1) Cilindro"
echo "2) Esfera"
read -p "Ingrese el número de opción: " opcion

# Función para validar entrada numérica positiva
validar_numero() {
    local numero
    read -p "$1" numero
    while ! [[ "$numero" =~ ^[0-9]*\.?[0-9]+$ ]] || (( $(echo "$numero <= 0" | bc -l) )); do
        echo "Entrada inválida. Ingrese un valor numérico positivo:"
        read -p "$1" numero
    done
    echo "$numero"
}

case $opcion in
    1)
        # Cálculo de cilindro
        radio=$(validar_numero "Ingrese el radio del cilindro (en metros): ")
        altura=$(validar_numero "Ingrese la altura del cilindro (en metros): ")
        baseArea=$(echo "$pi * $radio * $radio" | bc -l)
        volumen=$(echo "$baseArea * $altura" | bc -l)
        echo
        echo "Resumen de cálculos:"
        echo "Radio: $radio m"
        echo "Altura: $altura m"
        printf "Área de la base: %.4f m²\n" "$baseArea"
        printf "Volumen del cilindro: %.4f m³\n" "$volumen"
        ;;
    2)
        # Cálculo de esfera
        radio=$(validar_numero "Ingrese el radio de la esfera (en metros): ")
        volumen=$(echo "4/3 * $pi * $radio * $radio * $radio" | bc -l)
        echo
        echo "Resumen de cálculos:"
        echo "Radio: $radio m"
        printf "Volumen de la esfera: %.4f m³\n" "$volumen"
        ;;
    *)
        echo "Opción no válida. El programa finalizará."
        exit 1
        ;;
esac

exit 0


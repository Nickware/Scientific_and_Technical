#!/usr/bin/bash.exe

# Title: Imprimir número al revés
# Authors: Juan Sebastian Manrique Moreno, Manuel Augusto Marroquín Torres
# Date: 14/10/2021
# Version: 4.4.12(3)-release (x86_64-unknown-cygwin)

clear # Limpia la terminal, usado para una mejor experiencia de usuario
echo "           Bienvenido a el inversor de números"
echo ""
echo "A continuación, se le solicitará el número que desea invertir"
echo -n "Número a invertir: "
read num # Solicitud y lectura del valor solicitado (num)

echo ""
echo "Invirtiendo..."
echo ""
sleep 5 # Delay o tiempo de espera de 5 segundos, usado para una mejor experiencia de usuario

let cant_cifras=$(echo $num | wc -L) # Obtención de la cantidad de caracteres que posee el valor solicitado con ayuda de wc

let w=0 # Declaración de un contador, necesario para el ciclo 'while'
let i=0 # Declaración de un contador, necesario para la extracción de caracteres
val= # Declaración de una variable, necesaria para la concatenación de los caracteres

while [ $w -lt $cant_cifras ] # Ciclo mientras que el contador 'w' sea menor que la cantidad de caracteres del valor solicitado
do
    val_esp=${num:$i:1} # Extracción de los caracteres, tomados de uno en uno y guardados en una variable
    ((i++)) # Contador i+1, útil para el avance de la extracción de caracteres

    val_fin="$val_esp$val" # Concatenación del caracter extraído con una variable que funciona como historial
    val=${val_fin} # Asignación del valor de la concatenación a la variable que funciona como historial

    ((w++)) # Contador w+1, útil para el avance del ciclo, sin él el ciclo sería infinito
done # 'done' indica la terminación del ciclo

echo "Su número invertido es: $val" # Impresión del valor de la variable 'val', la cuál funcionó como historial

echo ""
echo "Gracias por ejecutar nuestro programa, vuelva pronto."
echo ""
echo "Saliendo..."
sleep 3 # Delay o tiempo de espera de 3 segundos, usado para una mejor experiencia de usuario
exit 0 # Función de terminación del programa
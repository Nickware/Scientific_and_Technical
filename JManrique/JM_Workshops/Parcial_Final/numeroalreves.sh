#!/usr/bin/bash.exe

# Title: Imprimir número al revés
# Authors: Juan Sebastian Manrique Moreno, Manuel Augusto Marroquín Torres
# Date: 14/10/2021
# Version: 4.4.12(3)-release (x86_64-unknown-cygwin)

clear
echo "           Bienvenido a el inversor de números"
echo ""
echo "A continuación, se le solicitará el número que desea invertir"
echo -n "Número a invertir: "
read num

echo ""
echo "Verificando..."
echo ""
sleep 5

let cant_cifras=$(echo $num | wc -L)

let w=0
let i=0
val=
while [ $w -lt $cant_cifras ]
do
    val_esp=${num:$i:1}
    ((i++))

    val_fin="$val_esp$val"
    val=${val_fin}

    ((w++))
done

echo "Su número invertido es: $val"

echo ""
echo "Gracias por ejecutar nuestro programa, vuelva pronto."
echo ""
echo "Saliendo..."
sleep 3
exit 0
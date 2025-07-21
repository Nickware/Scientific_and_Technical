#!/bin/bash 
#Authors: Pablo Patiño, Maria Moreno, Andrés Gómez
#Date: 21-10-10
#Version_ 0.0.1

function NumeroCapicua (){
    printf "Digite un numero entero positivo de maximo tres cifras: "
    read -r n
    echo " Su número es:  $n"  
    echo Su número con digitos invertidos es: "$(echo "$n" | rev)"
    ni= echo $(echo "$n" | rev)

    if [[ $(echo "$n" | rev) -eq $n ]];
    then 
        printf "El número $n es capicua."
    else 
        printf "El número $n no es capicua."
    fi
}
while :


do

NumeroCapicua

echo " Por favor selecciones 1 para continuar 2 para salir"
read opcion
case $opcion in
1) NumeroCapicua;;
2) echo "Fin"; exit 1 ;;
esac
done
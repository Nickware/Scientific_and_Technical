#!/usr/bin/bash
#Author: Juan A.
#Title: Lista de cuadrados, cubos
#Date: 13-10-21
#Version: 1.0.0

resp=s

while [ $resp != n ]
do

echo "Programa que te dice los cuadrados, cubos, potencias de cuatro, de los números entre 0 y 20"
read -p "Escriba el número del cual desea hallar sus potencias: " num

cuad=$(($num*$num))
cubo=$(($num*$num*$num))
cuar=$(($num*$num*$num*$num))

echo
echo -e " Número     Cuadrádo     Cubo  \t  Cuarta \n   $num\t\t$cuad  \t $cubo \t   $cuar "
echo
read -p "¿Desea ver la tabla de potencias completa?, si la respuesta es afirmativa escriba (s), de lo contrario escriba (n): " resp

if [ $resp == s ]
then
  echo
  echo -e "\t\t Lista completa"
  echo
  echo -e " Número      Cuadrádo      Cubo \t   Cuarta \n   0\t\t   0 \t     0  \t       0  \n   1\t\t   1 \t     1  \t       1 \n   2\t\t   4  \t     8  \t      16  \n   3\t\t   9 \t    27  \t      81 \n   4\t\t  16 \t    64  \t     256 \n   5\t\t  25 \t   125  \t     625 \n   6\t\t  36 \t   216  \t    1296 \n   7\t\t  49 \t   343  \t    2401 \n   8\t\t  64 \t   512  \t    4096 \n   9\t\t  81 \t   729  \t    6561 \n  10\t\t 100 \t  1000  \t   10000 \n  11\t\t 121 \t  1331  \t   14641 \n  12\t\t 144 \t  1728  \t   20736 \n  13\t\t 169 \t  2197  \t   28561 \n  14\t\t 196 \t  2744  \t   38416 \n  15\t\t 225 \t  3375  \t   50625 \n  16\t\t 256 \t  4096  \t   65536 \n  17\t\t 289 \t  4913  \t   83521 \n  18\t\t 324 \t  5832  \t  104976 \n  19\t\t 361 \t  6859  \t  130321 \n  20\t\t 400 \t  8000  \t  160000 "
  sleep 5
fi

echo
done

exit 0

#!/bin/bash 
#Title: Roots calculator for quadratic equations 
#Authors: Pablo Patiño, Maria Moreno, Andrés Gómez.
#Version: 0.0.1
#Date: 10/10/2021
#Itroduce the program.

echo "This is a roots calculator for quadratic equations of the form ax^2+bx+c=0."

echo -en "Introduce the value for a: "$a #Give <a> a value

read a

echo -en "Introduce the value for b: "$b #Give <b> a value

read b

echo -en "Introduce the value for c: "$c #Give <c> a value

read c

echo "The equation form is: $a x^2 + $b x + $c = 0"

((bsq=b*b))

((R=$bsq-(4*$a*$c)))

if [[ $R -lt 0 ]]; then

echo "The roots of the equation do not belong to the set of real numbers."
else
   if [ $a -ne 0 ]; then

   ((nb=$b*(-1)))
   sq=`echo "scale=3; sqrt($R)" | bc`

   num=`echo "scale=3; $nb+$sq" | bc`

   ((den=2*($a))) 

   X1=`echo "scale=3; $num/$den" | bc` 

   ((nb=$b*(-1)))

   sq=`echo "scale=3; sqrt($R)" | bc`

   num=`echo "scale=3; $nb-$sq" | bc`

   ((den=2*($a))) 

   X2=`echo "scale=3; $num/$den" | bc`

   echo "The roots of the equation are: X1=$X1, X2=$X2"

   else

   echo "You cannot divide by cero, please introduce a differnet value for a"

   bash Root_Calculator.sh

   fi

fi

echo -n "Do you want to restart the calculator? Y=Yes, N=No: " $YN

read YN

case $YN in 

    Y)

    bash Root_Calculator.sh

    ;;

    N)

    echo "Finishing process."

    ;;

esac
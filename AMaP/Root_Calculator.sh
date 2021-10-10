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

echo "The equation form is: $a x^2 + $b x + $c = 0" #Give a general view of the case

((bsq=b*b))  #Define b squared

((R=$bsq-(4*$a*$c))) #Define the radical

if [[ $R -lt 0 ]]; then #Use conditional if the case is the root of a negative number

echo "The roots of the equation do not belong to the set of real numbers."

else #If the radical is not imaginary

   if [ $a -ne 0 ]; then #Use a second conditional inside the previous one in case the user divides by 0. 

   ((nb=$b*(-1))) #Define negative b.

   sq=`echo "scale=3; sqrt($R)" | bc` #Define the radical.

   num=`echo "scale=3; $nb+$sq" | bc` #Define the numerator.

   ((den=2*($a))) #Define the denominator.

   X1=`echo "scale=3; $num/$den" | bc` #Define the value of the first root.

   ((nb=$b*(-1))) #From line 46 to 54 the steps are the same, but used to calculate the second root, in which there must be a substraction instead of an addition on the numerator.

   sq=`echo "scale=3; sqrt($R)" | bc`

   num=`echo "scale=3; $nb-$sq" | bc`

   ((den=2*($a))) 

   X2=`echo "scale=3; $num/$den" | bc`

   echo "The roots of the equation are: X1=$X1, X2=$X2" #Tell the user the answer.

   else #In case there is a division by 0.

   echo "You cannot divide by cero, please introduce a differnet value for a"

   bash Root_Calculator.sh

   fi

fi

echo -n "Do you want to restart the calculator? Y=Yes, N=No: " $YN #Ask the user if they want to use the program again. 

read YN

case $YN in #Divide the cases.

    Y)  #In case answer is yes.

    echo "Restarting."

    bash Root_Calculator.sh #Restart program.

    ;;

    N) #In case answer is no

    echo "Finishing process."

    ;;

esac
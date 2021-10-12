#!/bin/bash
#Title: Cuadratic equation calculator
#Author: Santiago Talero Parra (20202107025)
#Version: 0.0.1

#presentation and warnings
echo "Welcome to the cuadratic equation calculator"
echo "The equation has the following form: AX^2+BX+C=0"
echo "REMEMBER, 'A' must be different to zero"
#asking for coeficient values
echo "Value for A"
read -p "A=" A
echo "Value for B"
read -p "B=" B
echo "Value for C"
read -p "C=" C
echo "Your expression is: "
#general form
echo -e "($A)X^2+($B)X+($C)=0"

#set a new variables for discriminant
U=$(echo "$B*$B" | bc)
V=$(echo "4*$A*$C" | bc)
Discri=$(echo "$U-$V" | bc)

#conditional to prove the human whim
if [ $A = 0 ]; then
echo "I told you, now A is zero, so... there is not a quadratic equation for you"
echo "Do you want calculate another equation? (Y/N)"
read choice
case $choice in   #we employ case to ask to the user if he want to calculate another equation
    Y)   #affirmative response
    bash QuadraticEquationCalculator.sh
    ;;
    N)   #negative response
    echo "May the force be with you"
    ;;
esac   #end of the options
exit 0;   # end of the program to prevent subsquents error messagess
fi

#starting another conditional for discriminant
if [[ Discri -lt 0 ]]; then   #if the discriminant is less than zero, there are imaginary roots
echo "¡Math Error! The roots are imaginary"
else   #consider the other case for discriminant equals to zero o greater than zero
#setting up new variables for calculate the roots
Root=$(echo "sqrt($Discri)" | bc)
Denominator=$(echo "2*$A" | bc)                                
PositiveRoot=$(echo "scale=3; ((-1)*$B+$Root)/$Denominator" | bc)   #we set scale=3 to print more decimal values
NegativeRoot=$(echo "scale=3; ((-1)*$B-$Root)/$Denominator" | bc)    
echo "The roots for the equation in the real set numbers:"
echo "X1=$PositiveRoot"
echo "X2=$NegativeRoot"
fi

echo "Do you want calculate another equation? (Y/N)"
read choice
case $choice in
    Y)
    bash QuadraticEquationCalculator.sh
    ;;
    N)
    echo "May the force be with you"
    ;;
esac


#sources:https://es.wikibooks.org/wiki/El_Manual_de_BASH_Scripting_Básico_para_Principiantes/El_básico_(If-Then)
#https://linuxize.com/post/bash-case-statement/
#https://e-mc2.net/es/bash-iii-variables-y-funciones
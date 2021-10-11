#!/bin/bash
#Basic Calculator
#Pablo Patiño, Maria Moreno, Andrés Gómez
#06102021

# two variable calculator
# define a; define b. 
# Use "case" to divide sum, subtract, multi, divi.
# echo + read to know what the user wants
# ...

echo "this is a basic two variable calculator. first, write you two variables (a,b are REAL #)."
echo "Define a:"
read a
echo "Define b"
read b

echo "What would you like to do? type S: add; R: subtract; M: multiply; D: divide"
read CAL

case $CAL in    #divide by cases. 

    S)
    bc <<< "scale=3;$a+$b" #I use strings instead of pipes. It looks better imo.
    ;;

    R)
    bc <<< "scale=3;$a-$b"
    ;;

    M)
    bc <<< "scale=3;$a*$b"
    ;;
    
    D)
    if [ $b = 0 ] #Here I wanted to give a self-created message for dividing by 0"
    then
    echo "Are you trying to blow the universe? (unable to divide by 0!)"
    else
    bc <<< "scale=3;$a/$b"
    fi
    ;;

esac  

echo "Would you like to do another operation? Y/N"

read I

case $I in #Another "case", nothing remarkable

    Y)

    bash Basic_Calculator.sh #Simple re-run the same program

    ;;

    N)

    echo "Ty for using this run. closing..."

    ;;

esac
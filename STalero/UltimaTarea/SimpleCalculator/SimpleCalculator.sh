#! bin/bash
#Title: SimpleCalculator
#Author: Santiago Talero Parra (20202107025)
#Version: 0.0.1

echo "Welcome to the Simple Calculator"
echo "Do you want read the manual? (Y/N)"
read CHOICE
#we use case for many options where the user can choose since him input, set as a variable
case $CHOICE in
    Y)
    rm -rv Manual.txt   #deleting manual if already exists
    echo "There is a serie of five operations: addition(A), substraction(S), product(P), quotient(Q) and percentage" >> Manual.txt
    echo "For the first four operations you have to give two real numbers" >> Manual.txt
    echo "For the fifth operation you have to give a number and other to know what percentage you wish to calculate" >> Manual.txt
    echo "To access the percentage operation, first give the two numbers, select a random arithmetic operation and then press Y to access the percentage operation" >> Manual.txt
    less Manual.txt
    ;;
    N)
    echo "Okay, we can continue"
    ;;
esac   #closing the case command
echo "Give two numbers"
#we set U and V as the inputs of the calculator to operate them and calculte their percentage, if the user wants of course
echo "Number U"
read U
echo "Number V"
read V
echo "Select an operation to do: A)Addition, S)Substraction, P)Product, Q)Quotient" #A, S, P, Q will be the options
read CHOICE2
case $CHOICE2 in
    A)
    ADDITION=$(echo "scale=4; $U+$V" | bc)
    echo $ADDITION
    ;;
    S)
    SUBSTRACTION=$(echo "scale=4; $U-$V" | bc)
    echo $SUBSTRACTION
    ;;
    P)
    PRODUCT=$(echo "scale=4; $U*$V" | bc)
    echo $PRODUCT
    ;;
    Q)
        if [ $V = 0 ]; then   #important to set this condition for evade messagess errors and conflicts with mathematicians
        echo "¡Math Error! Divide by zero is undefined"
        else
        QUOTIENT=$(echo "scale=4; $U/$V" | bc)
        echo $QUOTIENT
        fi
    ;;
esac
#we use again case command to ask the user if he want to do another operation
echo "Do you want calculate the percentage with U and V? (Y/N)"
read answer
case $answer in
    Y)
    PERCENTAGE=$(echo "scale=4; ($U*$V)/100" | bc)
    echo $PERCENTAGE
    ;;
    N)
    echo "Have a good day"
esac
echo "Do you wish to do another operation? (Y/N)"
read answer2
case $answer2 in
    Y)
    bash SimpleCalculator.sh
    ;;
    N)
    echo "May the force be with you"
esac

#sources: https://linuxize.com/post/bash-case-statement/
#https://unix.stackexchange.com/questions/421083/bash-how-to-calculate-percentage-from-number
#!/bin/bash
#Authors: LTriana, ZGómez, MRodríguez
#Date: 13/10/2021
#version: 1.0

#Biggest number

echo -e "Welcome!"

echo "Choice of the biggest number between ´n´ numbers"
#In this case n=10, taking into account [ $counter -eq 10 ]
#Ask user to enter a number
echo "Enter a number: "
read n

#The number entered is stablished as the max, and initialize the counter from 1
Max=$n
counter=1

#The program will ask the user numbers ul¿ntil he/she enter the total amount of 10
until [ $counter -eq 10 ]
do
    echo "Enter another number:"
    read n
    if [[ $n -gt $Max ]]
    then
    #If the entered number is higher, the variable Mas is gonna be uploated for the new number
        Max=$n
    fi
    #Increasing operators. counter=$counter+1 is the same as ((counter+=1)) ó ((counter++))
    ((counter++))
done
#The number saved in the varible Max in going to be shown on the screen
echo "The biggest number is $Max"

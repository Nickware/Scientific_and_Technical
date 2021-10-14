#!/bin/bash
#Authors: LTriana, ZGómez, MRodríguez
#Date: 13/10/2021
#version: 1.0

#Calculate the interest rate 

echo -e "Welcome to the interest rate calculator!"

#Ask the user the principal amount, the rate, number of years and the periods
echo "Enter your ammount: "
read ammount
echo "Enter the rate: "
read rate
echo "Enter the number of years: "
read years
echo "Enter the periods per year: "
read periods

#Calculate the rate period
let ratep=$rate/$periods 

#Calculate the number of periods
let nperiods=$periods*$years
counter=1

#The interest will be added period by period until the last one, giving the ammount
until [ $counter -gt $nperiods ]
do 
let interest=$ammount*$ratep
let ammount=$ammount+$interest
echo "Your period $counter, has the ammount of $ammount and interest rate of $interest."
((counter++))
done
#Print the final ammount
echo "Your final ammount is $ammount."
echo "Thank you"



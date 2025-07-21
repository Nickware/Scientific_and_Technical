#!/bin/bash
#Authors: LTriana, ZGómez, MRodríguez
#Date: 13/10/2021
#version: 1.0

#Powers 

#Welcome and table's header
echo "Welcome. Here I will show you the table of powers of 2, 3 and 4:"
echo ""
echo "......................................................."
echo "                        Powers                         "
echo "......................................................."
echo "Number        Square           Cube           Fourth"
echo "......................................................."

#For the numbers between 0-9 find its power of two, three and four, initializing variables 
number=0
square=0
cube=0
fourth=0
for number in {0..9} 
do
square=$((number*number))
cube=$((number*number*number))
fourth=$((number*number*number*number))

#Print the results in column order
echo -e "$number\t\t$square\t\t$cube\t\t$fourth"
done 

#For the numbers between 10-20 find its power of two, three, four
for number in {10..20} 
do
square=$((number*number))
cube=$((number*number*number))
fourth=$((number*number*number*number))

#Print results in column order
echo -e "$number\t\t$square\t\t$cube\t\t$fourth"
done   
echo "....................................................."


#!/bin/bash
#Authors: LTriana, ZGómez, MRodríguez
#Date: 13/10/2021
#version: 1.0

#Coordinates converter

echo "Coordinates converter"
echo "Please select the option you want to transform"
#Show menu options
echo  "1 - Convert from polar to cartesian coordinates"
echo "2 - Convert from cartesian to polar coordinates"
read option
if [[ $option -eq 1 ]]
then
#The G angle


    echo "Enter the r coordinate value: "
    read r
    while true
    do
        echo "Define if the measure is in degrees or radians, write D if is in degrees or RAD if is in radians: "
         read 
        ter=${REPLY^^}
        if [ "$ter" == "D" ]
        then
            echo "Enter the D value"
            read D

            pi=$(echo "scale=4; 4*a(1)" | bc -l)
            radians=$(echo "scale=4; ($D*$pi)/180" | bc -l) 

            echo "In cartesian coordenates"
            #calculate x coordenate
            x=$(echo "scale=4; $r*c($radians)" | bc -l)
            y=$(echo "scale=4; $r*s($radians)" | bc -l)
            echo ""
            echo "The x value is: $x"
            echo "The y value is: $y"
           echo ""
            echo "See you soon."
            sleep 2
            exit 0
        
        elif [ "$ter" == "RAD" ]
        then
            echo "Enter D value"
            read G 
            echo "In cartesian coordenates"
            #calculate x coordenate
            x=$(echo "scale=4; $r*c($D)" | bc -l)
            y=$(echo "scale=4; $r*s($D)" | bc -l)
            echo ""
            echo "The x value is: $x"
            echo "The y value is: $y"
            echo ""
            echo "See you soon."
            sleep 2
            exit 0
        else 
            echo "You entered invalid character"
        fi
    done
elif [[ $option -eq 2 ]]
then
    echo "Enter the x value"
    read x
    echo "Enter the y value"
    read y
    r=$(echo "scale=4; sqrt($x*$x+$y*$y)" | bc -l)
    #phi angle
    phi=$(echo "scale=4; a($y/$x)" | bc -l)
    D=$(echo "scale=4; 180-$phi" | bc -l)

    echo ""
    echo "The r value is: $r"
    echo "The D value is: $D"
    echo ""
            echo "See you soon."
            sleep 2
            exit 0
fi

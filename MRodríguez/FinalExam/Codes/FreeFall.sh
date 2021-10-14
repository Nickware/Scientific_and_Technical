#Welcome
#!/bin/bash
#Authors: LTriana, ZGómez, MRodríguez
#Date: 13/10/2021
#version: 1.0

#Free fall

#First, welcome to the program
echo "Hello, this is program to calculate the free fall time"
#Then, ask the user the building height from which the ball will fall
echo "Enter the building height: "
read h
g=9.81
#To find the time, the final velocity is needing, and if is the case, the program will take two ciphres from digit
v=$(echo "scale=2; 2*$h*$g" | bc)

#Now, time can be found, dividing the velocity from up between the gravity
echo "The time of falling ball is: "
t=$(echo "scale=2; $v/$g" | bc)
#The time result is shown on the screen
echo $t


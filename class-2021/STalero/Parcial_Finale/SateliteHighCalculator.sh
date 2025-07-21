#! bin/bash/
#title: Satelite High Calculator
#author: STSalero
#version: 0.0.2

#Initializing variables for universal gravitational law and centripetal force
M=5.97*10^24
G=6.67*10^-11
pi=$(echo "h=10;4*a(1)" | bc -l)   #numeric value to use in the program
R=6371
#this times variables will be used to consider the cases with 24 hours, 23.93 hours, etc
time1=24*3600           #factor conversion from hours to seconds
time2=(23.93)*3600      #bc calculator will be convert this values
time3=90*60
time4=45*60

echo "Welcome to the calculator for satelite high"
echo "You have to give a period of time in hours to calculate the high of the satelite"
echo "You can choice one of the following presets: "
#A kind of menu to the user
echo "1. A orbit period of a normal day (24 hours)"
echo "2. A orbit period of a sidereal day (23.93 hours)"
echo "3. 90 minutes"
echo "4. 45 minutes"
echo "5. Other (¡BEWARE! If your choice is Other, don't put zero (0) or a value less than zero for time)"
read Option
#since the $option is given, the conditional if will do some stuffs
if [[ $Option -eq 1 ]]; then
    a1=$(echo "$G*$M*$time1*$time1" | bc -l)   #separating in parts the equation for high of the satelite in function of time
    a2=$(echo "4*$pi*$pi" | bc -l)
    a3=$(echo "e(l($a1/$a2)/3)" | bc -l) 
    a4=$(echo "scale=3;$a3-$R" | bc -l)
    echo "The high of the satelite for a period of 24 hours is: $a4 m"
#'elif' works like another 'if' but with an 'else' in common, many 'if' statements with a 'else' in common 
elif [[ $Option -eq 2 ]]; then       
    b1=$(echo "$G*$M*$time2*$time2" | bc -l)
    b2=$(echo "4*$pi*$pi" | bc -l)
    b3=$(echo "e(l($b1/$b2)/3)" | bc -l) 
    b4=$(echo "scale=3;$b3-$R" | bc -l)
    echo "The high of the satelite for a period of 23.93 hours is: $b4 m"
elif [[ $Option -eq 3 ]]; then
    c1=$(echo "$G*$M*$time3*$time3" | bc -l)
    c2=$(echo "4*$pi*$pi" | bc -l)
    c3=$(echo "e(l($c1/$c2)/3)" | bc -l)
    c4=$(echo "scale=3;$c3-$R" | bc -l)
    echo "The high of the satelite for a period of 90 minutes is: $c4 m"
elif [[ $Option -eq 4 ]]; then
    d1=$(echo "$G*$M*$time4*$time4" | bc -l)
    d2=$(echo "4*$pi*$pi" | bc -l)
    d3=$(echo "e(l($d1/$d2)/3)" | bc -l)
    d4=$(echo "scale=3;$d3-$R" | bc -l)
    echo "The high of the satelite for a period of 45 minutes is: $d4 m"
else
#stablishing another conditional in the 'else' part for diferent T values
    echo "Give the value for the period: "
    read t
    if [[ t -eq 0 ]]; then    #if T is equal to zero, print
    echo "I told you, you have to give positive values. Your satelite is on the earth surface"
    elif [[ t -lt 0 ]]; then  #if T is less than zero, print
    echo "I told you, you have to give positive values. For this case, there are no negative time values"
    else
    #this 'else' let any positive value to be consider for T
    echo "Converting hours to seconds..."
    T=$(echo "scale=3; 3600*$t" | bc -l)
    echo "Calculating the high of the satelite..."
    e1=$(echo "$G*$M*$T*$T" | bc -l)
    e2=$(echo "4*$pi*$pi" | bc -l)
    e3=$(echo "e(l($e1/$e2)/3)" | bc -l)
    e4=$(echo "scale=3;$e3-$R" | bc -l)
    echo "The high of the satelite for a period of $t hours is: $e4 m"
    fi   #closes the conditional
fi    #closes the conditional
echo "Do you want to see the difference beetween a "normal day" and a sidereal day period and her results? (Y/N)"
#There are great differences among the values when considering the high of the satelite. A simple digit can make the difference
read ANSWER
case $ANSWER in    #command case for considerar two options or cases to execute some tasks
    Y)
    echo "Well, the diffrerence beetween a normal day and a sidereal day period for the high of the satelite is: "
    j=$(echo "$a4-$b4" | bc -l)
    echo $j
    ;;
    N)
    echo "Thank you for use the Calculator for satelite high"
esac
exit 0;
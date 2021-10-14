#!/bin/bash

pi=`echo "h=10;4*a(1)" | bc -l` #definir pi
#pi=$(echo "scale=10;4*a(1)" | bc -l)

echo "What kind ov conertion do you want to do? (1.Polar to cartesians) (2. Cartesians to polar.)"
read P
case $P in
 1) echo "Give r and theta"
   read r
   read a
   echo "is r in radians? Y/N"
   read si 


   case $si in
    Y)
    #sen=
    #cos= `echo "scale=3; c($angle)" | bc`
      echo "x axis is:"
      echo "scale=4;$r*s($a)" | bc -l
      echo "y axis is:"
      echo "scale=4; $r*c($a)" | bc -l
      #echo "scale=3;$r*c($a)" | bc -l
      echo "done"
     ;;

     N)
  
      echo "x axis is:"
      echo "scale=4;$r*s($a*$pi/180)" | bc -l
      echo "y axis is:"
      echo "scale=4;$r*c($a*$pi/180)" | bc -l
      echo "done"
    ;;
   esac
 ;;

 2) 
  echo "Give the value for x and y" 
  read x
  read y
  echo "radius equals to"
  #xs=echo "$x*$x"
  echo "scale=4;sqrt(($x*$x)+($y*$y))" | bc -l
  echo "Want the angle in radians Y/N"
  read yas
  case $yas in
    Y)
    echo "angle equals to"
    echo "scale=4;a($x/$y)" | bc -l
    ;;
    N)
    echo "angle equals to"
    echo "scale=4;a(($x/$y))*(180/$pi)" | bc -l
    ;;
    
  esac
 ;;

esac 
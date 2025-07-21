#title
#author
#date
#version
#comments
echo "Locale file"
pwd
echo "Go to a specific location"
cd /c/cygwin64/home/santi/20202107025/Clases/160921
echo "Welcome"
echo "Printing text with new line"

echo -n "printing "
echo -n "text "
echo -n "without "
echo -n "newline "
#echo -n imprime frases pegadas, sin nueva linea para cada echo, se puede dejar espacio al final como es el caso
echo -n "printing"
echo -n "text"
echo -n "without"
echo -n "newline"
 
echo -e "\n Printing \t text with \t interpretation of \n backslash \n"

echo adding two numbers
#add two numeric values
((sum=33+90))
#printing sum
echo $sum  #:O

echo square of a number
((area=5*5))
echo $area
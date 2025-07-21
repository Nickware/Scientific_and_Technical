#! bin/bash/
#title: Polar-Rectangular Coordenates Converter
#author: STSalero
#version: 0.0.2

#initializating varible pi
pi=$(echo "h=10;4*a(1)" | bc -l)
echo "Welcome to the polar-rectangular coordenate converter"
echo "Select if you gonna give the values for the angle in degrees or radians"
#setting up a menu to the user
echo "1.Degrees"
echo "2.Radians"
read VALUE
#with the value registered, the conditionals can make some functions
if [[ $VALUE == 1 ]]; then
    echo "Choose an option: "
    echo "A. Polar to rectangular coordenates"
    echo "B. Rectangular to polar coordenates"
    #another conditional with new input variable
    read value
        if [[ $value == A ]]; then
        echo "Give the value for r:"
        read r
        echo "Give the value for theta:"
        read theta
        #variables r and theta to calculate the rectangle coordinates
        echo "Converting angle from degrees to radians..."
        thetaradian=$(echo "$theta*$pi/180" | bc -l)  #this convertion factor chanes the degrees value from the terminal to a radian value
        echo "Converting coordenates..."              #bc can't read values different to radian
        #assigned x and y values to be displayed with echo
        y=$(echo "scale=2;s($thetaradian)*$r" | bc -l)
        x=$(echo "scale=2;c($thetaradian)*$r" | bc -l)
        echo "Coordinate x is $x and coordinate y is $y"
        #another if condition with a exact value B
        elif [[ $value == B ]]; then
        echo "Give the value for x:"
        read x1
        echo "Give the value for y:"
        read y1
        echo "Converting coordenates..."
        r1=$(echo "scale=2;sqrt($x1*$x1+$y1*$y1)" | bc -l)
        theta1=$(echo "scale=2;a($y1/$x1)" | bc -l)   #the a(X) arctangent function is defined with s(x) sine function and c(x) cosine function in bc
        theta2=$(echo "scale=2;$theta1*180/$pi" | bc -l)   #converting from radians to degrees
        echo "Coordenate r is $r1 and angle theta is $theta2"
        else #otherwise, the user registered characters different to A and B
        echo "Please choose a correct option"
        fi
#making the same process but with option 2
elif [[ $VALUE == 2 ]]; then
    echo "Choose an option: "
    echo "A. Polar to rectangular coordenates"
    echo "B. Rectangular to polar coordenates"
    read value
    case $value in
        A)
        echo "Give the value for r:"
        read r
        echo "Give the value for theta:"
        read theta
        echo "Converting coordenates..."
        #the assignmet of new variables prevents sintax errors and many values for a single variable
        y2=$(echo "scale=2;s($theta)*$r" | bc -l)
        x2=$(echo "scale=2;c($theta)*$r" | bc -l)
        echo "Coordinate x is $x2 and coordinate y is $y2"
        ;;
        B)
        echo "Give the value for x:"
        read x2
        echo "Give the value for y:"
        read y2
        echo "Converting coordenates..."
        r2=$(echo "scale=2;sqrt($x2*$x2+$y2*$y2)" | bc -l)
        theta3=$(echo "scale=2;a($y2/$x2)" | bc -l)
        echo "Coordenate r is $r2 and angle theta is $theta3"
    esac
else 
echo "You need to choose beetween 1 or 2. Executing program again..."
bash $0
fi
exit 0; 
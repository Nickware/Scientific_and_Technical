echo "Quadratic Ecuation"
echo "Enter the value for a: "
read a
echo "Enter the value for b: "
read b
echo "Enter the value for c: "
read c

discriminant = $(echo "$b^2" | bc -l)
echo $discriminante


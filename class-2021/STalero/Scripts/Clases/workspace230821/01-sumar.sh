y=111
x=101
echo "ibase=2; obase=2; $y+$x" | bc -l
echo "ibase=2; 10011" | bc -l
echo "ibase=2; 1011" | bc -l
echo "ibase=2; 10011" | bc -l

echo $(basename $0)

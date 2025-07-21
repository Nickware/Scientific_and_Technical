echo "* Introduce la tabla que quieres ver: "
read table
for i in 0 2 3 4 5 6 7 8 9
do
echo "$table x $i= `expr $table\*$i`"
done
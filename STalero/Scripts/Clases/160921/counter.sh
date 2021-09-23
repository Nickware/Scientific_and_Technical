for (( counter=10000; counter>0; counter-- ))
do
echo -n "$counter "
done
printf "\n"

#n=2
#if [ $n -lt 10 ];
#then
#echo "This is a number of one digit"
#else
#echo "This is a nuymber of two digits"

#done

echo "Enter username"
read username
echo "Enter password"
read password

if [[ ( $username == "admin" && $password == "secret" ) ]]; then
echo "valid user"
else
echo "invalid user"
fi
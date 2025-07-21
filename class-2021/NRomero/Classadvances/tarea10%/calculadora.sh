#Author: Norman Romero 
#Version: 0.001 
#Date oct/2/2021
echo "What operation do you want to do?"
read operation1 
echo "Please wirte down the first value and press Enter"
read value1 
echo "Please wirte down the second value and press Enter"
read value2
echo "The operation's result is: "
echo "$value1 $operation1 $value2" | bc 
echo "Do you want to do another operation, answer YES/NO?"  
read option
#if $option = YES 

#else 

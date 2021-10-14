#! bin/bash/
#title: Inverted Numbers
#author: STSalero
#version: 0.0.2

echo "Welcome to the inverter numbers program"
echo "Please enter the digits of your number (For now, only is available five digits as maximum)"
read d1     #For each digit of the number we assigned a variable
read d2
read d3
read d4
read d5

#This 0.0.2 version of the program. Features the conditionals to ensure the user enter a one digit value
#however it was planning to use one 'if' with many 'elif' and one 'else'. By the way, this works pretty well
#with the logic connector && many statements apply for one condition. Each digit is analyzed to ensure the condition of one digit
if [[ $d1 -ge 0 && $d1 -lt 10 ]] && [[ $d2 -ge 0 && $d2 -lt 10 ]] && [[ $d3 -ge 0 && $d3 -lt 10 ]] && [[ $d4 -ge 0 && $d4 -lt 10 ]] && [[ $d5 -ge 0 && $d5 -lt 10 ]]; then
echo "Your number: "
#echo -n lets print texts together without new line
echo -n "$d1"
echo -n "$d2"
echo -n "$d3"
echo -n "$d4"
echo -n "$d5"
echo -e "\nInverting number..."
echo -n "$d5"
echo -n "$d4"
echo -n "$d3"
echo -n "$d2"
echo -n "$d1"
else
echo "Your input is invalid. I told you, enter digit by digit your number. Executing program again..."     #error to prove the naughty nature of human
bash $0
fi
echo -e "\nDo you want try another number? (Y/N)"   #stablishing question for the command case
read answer
case $answer in   #A simple case with two cases for execute the program again or exit
    Y)
    bash $0
    ;;
    N)
    echo "May the Force Be with You"
    ;;
esac
exit 0;
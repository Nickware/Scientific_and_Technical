#Welcome
#!/bin/bash
#Authors: LTriana, ZGómez, MRodríguez.
#Date: 10/10/2021
#Version: 1.0

# Fifth point: Palindromic number. 

echo "Hi there! Here you can check if a number is palindrome or not."  
echo "Please enter a number, careful, just a number."

# The entered variable is read:
read number

# I use a conditional to check if the entered variable corresponds to the one that verifies if it is a number.:
# Apply expression that allows verifying if an element is a number."

if [ -n "$number" ] && [ "$number" -eq "$number" ] 2>/dev/null; then  
#I use the code that allows to reverse the variable:
rebnum=`rev <<< $number`   
if [ "$number" = "$rebnum" ]; then 
echo "¡Yes! The number you entered "$number" is a panlindrome number."
else
echo "The number you entered "$number" is not a palindrome."
fi
#If it isn't satisfied that the variable is a number, the other condition is carried out.
else  
echo "Oops! You didn't write a number, try again."
fi

# The option is given to do the process again, or to terminate the program.
echo 
echo "1. Enter 1 if you want to continue entering numbers."
echo "2. Enter 2 if you want to finish the process."
read option
echo  
if [ $option = "1" ]; then 
bash 5Palindrome.sh
else 
echo "Thanks for using the program. Come back soon! :) "
fi

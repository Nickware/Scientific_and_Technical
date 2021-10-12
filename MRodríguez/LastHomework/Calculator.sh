#!/bin/bash
#author: LTRiana, ZGómez, MRodríguez
#date: 10/10/2021
#version: 1.0
 
#Calculator
 
echo -e "Welcome!"
#Variable used to control the calculator's cycle. 
#In case isn't "yes", it get closed
continue=yes
#Calculator's cycle, it executes until user indicates the opposite
#deppending the variable continue
while [ $continue = yes ]
do
    #Interaction with user
    echo -e "\nWhat do you want to do?"
    echo -e "Write + for addition, - to substract, / to divide, o * for multiplication"
    #Stored the user choosen by user
    read option
 
    #Flow controler. It allows to execute a code brick, depending the variable value.
    #In this case possible options that the user entered according the option variable
    case $option in
        #If user choose addition
        +)
            #Interaction with user
            echo -e "Enter the first number"
            read a
            echo -e "Enter the second numer"
            read b
            #Operation with bc command, echo command has the operation with variables, 
            #this, at the same time it concatenate with bc and operation is saved in sum variable
            sum=$(echo -e "$a+$b" | bc -l)
            echo -e "The addition result is $sum"
            #Ask if he/she wants to continue using calculator
            echo -e "\nDo you want to do another operation? Write yes or no"
            #Continue variable is readed to control cycle calculator 
            read continue  
            #Until cycle to execute a code while the condition specified is false
            #(or until the condition specified is true). In this case is used to control  
            #that the user has entered a correct answer (yes or no)
            until [[ $continue = yes ]] || [[ $continue = no ]]
            do
                #Interaction with the user
                echo -e "\nIncorrect option\nDo you want to do another operation? Write yes or no"  
                read continue                 
            done
        ;;
        #If user indicates substract      
        -)
            #Interaction with the user
            echo -e "Enter the first number"
            read a
            echo -e "Enter the second number"
            read b
            #Operation with bc command, echo command has the operation with the variables
            #this, at the same time it concatenate with bc and operation is saved at sub variable
            sub=$(echo -e "$a-$b" | bc -l)
            echo -e "Substract result is $sub"
            #Ask if she/he wants to continue using the calculator
            echo -e "\nDo you want to do another operation? Write yes or no"
            #Variable continue is readed to controle calculator cycle
            read continue  
            #Until cycle to execute a code while the specified indication be false
            #(or umtil it be true). In this case is use to control 
            #that the user entered a correct option (yes or no)
            until [[ $continue = yes ]] || [[ $continue = no ]]
            do
                #Interaction with the user
                echo -e "\nIncorrect option\nDo you want to do another operation? Write yes or no"  
                read continue                 
            done
        ;;
        #If user indicated division
        /)
            #Interaction with user
            echo -e "Enter the first number"
            read a
            echo -e "Enter the second number"
            read b
            #bc operation. The command echo contains the operation with variables, 
            #and this, in turn is concatened with bc and operation is saved at div operation
            div=$(echo -e "$a/$b" | bc -l)
            echo -e "Division result is $div"     
            #Ask if he/she wants to continue using calculator
            echo -e "\nDo you want to do another operation? Write yes or no"
            #continue variable is reades to control calculator cycle
            read continue  
            #until cycle to execute a code while specified condition be false
            #(or until specified condition be true).In this case is used to control
            #that the user entered correct answer (yes or no)
            until [[ $continue = yes ]] || [[ $continue = no ]]
            do
                #Interaction with the user
                echo -e "\nIncorrect option\nDo you want to do another operation? Write yes or no"  
                read continue                 
            done
        ;;
        #If user indicated multiplication. Backslash so asterisk is readed literally
        \*)
            #Interaction with the user
            echo -e "Enter first numer"
            read a
            echo -e "Enter second number"
            read b
            #bc operation. echo command contains the operation with the variables,
            #this in turn concatenate with bc and operation is saved at mult variable
            mult=$(echo -e "$a*$b" | bc -l)
            echo -e "Multiplication result is $mult"   
            #Ask if she/he wants to continue using calculator
            echo -e "\nDo you want to do another operation? Write yes or no"
            #continue variable is reades to control calculator's cycle 
            read continue  
            #until cycle to execute a code while the specified indication be false
            #(or until the specified condition is true). In this case is used to control that
            #the user entered a correct answer (yes or no)
            until [[ $continue = yes ]] || [[ $continue = no ]]
            do
                #Interaction with the user
                echo -e "\nIncorrect option\nDo you want to do another operation? Write yes or no"  
                read continue                 
            done    
        ;;
        #If user entered another answer, asterisk is interpreted as recoursive
        *)
            echo -e "You entered an incorrect option, please try again"
    esac
done

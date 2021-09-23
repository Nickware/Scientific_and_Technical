#!/bin/bash.exe
#PPatiño
#Parcial Encoder
#08092021
#0.0.1


echo "Program made by Pablo Patiño, Institu.code: 20202107014" #Say what is between quotation marks
echo "This program transform a .txt file from ASCII to Hexal or backwards, but can't know if your file is wheater ASCII or Hexal" 
#If it reads any text, it'll code it unless it is not in the Hexal defined range
echo "if you want to transform ASCII to Hexal type 0 otherwise type 1:" 
read VAR #VAR would content the condition that will be read in "case"

case $VAR in 
#https://linuxize.com/post/bash-case-statement/ more general form of if. I first tought to use name variables, that's why I choose "case". Before reading about both if and case I decided to use the last one and 0 ^ 1 for "classic's sake"

    0)
        echo -n "Type ASCII file (.txt) direction:" 
        #/home/Usuario/V/a
        read ASCII #read the directory where the file.txt is
        echo "Coding file"
        echo "sending to HtA.txt"
        rm AtH.txt #remove the last HtA file, to avoid duplicaded text
        xxd -p "$ASCII" >> AtH.txt #First use "xxd" to convert ASCII to Hexal, -p display the plain code (if not use it'll show a list)
        echo "This is the code"
        cat AtH.txt #show on terminal
        echo "make sure to copy your Hexal form HtA.txt before re-running this program."

        ;; #This is to separete conditions, I forgot to put it here at first. You can imagine what did happen next
    
    1)
        echo -n "Type Hexal file (.txt) direction:" #This is exact the same as above except for the xxd argument
        #/home/Usuario/V/PPatiño/HtA.txt
        read HEXAL
        echo "Coding file"
        echo "sending to AtH.txt"
        rm HtA.txt
        xxd -r -p $HEXAL >> HtA.txt #xxd -r ---> -r works as hexdump (this is why it works backwards)
        echo "This is the code"
        cat HtA.txt
        echo "make sure to copy your ASCII form AtH,txt before re-running this program."

        ;;
esac #It seems that this type of arguments, (if, case, etc...) needs a command to finish the conditions stage, and it seems to be the same word spelled backwards as this one (case --> esac).
echo "#Coding Nazi message"
echo "#Mariana Rodríguez Perdomo"
echo "#09/09/2021"
echo "#v 0.2"
echo "#ID ending at 053"
echo "#StudentCode ending at 005"

echo "#Coding Nazi message" >> 20202107005.txt
echo "#Mariana Rodríguez Perdomo" >> 20202107005.txt
echo "#09/09/2021" >> 20202107005.txt
echo "#v 0.2" >> 20202107005.txt
echo "#ID ending at 053" >> 20202107005.txt
echo "#StudentCode ending at 005" >> 20202107005.txt


#Here, I am converting the message (character) to Hex system and printing it in the Hex.txt file
echo "The encrypting (in Hexa system) message is: "
echo "The encrypting (in Hexa system) message is: " >> 20202107005.txt
xxd -p Message.txt
xxd -p Message.txt >> Hex.txt
xxd -p Message.txt >> 20202107005.txt
xxd -p Message.txt >> bi20202107005.run

#Now I am deciphering from Hex to characters
echo "Now, deciphering the code (Hex system to characters): "
echo "Now, deciphering the code (Hex system to characters): " >> 20202107005.txt
xxd -r -p Hex.txt
xxd -r -p Hex.txt >> 20202107005.txt
xxd -r -p Hex.txt >> bi20202107005.run

#I am converting the original text message to Oct system
echo "The message encrypting in Octal system is: "
echo "The message encrypting in Octal system is: " >> 20202107005.txt
od -b Message.txt
od -b Message.txt >> 20202107005.txt
od -b Message.txt >> bi20202107005.run

zip pro20202107005.zip 20202107005.txt bi20202107005.run Hex.txt Message.txt

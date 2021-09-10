#!/bin/bash                                              ID:20202107038
#Títle: Enigma Machine Bash                              
#Author: Juan Sebastián Sánchez
#User: JuanCelPirata
#Date: 09/09/2021

echo "...Generando permisos a el archivo enigmamachine.sh: propietario r.w.x ; usuarios r; publico sin permisos..." #Dando Permisos rwx a propietario y r a usuarios en sh de bitacora
chmod 740 bi20202107038.sh  #chmos para dar permisos
echo #Decoración para que aparezaca un espacio en la terminal 
echo "Bienvenido Detective porfavor ingresa tú nombre" # preguntar a quien ejecuta por su nombre para hacer una interfáz más interactiva 
read nombre  #leer el nombre
echo 
echo "Hola $nombre, este sistema te permitirá cifrar y decifrar mensajes, usalo de forma sabía para tus intereses"
echo "porfavor ingresa tu ID" #preguntando por código ID
read code #leyendo código ID en la variable 
echo "...leyendo ID..."
echo 
echo "numero a ingresar:" 
 #Aquí la idea es tomar el ID y dividirlo en 2, de tal manera que si su residuio es 0, sabremos que es un múmero par1
echo "$code%2" | bc  
echo "$nombre porfavor ingresa el número que sale sobre este mensaje" #El usuario pone el número que le dió como reciduo 
read nice #Se lee y se guarda el número en la variable nice 
echo 
if [ "$nice" = "0" ]; then #Usamos el condicional para decir, si(if) la variable nice = 0 entonces imprimir que el ejecutable puede ser de ayuda, de lo contrario(else) imprimir que quizás no pueda serlo
echo "Bien $nombre! Eres un Código Par, este ejecutable te será de ayuda!"
echo
else 
echo "Eres número impar, quizás este ejecutable no te sea de mucha ayuda"
echo
fi
#Debemos ayudar a turing a decifrar los mensajes que los nazis han encriptado en código binario o pasarlos a otros sistemas, ellos encriptaron sus mensajes usando el siguiente sistema: 

echo "------------------------------------------------------------------------------------------------------------------"
echo 
echo "...preparando fase 2..."
#como a continuación pasaremos a crear una un script de rutina sh y una copia run, para que no haya problema al crear los archivos ponemos el comando rm, para eliminar archivos run y sh antes creados con ese nombre
#También borramos los txt de salida que genera
rm enigmamachine.sh  
rm cartaCifradaNacisb.txt
rm cartaCifradaNacish.txt
rm cartaDecifradaNacis.txt
rm cartaCifradaNacisOctal.txt
echo "...Creando script de rutina..."

touch enigmamachine.sh #Ahora si creamos el script de rutina con touch 
touch cartaCifradaNacisOctal.txt
echo "echo "hola $nombre encontramos esto para tí:"" >> enigmamachine.sh  #Con mayor mayor (>>) podemos enviar un contenido directo a algun archivo que dessemos  
echo "echo "Carta que los nazis cifraron:"" >> enigmamachine.sh 
echo "cat cartaCifrarNacisEntrada.txt" >> enigmamachine.sh #Con Cat mostramos la Carta de Entrada en la terminal
echo "echo "LUEGO ESTA CARTA SE CIFRÓ"" >> enigmamachine.sh  
echo "echo" >> enigmamachine.sh 
echo "echo "Carta de los nacis cifrada en Binario:"" >> enigmamachine.sh
echo "xxd -b  cartaCifrarNacisEntrada.txt cartaCifradaNacisb.txt" >> enigmamachine.sh # AQUI NUESTRO COMANDO ESTRELLA ES: xdd -b , lo que hace este comando es lo siguiente:
#el comando xxd originalmente pasa los archivos de texto a hexadecimal, sin embargo agregando el comando -b, internamente toma lo que paso a exadecimal y lo convierte en binario.
echo "cat cartaCifradaNacisb.txt" >> enigmamachine.sh  #Con Cat mostramos la carta de salida en la terminal
echo "echo" >> enigmamachine.sh  
echo "echo "Carta de los nazis cifrada en Hexadecimal"" >> enigmamachine.sh
echo "xxd cartaCifrarNacisEntrada.txt cartaCifradaNacish.txt" >> enigmamachine.sh #Con Nuesto comando xxd pasamos nuestro archivo de texto a hexadecimal 
echo "cat cartaCifradaNacish.txt" >> enigmamachine.sh # mostramos la carta cifrada de salida en hexadecimal 
echo "echo" >> enigmamachine.sh 
echo "echo "Hemos encontrado la carta cifrada de los Nazis en una en un txt en binario y otra en un txt hexadecimal como se mostró anteriormente"" >> enigmamachine.sh
echo
#Se hace un pequeño menu Interactivo para escoger entre dos opciones 
echo "echo "  --> Presiona 1 si Deseas decifrar la carta hexadecimal"" >> enigmamachine.sh #proponemos decifrar la carta cifrada en  hexadecimal 
echo "echo "  --> Presiona 2 si Deseas convertir la carta binaria a sistema octal""  >> enigmamachine.sh #proponemos pasar la carta binaría y hacer una segunda capa de cifrado a octal
echo "echo" >> enigmamachine.sh 
echo "read item1"   >> enigmamachine.sh #Leemos la respuesta
 
echo  "if [ "$item1" = "1" ]; then" >> enigmamachine.sh # Si(if) item = 1 entonces hacemos lo siguiente: 
#Ejecutamos la primera opción 1 el comando xxd que pasa a hexadecimal, sin embargo sumando -r (estamos dicendo que haga la operación en reversa) -p (opción hace que xxd use formato hexadecimal "simple"), Así podemos invertir el proceso, pasando de texto a hexadecimal
echo  "xxd -r -p cartaCifradaNacish.txt cartaDecifradaNacis.txt" >> enigmamachine.sh  
echo  "echo "¡DECIFRADO CON EXITO!"" >> enigmamachine.sh
echo  "echo "Ya has decifrado el archivo txt cartaCifradaNacis puedes encontrar el mensaje en cartaDecifradaNacis.txt"" >> enigmamachine.sh
echo  "cat cartaDecifradaNacis.txt" >> enigmamachine.sh
#else, si la opción tomada no es la uno, entonces procedemos a volcar nuestro archivo binario a uno hexadecimal 
#esto lo hacemos con el comando  hexdumbp -b, hexdumbp es un filtro que permite mostrar archivos en diferentes formatos especificados por el usuario
#La opción -b permite volcar el contenido del archivo expresando cada byte en formato octal (sistema numérico en base 8)
echo  "else " >> enigmamachine.sh 
echo  "hexdump -b cartaCifradaNacisb.txt >> cartaCifradaNacisOctal.txt" >> enigmamachine.sh
echo  "cat cartaCifradaNacisOctal.txt" >> enigmamachine.sh
echo  "echo "Ya has converitodo  el archivo txt cartaCifradaNacis de Binario a Octal  puedes encontrar el mensaje en cartaCifradaNacisOctal.txt"" >> enigmamachine.sh
echo "fi" >> enigmamachine.sh
echo "echo "Gracias por usar Enigma Machine"" >> enigmamachine.sh
bash  enigmamachine.sh

cp bi20202107038.sh bi20202107038.run #creamos una copía .run de la bitacora 





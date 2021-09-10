# Title: Holabash
# Author: Laura Triana
# Date: 09/09/21
# version: 0.0.1
# Último dígito cédula: 8. Último dígito código: 4. Team: Par.

#Antes de iniciar con el parcial, se borran los archivos creados para una ejecución exitosa.

rm run.run 
rm bin.txt 
rm deci.txt 
rm desci.txt 


#Así mismo, me ubico en mi carpeta de trabajo y creo losarchivos correspondientes:

touch entrada.txt
touch bin.txt
touch deci.txt
touch desci.txt
touch run.run

#Asigno los permisos pedidos

chmod 740 bi20202107004.sh run.run

#Doy inicio con el parcial, simulando una "carta" a Turing.

echo "Hola, Turing...Ups, probablemente no hables español, lo siento...  "
echo "Now, hello! This message comes from the future, and I am going to help you to make encrypting or
decrypting the codes present in the Enigma Machine not so complicated for you."  #Le doy un contexto de la carta a Turing.
echo "" 
echo "I'm a binary code specialist, so first, I'm going to show how text is encrypted to binary code. " #Le doy un contexto de la carta a Turing.
echo ""
echo "Behind the scenes, I left a text message, which I am going to express as a variable called -vali-"
echo "Don't worry, you will see it when I decipher it!"

#La siguiente linea de código hace que el contenido del archivo de entrada.txt se guarde en una variable.
#Utiliza cat para leer el contenido, y sed (con los comandos posteriores) para eliminar los saltos de linea existentes .Fuente (1)                                        

vali=$(cat -v entrada.txt| sed 's/\'^M'//gI') 

echo "Then I use the following code to convert to binary, and send the result to bin.txt via run.txt."

#Luego, utilizo el comando | perl -lpe (Perl es un lenguaje interpretado). Donde -e evalúa la expresión perl, .p permite evaluar cada línea de entrada
# $_ se usa luego de evaluár la expresión, para finalmente con unpack hacer la conversión. Fuente (2)

echo $vali | perl -lpe '$_=unpack"B*"' >> bin.txt 
echo "">> bin.txt
echo "...................................................................................." >> bin.txt
echo "">> bin.txt

#Le doy la opción al usuario (Turing o maestros) de ingresar un texto para convertirlo a binario.
echo "If you like, you can do it too. Enter a short text message:"
read valo           #Utilizo el comando read para guardar la entrada del usuario
echo $valo | perl -lpe '$_=unpack"B*"' >> bin.txt

#Muestro el contenido de las dos conversiones utilizando el comando cat:
echo "Very good! Now, I show you the content converted to binary:" 
echo ""
cat bin.txt   

echo "..............................................................................................."
echo "Also, I can show you the conversion between a binary and a decimal system. Using the above encryption:" 

hexdump -d bin.txt >> deci.txt  #Se utiliza hexdump para leer los bytes en binario e imprimir la salida como número decimal por el -d. Se visualizan los decimales de dos bytes. Fuente (3)
echo "I show you the converted result:"
cat deci.txt
echo "-.................................................................................."

#Descifrado de binario a texto (parte opcional):

echo "Also, as I mentioned, I show you the decryption of the binary code from the start:"

valu=$(cat -v bin.txt| sed 's/\'^M'//gI');   #Nuevamente, creamos otra variable para guardar el archivo bin.txt

#Luego, utilizo el comando | perl -lpe. Esta vez, usando pack en vez de unpack. Fuente (2)
echo $valu| perl -lpe '$_=pack"B*",$_'>> desci.txt 

echo "I finally show you the message!"

cat desci.txt   #Muestro el mensaje ingresado en un inicio al .txt.
echo ""
echo "That's it! I hope you complete your journey, and continue to impact the world."
echo ""
echo "Oh...I forgot to tell you something VERY important, Turing! Today there are emojis:"

printf '\U1F984\n'
printf '\U1F63E\n' #Muestro emojis ;). Fuente (4)
printf '\U1F60E\n' 


echo " Thanks for your time, I'm going to go back to mine :D"

#Realizo una copia .run
cp bi20202107004.sh run.run
#Creo la carpeta a comprimir
mkdir pro20202107004
#Muevo los archivos correspondientes a la carpeta
mv entrada.txt pro20202107004
mv run.run pro20202107004
mv bin.txt pro20202107004
mv deci.txt pro20202107004
mv desci.txt pro20202107004

#Comprimo los archivos .txt y .run
# tar -czvf pro20202107004.tar.gz   (lo pongo en comentario o se borra la entrada .txt)

#Descomprimo con ayuda de ru20202107004.sh


#Referencias:
# (1) https://www.enmimaquinafunciona.com/pregunta/154876/elimina-todos-los-saltos-de-linea-que-siguen-al-retorno-de-carro-m-y-une-las-lineas
# (2) https://qastack.mx/unix/98948/ascii-to-binary-and-binary-to-ascii-conversion-tools
# (3) https://conpilar.es/como-usar-el-comando-linux-hexdump-con-ejemplos-practicos/
# (4) https://unix.stackexchange.com/questions/466961/adding-emojis-on-to-a-script-not-working

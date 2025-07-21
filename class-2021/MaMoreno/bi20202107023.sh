#!/bin/bash
#Author María Moreno 

#Date 21-09-09
#Version 1.0.0
#crear ejecutable .run 
touch ejecutable.run 
echo -e " #Author: María Alejandra Moreno (cod_end = 3; cc_end =3)">> ejecutable.run 
echo -e "#Date 21-09-09 ">>ejecutable.run 
echo -e "#Version 1.0.0">> ejecutable.run 
#Para pasar información desde un .txt
#hexdump -c Mensaje_.txt >> salida.txt # Así puedo pasar a ASCCI el mensaje.


#while IFS= read -r line; do
#  printf '%s\n' "$line"
#done < mensaje_codificado.txt  ---> no concatena como necesito :(

#------->>ejecutable.run para pasar la información final al archivo ejecutable----
echo -e "line=$(cat -v imensajeascci.txt | sed 's/\'^M'//gI')" >> ejecutable.run  #---> utiliza sed para concatenar los espacio y sacar la informacion linea a linea 
echo -e "line_bi=$(cat -v imensajebin.txt | sed 's/\'^M'//gI')"  >> ejecutable.run  
echo -e "line_oct=$(cat -v imensajeoct.txt | sed 's/\'^M'//gI')">> ejecutable.run 
#Estas funciones son para convertir los caracteres
# chrbin entran vinarios salen octales toma el primer argumento $1 ($1 significa primer argumentodel file https://bash.cyberciti.biz/guide/$1 )
# el // significa "Displays a backslash character"

echo -e "
chrbin() {
    echo $(printf \\$(echo "ibase=2; obase=8; "'$1'"" | bc))
} " >> ejecutable.run
echo -e "
ordbin() {
  a=$(printf '%d' '$1' )            
  echo "obase=2; '$a'" | bc           
}" >> ejecutable.run
echo -e " 
ordoct(){
   a=$(printf '%d' '$1') 
    echo "obase=8; '$a'" | bc
}" >> ejecutable.run
#--->asigancion decimal para encontrar su equivalente
#---> convierte a decimal a donde a es la impresion "printf" con conversion de especificacion
# "%d" que optine un entero decimal con signo. https://linuxize.com/post/bash-printf-command/

  
# ---> input field separator "IFS"---- $* es parametro especial para conectar espacios "concatenar"
#-- tr es un metodo para eliminar caracteres de  strings donde tr -d elimina los caracteres definidos
echo -e "
 function textobinario () {
    echo -n "'$*'" | while IFS= read -r -n1 char 
    do
        ordbin "'$char'" | tr -d "'`\n`'"
    
        echo -n " "
    done
} " >> ejecutable.run
echo -e "
function binariotexto () {
    for bin in "'$*'" 
    do
        chrbin "'$bin'" | tr -d "'\n'"
        
    done
}">> ejecutable.run  
#Siguendo la misma logica para cifrar en octal utilizar ordoctal donde se cambio la base de salida obase por 8. 
echo -e "function textooctal () {
    echo -n "'$*'" | while IFS= read -r -n1 char2 
    do
        ordoct  "'$char2'"| tr -d "'\n'"
    
        echo -n " "
    done
}" >>ejecutable.run 

#creando archivos de salida 
echo -e "touch textobinario.txt textooctal.txt binariotexto.txt">>ejecutable.run 

echo -e "textobinario '$line'>>textotextobinario.txt" >>ejecutable.run
echo -e "binariotexto '$line_bi'>>binariotexto.txt">>ejecutable.run
echo -e "textooctal '$line_oct' >>textooctal.txt">> ejecutable.run 
# Yupi!!!... por fin funciono!!!
#Ultimando detalles del la bitacora 
#Asignar permisos "tener permisos de lectura para los usuarios de su equipo; lectura,tener permisos de lectura para los usuarios de su equipo; lectura,"
chmood 760 bi20202107023.sh

touch ru20202107023.sh  
echo -e " gzip -d imensajeascci.txt.gz">>ru20202107023.sh
echo -e "gzip -d imensajebin.txt.gz">>ru20202107023.sh
echo -e "gzip -d imensajeoct.txt.gz">>ru20202107023.sh
echo -e "gzip -d textooctal.txt.gz">>ru20202107023.sh
echo -e "gzip -d textotobinario.txt.gz">>ru20202107023.sh
echo -e "gzip -d binariotexto.txt.gz">>ru20202107023.sh





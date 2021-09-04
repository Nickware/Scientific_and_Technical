# Taller Hola Bash 
# Bitacora .sh 
# Author: Alejandra Moreno.  
echo "Borrando carpetas previas"
rm -rf $nice

echo "Ubicar en la raiz"
pwd
echo "Ubicarse en una carpeta"
cd ~/20202107023/HolaBash
ls -la 
echo " Numero de carpetas de la raíz"
ls | wc
echo "Creeación del ejecutable"
echo "Por favor asigne un nombre para el ejecutable: "
read nice

echo "Crear carpeta de prueba"
mkdir $nice

echo "Ubicando la carpeta "
cd  $nice

#Crear ejecutable .run 
touch  $nice.run 
#Crear .txt
touch  $nice.txt  
chmod 731 bitacora.sh 
                                         
                                                                            #echo " Nombre Taller Hola Bash 
                                                                            #Usted esta ubicado en la carpeta 20202107023Taller
                                                                            #La carpeta 20202107023Taller tiene permisos rrwx-rwx
                                                                            #El nombre de este ejecutable es: Hola.run" >> 20202107023.txt
                                                                            #echo "Abriendo Archivo"
                                                                            #less 20202107023.txt
                                                                            #echo "Unbicarse de nuevo "
                                                                            #cd /home/tito2/20202107023/HolaBash
                                                                            #echo "Copiando bitacora "
                                                                            #cp 20202107023.sh  /home/tito2/20202107023/HolaBash/20202107023Taller
                                                                            #echo  /home/tito2/20202107023/HolaBash  /home/tito2/20202107023/HolaBash/20202107023Taller | xargs –n 1 cp /home/tito2/20202107023/HolaBash/20202107023.sh
                                                                            #echo "Convertir en un ejecutable "
                                                                            #mv 20202107023.sh 20202107023.run 
                                                                            #echo "Leer el ejecutable"
                                                                            #cat 20202107023.run

                                                                            #Creando el ejcutable 
                                                                            #echo "Creeación del ejecutable"
                                                                            #echo "Por favor asigne un nombre para el ejecutable: "
                                                                            #echo "read nice"
                                                                            #touch  $nice.run 
#Opteniendo entradas del usuario. 
echo "echo -e "Hola, igrese el nombre de quíen esta ejecutando:"">>$nice.run 
echo "read basher ">> $nice.run 
echo "echo " Bienvenido a HolaBash  '$basher'. ">> $nice.txt" >>$nice.run 
#echo "echo -e " Usted esta ubicado en `pwd`">> $nice.txt" >> $nice.run 

#Usted es ubicado en: 
echo " echo -e " '$basher' , se encuentra ubicado en:`pwd` ">> $nice.txt">> $nice.run 
#echo "`pwd`'">> $nice.run 
#echo " `ls -lap` >>  $nice.txt" >> $nice.run 
#echo "echo -e "Esta es la raíz de su ubicación: `pwd`" >> $nice.txt>>" $nice.run

#Los permisos: 
echo " echo -e " '$basher', En esta ubicación `pwd` tiene los siguentes permisos: ">> $nice.txt" >> $nice.run

echo "echo " `ls -la`"  >> $nice.txt" >>$nice.run  
echo "echo -e "`ls | wc`" >> $nice.txt">> $nice.run

#Nombre del ejecutable: 
 
 #echo -e " `'$basher'` , por favor asigne un nombre a este ejecutable ">>20202107023.run 
 #echo " read  nice  " >> 20202107023.run 
 #echo " mv 20202107023.run $nice.run  " >> 20202107023.run 
 echo "echo -e " '$basher', el nombre de este  ejecutable es: $nice.run " >> $nice.txt" >> $nice.run
 #echo " bash 20202107023.txt  " >> `'$nice'`.run 
 #Bueno eso no funciono. no se puede nombrar el archivo con la variable. :(

 #echo "echo -e " '$basher' el nombre del ejecutable es: 20202107023.run ">>20202107023.txt">> 20202107023.run 
 #echo " less 20202107023.txt">> 20202107023.run 
 echo "cat $nice.txt ">> $nice.run 

 #Finalmente. 

 echo "Ejecutar .run"
bash $nice.run 
cd ..
zip -r HolaBash.zip  /home/tito2/20202107023/HolaBash
echo "THE END"
  













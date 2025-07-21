#!/usr/bin/bash
#Welcome to matrix Lab
#Author:Laura Sofía Cortes, Justin Stiven Santana, Juan Sebatián Sánchez
#title: Operadora de matrices Matrix
echo "  __  __    _    _____  ___  ___ __  __ "
echo " |  \/  |  /_\  |_   _|| _ \|_ _|\ \/ / "     #Titulo presentación calculadora 
echo " | |\/| | / _ \   | |  |   / | |  >  < "
echo " |_|  |_|/_/ \_\  |_|  |_|_\|___|/_/\_\ "
echo ""
echo "Bienvenido a la operadora de matices 3x3 MATRIX"   #Se añade un saludo
echo "a cotinuación elije cualquiera de las siguientes opciones presionando el número correspondiente a la opción"  #Se pide al Usuario digitar una opción
opciones="Sumar(A+B) Multiplicar(AB)"   #Se plantean las dos opciones posibles en la variable opciones 
select opcion in $opciones;          # con select se organizan los datos de la variable opciones en una lista de tal forma que que estos datos se asocian a un número y se guardan en una variable
do                                                
if [ $opcion = "Sumar(A+B)" ]; then   #abrimos condicional, si la variable opcion coincide con el dato sumar(A+B) entonces se ejecuta el proceso para la suma de matrices
echo "----------SUMAR MATRICES----------"
echo "--->A continuación ingresa los datos de tu matriz A 3x3<---"
echo ""
echo "Ingresa la fila 1 de tu Matriz dejando espacios entre cada dato, por ejemplo: 1 2 -3" #---->los datos ingresados se guardan en variables seguidas que seran leidas en el orden digitado  
read a11 a12 a13
echo "Ingresa la fila 2 dejando espacios"
read a21 a22 a23
echo "Ingresa la fila 3 dejando espacios"
read a31 a32 a33 

echo "Tu Matriz A es la Siguiente"
echo ""
echo "   |$a11  $a12  $a13|"
echo "A= |$a21  $a22  $a23|"   #-------------->  Finalmente se presentan organizados los datos de la matriz A  
echo "   |$a31  $a32  $a33|" 
echo "------------------------------------"
echo ""
echo "--->Ahora ingresa los datos de tu matriz B 3x3<---"
echo ""
echo "Ingresa la fila 1 dejando espacios"               
read b11 b12 b13
echo "Ingresa la fila 2 dejando espacios"             #------------> Se repite el proceso anteriormente propuesto
read b21 b22 b23
echo "Ingresa la fila 3 dehando espacios"
read b31 b32 b33 

echo ""
echo "Tu Matriz B es la Siguiente:"

echo "   |$b11  $b12  $b13|"
echo "B= |$b21  $b22  $b23|"
echo "   |$b31  $b32  $b33|"
echo "---------------------------------"
echo ""
echo "La suma de la matrices A y B (A+B) es la siguiente:"
echo "       |$a11  $a12  $a13|     |$b11  $b12  $b13|     |$a11+$b11  $a12+$b12  $a13+$b13|" 
echo "(A+B)= |$a21  $a22  $a23|  +  |$b21  $b22  $b23|  =  |$a21+$b21  $a22+$b22  $a23+$b23|"  #----> Se presentan los datos ingresados, de tal forma que el usuario pueda ver que procedimiento realizamos en la suma de matrices
echo "       |$a31  $a32  $a33|     |$b31  $b32  $b33|     |$a31+$b31  $a32+$b32  $a33+$b33|"  
echo ""
#---------------------
AB11=`echo $a11+$b11 | bc` 
AB12=`echo $a12+$b12 | bc`   
AB13=`echo $a13+$b13 | bc`

AB21=`echo $a21+$b21 | bc`                      #-----> se realizan las respectivas operaciones de Suma y se guardan en variables que permitan una organización sencilla de entender

AB22=`echo $a22+$b22 | bc`
AB23=`echo $a23+$b23 | bc`

AB31=`echo $a31+$b31 | bc`
AB32=`echo $a32+$b32 | bc`
AB33=`echo $a33+$b33 | bc`
#---------------------
echo ""
echo "Perfecto!, tú matriz resultante es:"
echo "       |$AB11  $AB12  $AB13|"
echo "(A+B)= |$AB21  $AB22  $AB23|"
echo "       |$AB31  $AB32  $AB33|"                     #Se muestra finalmente el resultado dinal de las operaciones 
echo ""
echo "---> 1) Sumar(A+B)"
echo "---> 2) Multiplicar(AB)"                          #se enseña nuevamente el menú debido a que este queda implicito y el mismo código no lo vuelve a enseñar
echo "---> 3) Salir"

elif [ $opcion = "Multiplicar(AB)" ]; then
echo "-----------MULTIPLICACIÓN ENTRE MATRICES---------------"      #con elif planteamos otra de las posibles opciones, en las que la variable opcion ahora es equivalente a el dato "Multiplicar(AB)"
echo ""
echo "--->A continuación ingresa los datos de tu matriz A<---"
echo ""
echo "Ingresa la fila 1 de tu Matriz dejando espacios entre cada dato, por ejemplo: 1 2 -3"     
read ma11 ma12 ma13
echo "Ingresa la fila 2 dejando espacios"
read ma21 ma22 ma23
echo "Ingresa la fila 3 dejando espacios"
read ma31 ma32 ma33 

echo "Tu Matriz A es la Siguiente"           #----> al igual que en el anterior item, aquí pedimos nuevamente los datos de la matriz A y B
echo ""                                             
echo "   |$ma11  $ma12  $ma13|"
echo "A= |$ma21  $ma22  $ma23|"
echo "   |$ma31  $ma32  $ma33|" 
echo "------------------------------------"
echo ""
echo "--->Ahora ingresa los datos de tu matriz B<---"
echo ""
echo "Ingresa la fila 1 dejando espacios"                   
read mb11 mb12 mb13
echo "Ingresa la fila 2 dejando espacios"
read mb21 mb22 mb23
echo "Ingresa la fila 3 dehando espacios"
read mb31 mb32 mb33 

echo ""
echo "Tu Matriz B es la Siguiente:"

echo "   |$mb11  $mb12  $mb13|"
echo "B= |$mb21  $mb22  $mb23|"
echo "   |$mb31  $mb32  $mb33|"
echo "---------------------------------"
echo ""
echo "El producto entre las matrices A y B (AB) es el siguiente:"
echo "      |$ma11  $ma12  $ma13|     |$mb11  $mb12  $mb13|     " 
echo "(AB)= |$ma21  $ma22  $ma23|  *  |$mb21  $mb22  $mb23|     "     #---> mostramos al usuario las matrices organizadas antes de 
echo "      |$ma31  $ma32  $ma33|     |$mb31  $mb32  $mb33|     "  
echo ""
#--------------------------
echo "....calculando...."
echo ""
mAB11a=`echo $ma11*$mb11 | bc`
mAB11b=`echo $ma12*$mb21 | bc`
mAB11c=`echo $ma13*$mb31 | bc`                #Se plantean las respectivas operaciones
mAB11=`echo $mAB11a+$mAB11b+$mAB11c | bc`     #la suma de las multiplicaciones anteriores se guarda en una variable, que se mostrara en la matriz final 

mAB12a=`echo $ma11*$mb12 | bc`
mAB12b=`echo $ma12*$mb22 | bc`
mAB12c=`echo $ma13*$mb32 | bc`                       
mAB12=`echo $mAB12a+$mAB12b+$mAB12c | bc`

mAB13a=`echo $ma11*$mb13 | bc`
mAB13b=`echo $ma12*$mb23 | bc`                         #Se repite este proceso hasta tener todas las variables para organizar en la matriz final
mAB13c=`echo $ma13*$mb33 | bc`
mAB13=`echo $mAB13a+$mAB13b+$mAB13c | bc`
#----------------------------
mAB21a=`echo $ma21*$mb11 | bc`
mAB21b=`echo $ma22*$mb21 | bc`
mAB21c=`echo $ma23*$mb31 | bc`
mAB21=`echo $mAB21a+$mAB21b+$mAB21c | bc`

mAB22a=`echo $ma21*$mb12 | bc`
mAB22b=`echo $ma22*$mb22 | bc`
mAB22c=`echo $ma23*$mb32 | bc`
mAB22=`echo $mAB22a+$mAB22b+$mAB22c | bc`

mAB23a=`echo $ma21*$mb13 | bc`
mAB23b=`echo $ma22*$mb23 | bc`
mAB23c=`echo $ma23*$mb33 | bc`
mAB23=`echo $mAB23a+$mAB23b+$mAB23c | bc`
#--------------------------
mAB31a=`echo $ma31*$mb11 | bc`
mAB31b=`echo $ma32*$mb21 | bc`
mAB31c=`echo $ma33*$mb33 | bc`
mAB31=`echo $mAB31a+$mAB31b+$mAB31c | bc`

mAB32a=`echo $ma31*$mb12 | bc`
mAB32b=`echo $ma32*$mb22 | bc`
mAB32c=`echo $ma33*$mb32 | bc`
mAB32=`echo $mAB32a+$mAB32b+$mAB32c | bc`

mAB33a=`echo $ma31*$mb13 | bc`
mAB33b=`echo $ma32*$mb23 | bc`
mAB33c=`echo $ma33*$mb33 | bc`
mAB33=`echo $mAB33a+$mAB33b+$mAB33c | bc`
#---------------------------
echo ""
echo "Perfecto, tu matriz resultante es la siguiente:"
echo ""
echo "      |$mAB11  $mAB12  $mAB13|"               #Se organizan los datos de las variables finales para mostrar al usuario
echo "(AB)= |$mAB21  $mAB22  $mAB23|"
echo "      |$mAB31  $mAB32  $mAB33|"
echo ""
echo "---> 1) Sumar(A+B)"
echo "---> 2) Multiplicar(AB)"
echo "---> 3) Salir"
else 
echo
echo "---->¡Gracias por usar la calculadora¡<----"   #si el ususario digita un número diferente de los propuestos, terminará la ejecución del Script   
echo "---->Que Gauss te acompañe<----"

exit
fi
done
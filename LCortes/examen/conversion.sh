#!/usr/bin/bash
#titulo: Coordenadas cartesianas a polares y viceversa
#autor: Justin Santana, Laura Sofia Cortes, Juan Sebastian Sanchez
#version:0.0.01
pi=$(echo "scale=10; 4*a(1)" | bc -l) #se definen pi con 10 decimales
echo "Bienvenido, programa de conversion de coordenadas (polares y cartesianas)"
echo "Comencemos"
s="1"
while [ $s -eq "1" ] #se repetira el script hasta que s sea 0
do                   #hacer lo siguiente mientras s=1
echo -e "Si desea pasar de coordenadas polares a cartesianas digite '1' si desea 
lo contrario digite '2'"
read v
if [ $v == "1" ] #un condicional que hara algo diferente dependiendo de que numero elijamos
then             #si v=1 entonces hacer lo siguiente
echo "Usted eligio 'coordenadas polares a cartesianas'"
echo -e "Digite la magnitud del vector r"
read pr                                                           #leer magnitud r
echo "Ahora elija si su angulo esta en radianes o en grados"
echo -e "1:radianes, 2:Grados. Digite solamente el numero correspondiente"
read pa                                                          #leer si el angulo esta en rad o en grados
    if [ $pa == "1" ]                                            #si el angulo esta radianes
    then                                                         #hacer lo siguiente
    echo "Usted elogio radianes"
    echo -e "Ahora dijite el angulo en radianes"
    read r                                                       #leer el angulo
    rg=$(echo "($r*180)/$pi" | bc -l)                            #conversion de radianes a grados              
    echo "Su angulo $r en grados es: $rg"                        #operaciones necesarias para hallar su equivalente van por debajo
    x=$(echo "$pr*c($r)" | bc -l)                                #magnitud por coseno del angulo en rad
    y=$(echo "$pr*s($r)" | bc -l)                                #magnitud por seno del angulo en rad
    echo "La conversion de coordenadas polares a cartesianas es: x=$x y y=$y
    ($x,$y)"
echo "¿Desea hacer otra conversion?"
echo -e "1:si, 2:no, digite el numero correspondiente"
read last                                                       #lea la desicion
if [ $last == "1" ]                                             #si la respuesta es si
then                                                            #diga lo siguiente
echo "Bienvenido"                                               #si lo desea puede terminar con el bucle
elif [ $last == "2" ]                                           #si la respuesta es no
then                                                            #s=0 y se termina el bucle
s="0"
echo "Gracias por usar este programa :)"
fi                                                     
    elif [ $pa == "2" ]                                         #si el angulo esta en grados                  
    then                                                        #haga lo siguiente
    echo "Usted escogio grados"
    echo -e "Ahora digite el angulo en grados. Nota: Escribir el angulo sin el simbolo '°'"
    read r                                                     #leer el angulo
    rg=$(echo "($r*$pi)/180" | bc -l)                          #conversion de grados a radianes
    echo "Su angulo $r en radianes es: $rg"                    #operaciones por debajo para hallar el equivalente  en coordenadas cartesianas
    x=$(echo "$pr*c($rg)" | bc -l)                             #magnitud por coseno del angulo en rad
    y=$(echo "$pr*s($rg)" | bc -l)                             #magnitud por seno del angulo en rad
    echo "La conversion de coordenadas polares a cartesianas es: x=$x y y=$y
    ($x,$y)"
echo "¿Desea hacer otra conversion?"
echo -e "1:si,2:no, digite el numero correspondiente"
read last                                                    #leer desicion
if [ $last == "1" ]                                          #si la respuesta es si
then                                                         #diga lo siguiente
echo "Bienvenido"
elif [ $last == "2" ]                                        #si la respuesta es no
then
s="0"                                                        #s=0 y el bucle termina
echo "Gracias por usar el programa :)"
fi
    fi                                                       #se termina programa de conversion polar a cartesiana
elif [ $v == "2" ]                                           #si elige 2(cartesianas a polares)
then 
echo "usted eligio 'coordenadas cartesianas a polares' "
echo -e "Digite la cordenada x"
read x                                                       #le pregunta al usuario los valores x y y
echo -e "Digite la cordenada y"
read y
m=$(echo "($x^2)+($y^2)" | bc -l)
mg=$(echo "sqrt($m)" | bc -l)                                #calcula de la magnitud
f=$(echo "$y/$x" | bc -l)
d=$(echo "a($f)" | bc -l)                                    #calculo del angulo
echo "la magnitud r es:$mg"
echo "El angulo en rad es:$d"
dd=$(echo "($d*180)/$pi" | bc -l)                            #conversion de radianes a grados
echo "El angulo en grados es:$dd"
echo "Desea hacer otra conversion?"                          
echo -e "1:si,2:no, digite el numero correspondiente"       
read last
if [ $last == "1" ]
then
echo "Bienvenido"
elif [ $last == "2" ]
then          #fin del script del 
s="0"
echo "Gracias por usar el programa :)"
fi
fi
done 
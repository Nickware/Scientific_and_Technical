#!/usr/bin/bash
#titulo:Juegos de preguntas
#autor:Juan Sebastian Sanchez, Justin Steven Santana, Laura sofia Cortes
#version:0.01

#incio del programa
#definiendo algunas variables para sumar puntos
t=0
si=1
no=0

#intro
echo "Bienvenido al Juego de preguntas y respuestas"
echo "Tendras que responder 5 preguntas de opcion multiple (Responde solo con a,b o c)"
echo "Si respondes todas las preguntas obtendras el titulo de 'Hijo de Gauss'"
echo "Are you ready?...Comencemos"
#primera pregunta
echo -e "Primera pregunta: ¿Cuanto es dos mas dos?"
echo "a. 4"
echo "b. 3"
echo "c. 5"
read p1                                       #lea variable p1
if [ $p1 == "a" ]                             #si p1 es a
then                                          #entonces diga lo siguiente
echo "Correcto!!"
t1=$(echo "$t+$si" | bc )                     #sumar punto
else                                          #de lo contrario entonces
echo "Error, la respuesta es a"
t1=$(echo "$t+$no")                           #no sumar punto
fi                                            #fin pregunta 1
#segunda pregunta
echo -e "Segunda pregunta: ¿Cual es el teorema fundamental del algebra?"
echo "a. (a+b)^2=a^2+2ab+b^2"
echo "b. Una función polinomial de grado n tiene exactamente n ceros en el conjunto de números complejos, contando ceros repetidos"
echo "c. El limite cuando L tiende a cero de (f(x+l)-f(x))/l "
read p2                                     #lea variable p2
if [ $p2 == "b" ]                           #si p2 es b
then                                        #entonces diga lo siguiente
echo "Correcto!!"
t2=$(echo "$t+$si" | bc )                   #sumar punto
else                                        #de lo contrario entonces
echo "Error, la respuesta es b"
t2=$(echo "$t+$no")                         #no sumar punto
fi                                          #fin pregunta 2
#tercera pregunta
echo -e "Tercera pregunta ¿Que metodo matematico se utiliza para demostrar 1/(n(n+1))=n/(n+1)?"
echo "a. Tabular"
echo "b. Reduccion a lo absurdo"
echo "c. Induccion matematica"
read p3                                     #lea variable p3
if [ $p3 == "c" ]                           #si p3 es c
then                                        #entonces diga lo siguiente
echo "Correcto!!!"                          
t3=$(echo "$t+$si" | bc )                   #sumar punto
else                                        #de lo contrario entonces
echo "error, la respuesta es a :/" 
t3=$(echo "$t+$no")                         #no sumar punto
fi                                          #fin pregunta 3
#cuarta pregunta
echo -e "Cuarta pregunta ¿Cual es la definicion de integral indefinida?"
echo "a. Ninguna es correcta"
echo "b. El area bajo la curva"
echo "c. La integral indefinida es el conjunto de las infinitas primitivas que puede tener una función."
read p4                                     #lea variable p4
if [ $p4 == "c" ]                           #si p4 es c
then                                        #entonces diga lo siguiente
echo "Correcto!!!"
t4=$(echo "$t+$si" | bc )                   #sumar punto
else                                        #de lo contrario entonces
echo "error, la respuesta es c :/"
t4=$(echo "$t+$no")                         #no sumar punto
fi                                          #fin pregunta 4
#cuarta pregunta
echo -e "Quinta y ultima pregunta ¿Quien es Carl Friedrich Gauss?"
echo "a. Matematico"
echo "b. Politologo"
echo "c. Actor de ironman"
read p5                                     #lea variable p5
if [ $p5 == "a" ]                           #si p5 es a
then                                        #entonces diga lo siguiente
echo "Correcto!!!"
t5=$(echo "$t+$si" | bc )                   #sumar punto
else                                        #de lo contrario entonces
echo "error, la respuesta es a :/"
t5=$(echo "$t+$no")                         #no sumar punto
fi                                          #fin pregunta 4
#sumar puntaje
tt=$(echo "$t1+$t2+$t3+$t4+$t5" | bc)         #sumando puntajes
echo "Respuestas correctas:"
echo "$tt"
if [ $tt == "5" ]                               #si el puntaje es 5
then                                            #entonces diga    
echo "Eres todo un hijo de Gauss"
else                                            #de lo contrario
echo "Sigue intentando" 
fi                                              #final de puntuacion
echo "Fin del juego :)"
echo "Gracias por jugar"
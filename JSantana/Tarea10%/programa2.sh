#!/usr/bin/bash
#autor:Juan Sebastian Sanchez
#VERSION:0.01
#titulo:Juegos de preguntas

echo "Bienvenido al Juego de preguntas y respuestas"
echo "Tendras que responder 5 preguntas de opcion multiple(digite solo a,b o c)"
echo "Si respondes todas las preguntas obtendras el titulo de 'hijo de Gauss'"
echo "Comencemos"
echo -e "primera pregunta:¿Cuanto es dos mas dos?"
echo "a.4"
echo "b.3"
echo "c.5"
read p1
if [ $p1 == "a" ]
then
echo "Correcto!!"
else
echo "error, la respuesta es a :/"
fi
echo -e "Segunta pregunta:¿Cuanto es dos mas dos?"
echo "a.(a+b)^2=a^2+2ab+b^2"
echo "b.Una función polinomial de grado n tiene exactamente n ceros en el conjunto de números complejos, contando ceros repetidos "
echo "c.El limite cuando L tiende a cero de (f(x+l)-f(x))/l "
read p2
if [ $p2 == "b" ]
then
echo "Correcto!!"
else
echo "error, la respuesta es b :/"
fi
echo -e "Tercera pregunta ¿Que metodo matematico utilizamos para demostrar 1/(n(n+1))=n/(n+1)?"
echo "a.tabular"
echo "b.reduccion a lo absurdo"
echo "c.induccion matematica"
read p3
if [ $p3 == "c" ]
then
echo "Correcto!!!"
else
echo "error, la respuesta es a :/"
fi
echo -e "Cuarta pregunta¿Cual es la definicion de integral indefinida?"
echo "a. Ninguna es correcta"
echo "b.El area bajo la curva"
echo "c.La integral indefinida es el conjunto de las infinitas primitivas que puede tener una función."
read p4
if [ $p4 == "c" ]
then
echo "Correcto!!!"
else
echo "error, la respuesta es c :/"
fi
echo -e "Ultima¿Quien es Carl Friedrich Gauss?"
echo "a. Matematico"
echo "b. Politologo"
echo "c. Actor de ironman"
read p5
if [ $p5 == "a" ]
then
echo "Correcto!!!"
else
echo "error, la respuesta es a :/"
fi
t=0
si=1
no=0
if [ $p1 == "a" ] 
then
t1=$(echo "$t+$si" | bc ) 
else
t1=$(echo "$t+$no")
fi
if [ $p2 == "b" ] 
then
t2=$(echo "$t+$si" | bc ) 
else
t2=$(echo "$t+$no")
fi
if [ $p3 == "c" ] 
then
t3=$(echo "$t+$si" | bc ) 
else
t3=$(echo "$t+$no")
fi
if [ $p4 == "c" ] 
then
t4=$(echo "$t+$si" | bc ) 
else
t4=$(echo "$t+$no")
fi
if [ $p5 == "a" ] 
then
t5=$(echo "$t+$si" | bc ) 
else
t5=$($t+$no)
fi
tt=$(echo "$t1+$t2+$t3+$t4+$t5" | bc)
echo "Respuestas correctas"
echo "$tt"
if [ $tt == "5" ] 
then
echo "Eres todo un hijo de Gauss"
else
echo "sigue intentando" 
fi
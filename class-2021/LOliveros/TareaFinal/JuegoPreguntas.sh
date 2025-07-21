#! /usr/bin/bash.exe
#author: Laura Oliveros y Juan Aristizabal 
#data: 27/09/21 
#version: 0.0.1

echo "Bienvenid@s al juego de PREGUNTAS Y RESPUESTAS"
echo
echo "Si aciertas todas las respuestas obtendras el título de MAESTRO"
echo
echo "¿List@s para jugar?....!Vamos!"

score=0
echo
echo "Pregunta 1: ¿En qué año se fundó la banda de rock AC/DC?"
opciones=(a.1970 b.1980 c.1973 d.1983)
echo ${opciones[*]}
read R 
echo
if [ $R = c ];
then 
echo "Muy bien, esa es la respuesta correcta"
else 
echo "No acertaste, la respuesta correcta es c.1973"
fi
echo
if [ $R = c ];
then 
P1=$(($score + 1))
echo "Tu puntaje es $P1"
else 
P1=$(($score + 0))
echo "Tu puntaje es $P1"
fi 
echo
echo "¿List@s para la siguiente pregunta?"
echo
echo "Pregunta 2: ¿Qué artista pintó "La Creación de Adán?"" 
opciones1=(a.Leonardo Da Vinci b.Miguel Ángel c.Donatello d.Rafael)
echo ${opciones1[*]}
read S 
echo
if [ $S = b ];
then 
echo "Muy bien, esa es la respuesta correcta"
else 
echo "No acertaste, la respuesta correcta es b.Miguel Ángel "
fi 
echo
if [ $S = b ];
then 
P2=$(($P1 + 1))
echo "Tu puntaje es $P2"
else 
P2=$(($P1 + 0))
echo "Tu puntaje es $P2"
fi 
echo 
echo "¡Ánimo!"
echo
echo "Pregunta 3: ¿Cuál es el nombre de la mujer considerada como la madre del Álgebra?" 
opciones1=(a.Marie Curie b.Hedy Lamarr c.Lise Meitner d.Emmy Noether)
echo ${opciones1[*]}
read W 
echo
if [ $W = d ];
then 
echo "Muy bien, esa es la respuesta correcta"
else
echo "No acertaste, la respuesta correcta es d.Emmy Noether"
fi
echo 
if [ $W = d ];
then 
P3=$(($P2 + 1))
echo "Tu puntaje es $P3"
else 
P3=$(($P2 + 0))
echo "Tu puntaje es $P3"
fi 
echo "Vamos por la siguiente, no te rindas"
echo 
echo "Pregunta 4: ¿Cómo se llama el escritor del libro Rayuela?" 
opciones1=(a.Julio Cortázar b.Paulo Coelho c.Mario Benedetti d.Pablo Neruda)
echo ${opciones1[*]}
read X
echo
if [ $X = a ];
then 
echo "Muy bien, esa es la respuesta correcta"
else
echo "No acertaste, la respuesta correcta es a.Julio Cortázar"
fi
echo 
if [ $X = a ];
then 
P4=$(($P3 + 1))
echo "Tu puntaje es $P4"
else 
P4=$(($P3 + 0))
echo "Tu puntaje es $P4"
fi 
echo
echo "Pregunta Final"
echo 
echo "Pregunta 5: ¿Cuál es el ser vivo más peligroso en el mundo?" 
opciones1=(a.Tiburón blanco b.Escorpión de Morelos c.Serpiente Taipán d.Humano)
echo ${opciones1[*]}
read Z
echo
if [ $Z = d ];
then 
echo "Muy bien, esa es la respuesta correcta"
else
echo "No acertaste, la respuesta correcta es d. Humano"
fi
echo
if [ $Z = d ];
then 
P5=$(($P4 + 1))
echo "Tu puntaje es $P5"
else 
P5=$(($P4 + 0))
echo "Tu puntaje es $P5"
fi 
echo

echo "Ahora si, el título de acuerdo a la cantidad de preguntas correctas contestadas es....Redoble de tambores"
echo
if [ $P5 -ge 4 ] 
then 
echo "¡Felicidades! Ganaste el título de MAESTRO "
else
echo "Más suerte a la próxima"
fi
echo 

echo "Gracias por jugar el juego de PREGUNTAS Y RESPUESTAS"

exit 0
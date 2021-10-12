#!/usr/bin/bash.exe
#Date: 10/10/2021
#Authors: Santiago Criollo Bermudez & Juan Diego Martinez Ayala
#Version: 0.0.1
#Title: Juego de preguntas y respuestas


r=0
c=1
i=0

echo "Bienvenido $USER al juego de preguntas y respuestas"
echo
echo "Si acierta todas las respuestas tendrá el titulo de MAESTRO"

read -p "Pulse enter para continuar: " Enter
sleep 2
echo
echo "Primera pregunta"
echo 
echo "¿Quién escribió Don Quijote de la Mancha?"
echo "a. William Shakespeare"
echo "b. Miguel de Cervantes"
echo "c. Pablo Coelho"
echo "d. Gabriel García Marquez"
echo
read -p "Su respuesta es: " r1

    if [ $r1 == "b" ]
        then 
        echo "Felicidades, respuesta correcta"
        r1=$(echo "$r+$c" | bc )
        else
        echo "Lo siento. La respuesta correcta es: b "
        r1=$(echo "$r+$i" | bc)
    fi

echo
echo "Segunda pregunta"
echo 
echo "¿Cuál es el oceano más grande del mundo?"
echo "a. Oceano Átlantico"
echo "b. Oceano Indico"
echo "c. Oceano Pacífico"
echo "d. Oceano Artíco"
echo
read -p "Su respuesta es: " r2

    if [ $r2 == "c" ]
        then 
        echo "Felicidades, respuesta correcta"
        r2=$(echo "$r+$c" | bc )
        else
        echo "Lo siento. La respuesta correcta es: c "
        r2=$(echo "$r+$i" | bc)
    fi

echo
echo "Tercera pregunta"
echo 
echo "¿Cuál es el país con más población en el mundo?"
echo "a. China"
echo "b. India"
echo "c. Estados Unidos"
echo "d. Rusia"
echo
read -p "Su respuesta es: " r3

    if [ $r3 == "a" ]
        then 
        echo "Felicidades, respuesta correcta"
        r3=$(echo "$r+$c" | bc )
        else
        echo "Lo siento. La respuesta correcta es: a "
        r3=$(echo "$r+$i" | bc)
    fi

echo
echo "Cuarta pregunta"
echo 
echo "¿Cuál es el animal más grande del mundo?"
echo "a. Ballena Azul"
echo "b. Elefante"
echo "c. Tiburón"
echo "d. Hipopótamo"
echo
read -p "Su respuesta es: " r4

    if [ $r4 == "a" ]
        then 
        echo "Felicidades, respuesta correcta"
        r4=$(echo "$r+$c" | bc )
        else
        echo "Lo siento. La respuesta correcta es: a "
        r4=$(echo "$r+$i" | bc)
    fi    
echo
echo "Quinta pregunta"
echo 
echo "¿Dónde se originaron los juegos olímpicos?"
echo "a. Guaviare"
echo "b. Roma"
echo "c. Acapulco"
echo "d. Atenas"
echo
read -p "Su respuesta es: " r5

    if [ $r5 == "d" ]
        then 
        echo "Felicidades, respuesta correcta"
        r5=$(echo "$r+$c" | bc )
        else
        echo "Lo siento. La respuesta correcta es: d "
        r5=$(echo "$r+$i" | bc)
    fi

sumatoria=$(echo "$r1+$r2+$r3+$r4+$r5" | bc)
echo "Sus respuestas correctas fueron: $sumatoria"
    if [[ ( $sumatoria -eq 5 ) || ($sumatoria -eq 4) ]];
    then
    echo "Ha obtenido el título de MAESTRO"
    elif [[ ( $sumatoria -eq 3 ) || ($sumatoria -eq 2 ) || ( $sumatoria -eq 1 ) || ( $sumatoria -eq 0 ) ]]
    then
    echo
    echo "No ha obtenido el título"
    else
    echo
    echo "Lo siento, siga intentando"

    fi
#!/bin/bash
#Preguntas y Respuestas
#Author: David Santiago Agudelo Villamizar
#Date: 11/10/2021
#version: 0.0.1

#asignamos las respuestas predefinidas y variables 
respuesta1=a
respuesta2=d
respuesta3=c
respuesta4=b
respuesta5=a
contador=0
clear 
#creamos todo el formato de bienvenida 
echo 
echo "                 ¡¡¡¡ Bienvenido al juego de preguntas y respuestas !!!!"
echo
echo 
echo
echo "            Si usted acierta todas de las preguntas, le daré un titulo de Maestro. "

echo 
sleep 5
clear
echo
echo "      recordatorio: las preguntas se responden con la letra asignada  de la a) a la d)"
sleep 4
echo
clear
echo
echo "                                     ¡ Comencemos !"
sleep 2
echo
clear
echo
echo "                                       Pregunta #1"
echo
echo "                      ¿Cuándo comenzó la primera guerra mundial?"
echo
echo
echo "  a) 1914 "
echo "  b) 1927 "
echo "  c) 1939 "
echo "  d) 1919 "
echo
echo
read pregunta1
if [[ $pregunta1 = $respuesta1 ]]; then # creamos un if para determinar si esos dos valores son iguales 
        echo
         echo "                         La resputas es correcta."
         echo
         echo
          contador=$(($contador+1)) # un contador para ir contando la cantidad de respuestas corresctas
          sleep 2
        
     else # el else para saber que si esa regla no se cumple, de otro resultado
     echo
        echo "              la respuesta es incorrecta, la respuesta es: a) 1914."
        echo 
        echo 
        sleep 3
        fi
       
clear 
echo  "                                       Pregunta #2"
echo
echo "                   ¿Cuál es el planeta más grande del Sistema Solar?"
echo
echo
echo "  a) El sol "
echo "  b) Saturno "
echo "  c) Urano "
echo "  d) Júpiter "
echo
echo
read  pregunta2
if [[ $pregunta2 = $respuesta2 ]]; then 
        echo
         echo "                         La resputas es correcta."
         echo
         echo
         contador=$(($contador+1))
         sleep 2
        
     else 
     echo
        echo "              la respuesta es incorrecta, la respuesta es: d) Júpiter."
        echo 
        echo 
        sleep 3
        fi
        
clear
echo  "                                       Pregunta #3"
echo
echo "                        ¿Cuál es la luna más grande de Saturno?"
echo
echo
echo "  a) Jápeto"
echo "  b) Hiperión" 
echo "  c) Titán"
echo "  d) Rea "
echo 
echo
read pregunta3
if [[ $pregunta3 = $respuesta3 ]]; then 
        echo
         echo "                         La resputas es correcta."
         echo
         echo
          contador=$(($contador+1))
          sleep 2
        
     else 
     echo
        echo "              la respuesta es incorrecta, la respuesta es: c) Titán."
        echo 
        echo 
        sleep 3
        fi
        
clear
echo  "                                       Pregunta #4"
echo
echo "                        ¿Cuántos huesos tiene el cuerpo humano?"
echo
echo
echo "  a) 201"
echo "  b) 206"
echo "  c) 209"
echo "  d) 203"
echo
echo
read pregunta4
if [[ $pregunta4 = $respuesta4 ]]; then
        echo
         echo "                         La resputas es correcta."
         echo
         echo
         contador=$(($contador+1))
        
     else
     echo
        echo "              la respuesta es incorrecta, la respuesta es: b) 206"
        echo 
        echo 
        fi
        sleep 3
clear
echo "                                       Pregunta #5"
echo
echo "                           ¿Cuántas notas musicales existen?"
echo
echo
echo "  a) 7"
echo "  b) 6"
echo "  c) 8"
echo "  d) 10"
echo
echo
read pregunta5
if [[ $pregunta5 = $respuesta5 ]]; then 
        echo
         echo "                         La resputas es correcta."
         echo
         echo
          contador=$(($contador+1))
          sleep 2
        
     else
     echo
        echo "              la respuesta es incorrecta, la respuesta es: a) 7."
        echo 
        echo 
        sleep 3
        fi
        
clear
echo 
# damos la calificacion en forma de titulo
if [[ $contador = 5 ]]; then 
        echo
         echo "            ¡¡ Usted se ha ganado el titulo de Maestro  !!"
         echo
         echo
         
          
        
     else
     echo
        echo "                           Usted no es un Maestro"
        echo 
        echo 
        
        fi
        sleep 3
        exit 0 

#!/usr/bin/bash
# Autores : Marcos Torres / Julian Aros / Norman Romero
# Date: 10/ octubre / 2021
# Version: 0.0.1
# Title: Juego de Preguntas Edicion Fisica

echo -e "1. un poco de historia. ¿Qué sabio griego creía que la única ley básica que gobernaba el universo era el principio del cambio y que nada permanecía en el mismo estado indefinidamente?\n"

echo "A. Tales de Mileto"
echo "B. Heráclito"
echo "C. Aristóteles"
echo "D. Papa Christos"

echo -e "Para seleccionar su respuesta escriba una de las letras en mayúscula de las que se encuentran al inicio de las opciones\n" 
read respuesta 
#if $respuesta = C
#then 
#print 
echo -e "2. Todo cuerpo que cae libremente en el vacío se caracteriza por tener\n"

echo "A. Aceleracion constante y velocidad variable"
echo "B. Fuerza variable y velocidad decreciente"
echo "C. Energía potencial constante y aceleración creciente"
echo "D. Su masa incrementa indefinidamente"

echo "Para seleccionar su respuesta escriba una de las letras en mayúscula de las que se encuentran al inicio de las opciones"
read respuesta2

#echo -n "/n"
echo -e "3. ¿Cuál de estos fenómenos inspiró a Albert Einstein en su desarrollo de la relatividad general?\n"

echo "A. Ver a dos trenes moverse en direcciones opuestas"
echo "B. Ver a un hombre caerse de un tejado"
echo "C. La vibración de las cuerdas en un violín"
echo "D. El papi Newton"
 
echo -e " Para seleccionar su respuesta escriba una de las letras en mayúscula de las que se encuentran al inicio de las opciones\n"
read respuesta3
 
echo -E "4. Hablando de fuerzas... ¿Cuál es la que mantiene unidas las moléculas de un cuerpo?.\n"
echo "A. La Fuerza del amor"
echo "B. La fuerza de gravedad"
echo "C. La fuerza de cohesión"
echo "D. La fuerza de adhesión"

echo -e " Para seleccionar su respuesta escriba una de las letras en mayúscula de las que se encuentran al inicio de las opciones\n"
read respuesta4

echo -e "5. Una de estas respuestas no representa una forma de energía.\n"
echo "A. Fricción"
echo "B. Calor"
echo "C. Cinética"
echo "D. Potencial"


echo -e "Para seleccionar su respuesta escriba una de las letras en mayúscula de las que se encuentran al inicio de las opciones.\n"
read respuesta5
p=4
#o=$(echo "$j+$k+$l+$m+$n" | bc -l)
if 
[ "$respuesta" == B ]
then 
j=1
else
j=0
fi
if
[ "$respuesta2" == A ]
then 
k=1
else 
k=0
fi 
if 
[ "$respuesta3" == B ]
then 
l=1
else 
l=0
fi
if
[ "$respuesta4" == C ]
then 
m=1
else 
m=0 
fi 
if 
[ "$respuesta5" == A ]
then 
n=1
else 
n=0
fi
o=$(echo "$j+$k+$l+$m+$n" | bc -l)
if
[ "$o" == 5 ]||[ "$o" == 4 ]
then 
echo "Eres un maestro."
else 
echo "No eres un maestro."
fi
exit

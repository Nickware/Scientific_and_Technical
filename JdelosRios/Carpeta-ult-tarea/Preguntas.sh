#!bin/bash
echo "Bienvenido al juego de preguntas y respuestas"
sleep 3
echo "Si aciertas todas las respuestas de las preguntas no te instalare (virus.exe)"
sleep 3
echo "Si fallas dos preguntas maximo, puedes ir comprando otro pc"
echo "Para que me creas, mira lo que puedo hacer"
mkdir virus.exe
chmod 000 virus.exe
echo "listando archivos"
ls
echo "he creado un archivo.exe, aun no he instalado nada, pero ya  esta descargado en tu pc"
echo "Puedes comprobar que no puedes ingresar al archivo ni removerlo si asi lo deseas "
echo "Cada pregunta tiene 3 opciones, y un tiempo de respuesta de 30s"

echo "1- Si tenemos dos manzanas y nos comemos una ¿Cuantas manzanas nos quedan?"
echo "Ingrese A,B,C"
echo "A. 2"
echo "B. 3"
echo "C. 1"
read respuesta1
res1="C"
if [ "$respuesta1" = "$res1" ]
then 
echo "Su respuesta es correcta"
else
echo "Su respuesta es incorrecta"
echo "la respuesta correcta era $res1" 
fi
sleep 2
echo "2- La ciencia física es una ciencia fundamental, esto quiere decir que para explicarla:"
echo "A. No necesita de otras ciencias naturales"
echo "B. Necesita y se fundamenta en otras ciencias naturales"
echo "C Sus conceptos deben ser particulares y limitados en el tiempo"
read respuesta2
res2="A"
if [ "$respuesta2" = "$res2" ]
then 
echo "Su respuesta es correcta"
else
echo "Su respuesta es incorrecta"
echo "La respuesta correcta era $res2"
fi
sleep 2
echo "3- El sonido:"
echo "A. Se puede propagar en el vacío"
echo "B. Es una onda electromagnética."
echo "C. Ninguna afirmación anterior es correcta."
read respuesta3
res3=C
if [ "$respuesta3" = "$res3" ]
then
echo "Su respuesta es correcta"
else
echo "Su respuesta es incorrecta"
echo "La respuesta correcta era $res3"
fi
sleep 3
echo "4- En la electrización por frotamiento:"
echo "A. Los 2 cuerpos se cargan con igual tipo de carga y en la misma cantidad"
echo "B. Los 2 cuerpos se cargan con diferente tipo de carga y con diferente cantidad"
echo "C. Los cuerpos se cargan con diferente tipo de carga y en la misma cantidad"
read respuesta4
res4=C
if [ "$respuesta4" = "$res4" ]
then
echo "Su respuesta es correcta"
else
echo "Su respuesta es incorrecta"
echo "La respuesta correcta era $res4"
fi
sleep 3
echo "5- ¿Cuál es la distancia más pequeña posible en mecánica cuántica?"
echo "A. Longitud de Plank"
echo "B. Espuma cuantica"
echo "C Tiempo de Wearden"
read respuesta5
res5=A
if [ "$respuesta5" = "$res5" ]
then
echo "Su respuesta es correcta"
else
echo "Su respuesta es incorrecta"
echo "La respuesta correcta era $res5"
fi 
sleep 3
echo "6- ¿Qué dos partículas elementales se describen como 'sin masa'?"
echo "A. Foton y Gluon"
echo "B. Muon y neutrino"
echo "C. Electron y proton"
read respuesta6
res6=A
if [ "$respuesta6" = "$res6" ]
then
echo "Su respuesta es correcta"
else
echo "Su respuesta es incorrecta"
echo "La respuesta correcta era $res6"
fi 
sleep 3
echo "7- Los fermiones se encargan de aplicar a esa masa las cuatro fuerzas fundamentales: electromagnetismo, fuerza nuclear fuerte, fuerza nuclear débil y fuerza de la gravedad."
echo "A. Verdadero"
echo "B. Falso"
read respuesta7
res7=B
if [ "$respuesta7" = "$res7" ]
then
echo "Su respuesta es correcta"
else
echo "Su respuesta es incorrecta"
echo "La respuesta correcta era $res7"
fi
sleep 3
echo "8- ¿CÓMO SE LLAMA EL CANTANTE ACTUAL DE LA BANDA IRON MAIDEN?"
echo "A. BRUCE DICKINSON"
echo "B. MICHAEL KISKE"
echo "C. GEOFF TATE"
read respuesta8
res8=A
if [ "$respuesta8" = "$res8" ]
then
echo "Su respuesta es correcta"
else
echo "Su respuesta es incorrecta"
echo "La respuesta correcta era $res8"
fi
sleep 3
echo "9- ¿Qué temperatura alcanzó aproximadamente el universo unos 10 segundos después del Big Bang?"
echo "A. 250 millones de kelvin"
echo "B. 500 millones de kelvin"
echo "C. 1.000 millones de kelvin"
read respuesta9
res9=C
if [ "$respuesta9" = "$res9" ]
then
echo "Su respuesta es correcta"
else
echo "Su respuesta es incorrecta"
echo "La respuesta correcta era $res9"
fi
sleep 3
echo "10. Todo cuerpo que cae libremente en el vacío se caracteriza por tener..."
echo "A. Aceleración constante y velocidad variable"
echo "B. Fuerza variable y velocidad decreciente"
echo "C. Energía potencial constante y aceleración creciente"
read respuesta10
res10=A
if [ "$respuesta10" = "$res10" ]
then
echo "Su respuesta es correcta"
else
echo "Su respuesta es incorrecta"
echo "La respuesta correcta era $res10"
fi

sleep 3
echo "Llegaste al final del cuestionario"
correcto=1
incorrecto=0
if [ "$respuesta1" = "$res1" ]
then
echo "$correcto" >>resultados.txt
else
echo "$incorrecto"  >>resultados.txt
fi

 
if [ "$respuesta2" = "$res2" ]
then
echo "$correcto" >>resultados.txt
else
echo "$incorrecto"  >>resultados.txt 
fi

if [ "$respuesta3" = "$res3" ]
then
echo "$correcto" >>resultados.txt
else
echo "$incorrecto"  >>resultados.txt 
fi

if [ "$respuesta4" = "$res4" ]
then
echo "$correcto" >>resultados.txt
else
echo "$incorrecto"  >>resultados.txt 
fi


if [ "$respuesta5" = "$res5" ]
then
echo "$correcto" >>resultados.txt
else
echo "$incorrecto"  >>resultados.txt 
fi


if [ "$respuesta6" = "$res6" ]
then
echo "$correcto" >>resultados.txt
else
echo "$incorrecto"  >>resultados.txt 
fi


if [ "$respuesta7" = "$res7" ]
then
echo "$correcto" >>resultados.txt
else
echo "$incorrecto"  >>resultados.txt 
fi


if [ "$respuesta8" = "$res8" ]
then
echo "$correcto" >>resultados.txt
else
echo "$incorrecto"  >>resultados.txt 
fi


if [ "$respuesta9" = "$res9" ]
then
echo "$correcto" >>resultados.txt
else
echo "$incorrecto"  >>resultados.txt 
fi


if [ "$respuesta10" = "$res10" ]
then
echo "$correcto" >>resultados.txt
else
echo "$incorrecto"  >>resultados.txt 
fi

echo "Usted tuvo"


paste -sd+ resultados.txt | bc
grep . resultados.txt | paste -sd+ | bc 

echo "respuestas correctas"

echo " Si usted tuve 7 respuestas correctas o mas, quitare el archivo virus de su pc"
echo "Eso decia el juego"
echo "Pero como me caiste bien, hare una excepcion"
echo "Quitando archivo virus"
echo "Fin del juego"
echo "Feliz dia"
echo "Pronto nos veremos para la revancha"
chmod 777 virus.exe
rm -r virus.exe
rm resultados.txt





 



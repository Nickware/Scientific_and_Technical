#!/usr/bin/bash
#titulo:calculo del tiempo que tarda en caer un objeto si friccion al aire
#autor: Justin Santana, Laura Sofia Cortes, Juan Sebastian Sanchez
#version:0.0.01
#Elaboramos las variables a utilizar mas adelante
g="9.8" #Gravedad
m1="0.01" #1 cemtimetro
echo "Bienvenido, este programa calculara el tiempo que tarda en caer una objeto desde una altura h(sin friccion)"
echo "Comencemos"
echo "si desea dejar el programa, deje el campo vacio"
s="1"
while [ $s -eq "1" ] #el script avanzara hasta que el usuario decida
do
echo -e "coloque la altura deseada(en metros)" #comienza la interaccion con el usuario
read h
if [ -n "$h" ];then #si no es nullo ejecutara el programa, si lo es no lo hara
H=$(echo "$h-$m1" | bc -l) #con esto calcularemos el timepo justo antes de que toque el suelo
num=$(echo "2*$H" | bc -l) 
div=$(echo "$num/$g" | bc -l) #con estas variables calcularemos el tiempo
t=$(echo "scale=5; sqrt($div)" | bc -l)
echo "El tiempo en que tarda en caer es: $t segundos"
else
echo "gracias por utilizar este programa"
s="0"
fi #fin del programa
done
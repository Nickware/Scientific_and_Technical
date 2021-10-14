#!/usr/bin/bash.exe
#Authors: Juan Diego Martinez Ayala & Santiago Criollo Bermúdez
#Date: 13/10/2021
#Title: Calculadora H de satelites
#Version: 1.0.39
echo " Hola $USER"

echo "Con esta calculadora podras saber la altura de cualquier satelite en orbita con tan solo ingresar el tiempo que tarda en orbitar la tierra"
echo
sleep 2
echo "Tambien aprenderas algo muy importante respecto a los satelites en orbita asi que $USER animate a completar todo el proceso"

# Iniciamos parte uno; Altura de cualquier satelite que orbite la tierra
#agregando valores a las variables de la formula
#T = Tiempo en orbitar
#G = Constante Gravitacional
#M = Masa de la tierra
#R = Radio de la tierra
#N = Numerador de la division = G*M*T (Se agrega mas adelante cuando el usuario defina T)
#D = Denominador de la division = 4*Pi^2
#H = Altura del satelite (Resultado)

T1=0
G1=$(echo "6.67*10^-11" | bc -l ) 
M1=$(echo "5.97*10^24" | bc -l )
R1=6371000
Pi1=$(echo "scale=10; 4*a(1)" | bc -l)
D1=$(echo "4*$Pi1^2" | bc -l) 


echo
echo "Ingresa el tiempo que tarda en orbitar el satelite al planeta"
sleep 1
echo

#interaccion con el usuario
read -p "Ingrese el tiempo en segundos:" T1
echo


N1=$(echo "$G1*$M1*($T1^2)" | bc -l)
#Introduciomos ResN_D
ResN_D1=$(echo "$N1/$D1" | bc -l)
#Al resultado le diremos Res y lo elevaremos a E; (no se pudo)
Res1=$(echo "$ResN_D1")
H1=$(echo "$Res1-$R1" | bc -l)
echo "El satelite esta a una altura de $H1 metros"
sleep 2
echo
#Finalizamos la altura para cualquier satelite

#Iniciamos parte 2 o mejor dicho la demostracion de la diferencia existente entre la altura de el supusesto valor de un satelite geosincronico y el valor verdadero
echo "Los satelites geosincronicos orbitan la tierra en un dia sideral pero este no lo hace en un lapso exacto de 24 horas, sino que lo hace en lapsos de 23.93 horas.
Pasando esto a segundos tenemos que las 24 horas equivalen a 86400 segundos y las 23.93 horas equivalen a 86148
 segundos;
Que tanto crees que puede variar la altura del satelite teniendo en cuenta la aclaracion anterior? Te invito a que ingreses estos valores y lo compruebes $USER" 
sleep 15
echo "Ingresa el tiempo que tarda en orbitar el satelite al planeta"
sleep 2
echo
#Definimos nuevas variables
T2=0
G2=$(echo "6.67*10^-11" | bc -l ) 
M2=$(echo "5.97*10^24" | bc -l )
R2=6371000
Pi2=$(echo "scale=10; 4*a(1)" | bc -l)
D2=$(echo "4*$Pi2^2" | bc -l)

#interaccion con el usuario
read -p "Ingresa el valor de las 24 horas en segundos:" T2
echo


N2=$(echo "$G2*$M2*($T2^2)" | bc -l)
#Introduciomos ResN_D2
ResN_D2=$(echo "$N2/$D2" | bc -l)
#Al resultado le diremos Res y lo elevaremos a E; (no se pudo)
Res2=$(echo "$ResN_D2")
H2=$(echo "$Res2-$R2" | bc -l)
echo "El satelite suponiendo las 24 horas exactas de orbita esta a una altura de $H2 metros, este dato sera muy util, anotalo en tu libreta"
sleep 2
echo
#Parte tres del ejercicio Satelite geosincronico

echo "Excelente, ahora pondremos el valor real del tiempo en el que orbita el satelite "
 sleep 2
echo
#Definimos nuevas variables

T3=0
G3=$(echo "6.67*10^-11" | bc -l ) 
M3=$(echo "5.97*10^24" | bc -l )
R3=6371000
Pi3=$(echo "scale=10; 4*a(1)" | bc -l)
D3=$(echo "4*$Pi3^2" | bc -l)

#interaccion con el usuario
read -p "Ingresa el valor de las 23.93 horas en segundos:" T3
echo
sleep 2


N3=$(echo "$G3*$M3*($T3^2)" | bc -l)
#Introduciomos ResN_D3
ResN_D3=$(echo "$N3/$D3" | bc -l)
#Al resultado le diremos Res y lo elevaremos a E; (no pudimos)
Res3=$(echo "$ResN_D3")
H3=$(echo "$Res3-$R3" | bc -l)
echo "Excelente, el satelite geosincronico con el valor real del tiempo de rotacion al planeta tiene una altura de $H3 metros, este dato sera muy util, anotalo en tu libreta"
sleep 4

echo "Recuerdas los dos datos anteriores? Ahora es el momento de usarlos, siendo la diferencia de tiempo original tan baja que tanto crees que varia la altura de los satelites? Vamos a averiguarlo"
sleep 6

echo "Ya tengo los datos asi que te mostrare la diferencia que genera ese pequeño cambio en el tiempo"

SatD=$(echo "$H2-$H3" | bc -l)
sleep 4
echo "La diferencia de altura entre los satelites seria de $SatD metros, impresionante no?"
sleep 5
echo "Supongo que eso es todo por hoy nos vemos luego $USER"
#Finalizamos el script
#Pendiente revision lineas 45, 78 y 107 donde no se pudo implementar una potencia fraccionada ya que el programa bc no opera de esa manera asi que se hizo todo el proceso sin la potencia fraccionada, pero se agrego el espacio para ser resuelta dado caso se haye el modo mas adelante

# Autor: Jorge Garzon
# Fecha: 6/10/2021
# Cuestionario astrofísica
clear 
echo "Hola, escribe tu nombre"
read nombre
echo " $nombre !!! Bienvenido al Mejor juego de preguntas y respuestas de Astrofísica"
echo "SI ACIERTAS TODAS LAS RESPUESTAS ...TE DARÉ EL TÍTULO DE MAESTRO"
echo ""

echo "Cual es el valor de la velocidad de la luz?"

echo "1: 300000 km/seg"
echo "2: 1000000 km/seg"
echo "3: 12 km/seg"
read check

if [  $check -eq "1" ]
then 
echo "ES LA RESPUESTA CORRECTA"
else 
echo " $nombre Te has equivocado"
fi

echo "Cual es la edad del universo?"

echo "1: No se ha medido la edad del universo"
echo "2: 1000000 millones de años"
echo "3: 13.770 millones de años"
read check

if [  $check -eq "3" ]
then 
echo "ES LA RESPUESTA CORRECTA"
else 
echo " $nombre Te has equivocado"
fi



echo "De donde emana la radiación Hawking?"

echo "1: De todas partes, pero solo en presencia de un observador"
echo "2: Del horizonte de sucesos de los agujeros negros"
echo "3: Cualquier objeto que exista en tres dimensiones"
read check

if [  $check -eq "2" ]
then 
echo "ES LA RESPUESTA CORRECTA"
else 
echo " $nombre Te has equivocado"
fi


echo "Que astro es el sol?"

echo "1: Un cometa"
echo "2: Un planeta en erupcion"
echo "3: Una estrella"
read check

if [  $check -eq "3" ]
then 
echo "ES LA RESPUESTA CORRECTA"
else 
echo " $nombre Te has equivocado"
fi


echo "Cuál es la estrella más cercana al sistema solar?"

echo "1: La estrella polar"
echo "2: Proxima Centauri"
echo "3: Polux"
read check

if [  $check -eq "2" ]
then 
echo "ES LA RESPUESTA CORRECTA"
else 
echo " $nombre Te has equivocado"
fi


echo "Que es un fenomeno nova?"

echo "1: La muerte de una estrella"
echo "2: El nacimiento de una estrella"
echo "3: Formacion de una galaxia"
read check

if [  $check -eq "1" ]
then 
echo "ES LA RESPUESTA CORRECTA"
else 
echo " $nombre Te has equivocado"
fi


echo "ERES TODO UN MAESTRO DE LA ASTROFISICA $nombre FELICITACIONES"
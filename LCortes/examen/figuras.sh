#/usr/bin/bash.exe
#titulo: Programa que muestra figuras con *
#autor: Laura Sofia Cortes, Juan Sebastian Sanchez, Justin Steven Santana
#version:0.0.1

#inicio del programa
echo "Bienvenido al programa que dibuja figuras con asteriscos"
#mecanismo de bucle while
siono="1"                                                     #se define variable siono como 1
while [ "$siono" -eq "1" ]                                    #mientras siono sea 1
do                                                            #haga lo siguiente

    echo "¿Que figura desea ver en pantalla?"
    echo "Si las opciones son:"
    echo "a. Cuadrado"
    echo "b. Ovalo"
    echo "c. Flecha"
    echo "d. Diamante"
    echo "Elija solo 1 escribiendo solamente a, b, c o d"
    echo "Si no desea visualizar ninguna figura, escriba no"
    read figura                                           #lea la figura a presentar
    #si la respuesta es cuadrado
    if [ $figura == "a" ]                                 #si la respuesta es a: cuadrado
    then                                                  #muestre lo siguiente
    echo "      *********"
    echo "      *       *"
    echo "      *       *"
    echo "      *       *"
    echo "      *       *"
    echo "      *       *"
    echo "      *       *"
    echo "      *       *" 
    echo "      *********" 
    #si la respuesta es ovalo
    elif [ $figura == "b" ]                              #si la respuesta es b: ovalo
    then                                                  #muestre lo siguiente
    echo "          ***"
    echo "        *     *"
    echo "      *         *"
    echo "      *         *"
    echo "      *         *"
    echo "      *         *"
    echo "      *         *"
    echo "        *     *"
    echo "          ***"
    #si la respuesta es flecha
    elif [ $figura == "c" ]                              #si la respuesta es c: flecha
    then                                                  #muestre lo siguiente
    echo "        *"
    echo "       ***"
    echo "      *****"
    echo "        *"
    echo "        *"
    echo "        *"
    echo "        *"
    echo "        *"
    echo "        *"
    #si la respuesta es diamante
    elif [ $figura == "d" ]                              #si la respuesta es d: diamante
    then                                                  #muestre lo siguiente
    echo "          *"
    echo "         * *"
    echo "        *   *"
    echo "       *     *"
    echo "      *       *"
    echo "       *     *"
    echo "        *   *"
    echo "         * *"
    echo "          *"

else                            #si los condicionales son diferentes a los mencionados en los if(diferente a: a,b,c,d)
siono="0"                       #la variable siono es 0                             
fi                              #finaliza el proceso de bucle
done                                    
echo "Gracias por usar el programa. Fin"
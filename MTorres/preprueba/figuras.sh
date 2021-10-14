#!/usr/bin/bash
# Authors: Norman Romero, Julian Aros, Marcos Torres
# Title: Programa Figuras
# Version: 0.1.0
# Date: 13/10/2021 

echo "=========================================================================================="
echo "======================== Bienvenido al programa figuras =================================="
echo "=========================================================================================="
echo " "
echo "A continuacion se le presentaran, en caso de que asi lo decida, las siguientes figuras: "
echo "Un rectangulo, un ovalo, una flecha y un rombo respectivamente"
echo " "
echo "Desea ver las figuras: S / N ?"
read ans
echo " "
if [ $ans = N ]
then 
exit
else
echo "*********            ***            *          *"
echo "*       *          *     *         ***        * *"
echo "*       *         *       *       *****      *   *" 
echo "*       *         *       *         *       *     *" 
echo "*       *         *       *         *      *       *" 
echo "*       *         *       *         *       *     *" 
echo "*       *         *       *         *        *   *" 
echo "*       *          *     *          *         * *"
echo "*********            ***            *          *"
fi 

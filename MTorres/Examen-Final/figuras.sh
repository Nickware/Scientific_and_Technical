echo "Se presentaran las siguientes figuras"
echo "Un rectangulo, un ovalo, una flecha y un rombo"
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

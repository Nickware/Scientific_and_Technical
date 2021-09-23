echo "Iniciando git"
git init
echo "Verificando actualizaciones del repositorio"
git pull
echo "Verificando estado de la carpeta"
git status
echo "Agreando archivos "
git add -A
echo "Ingreseando comentarios"
echo "Debe ingresarse de la manera: git commit -m "Comentario""
read commit
$commit 
#Se puede personalizar de la forma: git push https://<tocken>/nickware/nickware/Elementos_computacionales.git <branch>
git push origin main

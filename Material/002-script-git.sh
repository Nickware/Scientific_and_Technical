#!/bin/bash

echo "Inicializando repositorio Git (si no existe)..."
git init

echo "Actualizando desde el remoto (si está configurado)..."
git pull origin main 2>/dev/null

echo "Estado actual del repositorio:"
git status

echo "Agregando todos los archivos al área de preparación..."
git add -A

# Verificar si hay cambios para confirmar
if git diff --cached --quiet; then
    echo "No hay cambios para confirmar."
else
    read -p "Ingrese el mensaje para el commit: " mensaje
    git commit -m "$mensaje"
fi

echo "Subiendo los cambios a la rama 'main' en el remoto 'origin'..."
git push origin main

echo "Operación completada."

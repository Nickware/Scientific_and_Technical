# Comandos Básicos Git

**Secuencia de comandos en la terminal para trabajar con Git**,. GitHub es el sistema de control de versiones más usado en desarrollo de software. A continuación se explica por secciones qué hace el script y qué significan los comandos:

***

### 1. **Creación y clonación de repositorios**

```bash
git init test_repo
cd test_repo
git clone <url>
```

- `git init test_repo`: Crea un nuevo repositorio Git vacío en la carpeta `test_repo`.
- `cd test_repo`: Entra a la carpeta del repositorio.
- `git clone <url>`: Clona un repositorio remoto existente en tu máquina (descarga todo el historial de commits, ramas, etc.).

***

### 2. **Agregar y confirmar cambios**

```bash
touch new_file.txt
git add new_file.txt
git commit -m "add new_file.txt"
git status
```

- `touch new_file.txt`: Crea un archivo vacío llamado `new_file.txt`.
- `git add new_file.txt`: Añade ese archivo al área de preparación (staging).
- `git commit -m "add new_file.txt"`: Registra el cambio en el historial de Git con un mensaje de commit.
- `git status`: Muestra el estado del repositorio (archivos modificados, en staging, etc.).

***

### 3. **Historial y diferencias**

```bash
git log
git log --oneline
git log --graph --oneline --all
git diff
git diff --cached
git diff HEAD
```

- `git log`: Muestra el historial de commits en detalle.
- `git log --oneline`: Versión resumida (cada commit en una sola línea).
- `git log --graph --oneline --all`: Muestra el historial como un grafo, útil para ver ramas y merges.
- `git diff`: Cambios no añadidos al staging.
- `git diff --cached`: Cambios que están en staging comparados con el último commit.
- `git diff HEAD`: Diferencias entre el directorio de trabajo y el último commit.

***

### 4. **Ramas**

```bash
git branch new_feature
git checkout new_feature
git checkout -b another_feature
git checkout main
git merge new_feature
git branch -d another_feature
```

- `git branch new_feature`: Crea una rama llamada `new_feature`.
- `git checkout new_feature`: Cambia a esa rama.
- `git checkout -b another_feature`: Crea y cambia a una nueva rama en un solo comando.
- `git checkout main`: Vuelve a la rama principal (`main`).
- `git merge new_feature`: Fusiona los cambios de `new_feature` en `main`.
- `git branch -d another_feature`: Elimina la rama `another_feature`.

***

### 5. **Eliminar archivos y commits relacionados**

```bash
rm b.txt
git add . -A
git commit -m "remove b.txt"
git log -- b.txt
```

- `rm b.txt`: Borra el archivo `b.txt` en el sistema de archivos.
- `git add . -A`: Registra la eliminación en el área de staging.
- `git commit -m "remove b.txt"`: Guarda el cambio eliminando ese archivo.
- `git log -- b.txt`: Muestra el historial de commits relacionados con ese archivo, incluso si ya fue borrado.

***

### 6. **Trabajo con repositorios remotos**

```bash
git push origin main
git fetch origin
```

- `git push origin main`: Sube los commits locales a la rama `main` del repositorio remoto.
- `git fetch origin`: Descarga la información más reciente del repositorio remoto, pero no la integra todavía (para eso se usa `git pull`, que es `fetch + merge`).

***

✅ **En resumen:**
Este script es una “chuleta” de comandos básicos de Git:

- Creación y clonación de repositorios
- Manejo de archivos y commits
- Consulta de historial y diferencias
- Trabajo con ramas y fusiones
- Sincronización con repositorios remotos


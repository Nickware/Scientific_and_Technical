# Secuencia de comandos en la terminal para trabajar con Git

GitHub es el sistema de control de versiones más utilizado en el desarrollo de software. A continuación se explica por secciones qué hace el script y qué significan los comandos:

***

### 1. **Creación y clonación de repositorios**

```bash
git init test_repo
cd test_repo
git clone <url>
```

- `git init test_repo`: Crear un nuevo repositorio Git vacío en la carpeta `test_repo`.
- `cd test_repo`: Acceder a la carpeta del repositorio.
- `git clone <url>`: Clonar un repositorio remoto en tu máquina (descargar todo el historial de commits, ramas, etc.).

***

### 2. **Agregar y confirmar cambios**

```bash
touch new_file.txt
git add new_file.txt
git commit -m "add new_file.txt"
git status
```

- `touch new_file.txt`: Crear un archivo vacío llamado `new_file.txt`.
- `git add new_file.txt`: Añadir ese archivo al área de preparación (staging).
- `git commit -m "add new_file.txt"`: Registrar el cambio en el historial de Git con un mensaje de commit.
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

- `rm b.txt`: Borrar el archivo `b.txt` en el sistema de archivos.
- `git add . -A`: Registrar la eliminación en el área de staging.
- `git commit -m "remove b.txt"`: Guardar el cambio eliminando ese archivo.
- `git log -- b.txt`: Muestra el historial de commits relacionados con ese archivo, incluso si ya fue borrado.

***

### 6. **Trabajo con repositorios remotos**

```bash
git push origin main
git fetch origin
```

- `git push origin main`: Subir los commits locales a la rama `main` del repositorio remoto.
- `git fetch origin`: Descargar la información más reciente del repositorio remoto, pero no la integra todavía (para eso se usa `git pull`, que es `fetch + merge`).

***

**En resumen:**
Este readme es un glosario de comandos básicos de Git:

- Creación y clonación de repositorios
- Manejo de archivos y commits
- Consultar de historial y diferencias
- Trabajo con ramas y fusiones
- Sincronización con repositorios remotos


# Extensiones que "explotan" el motor de GitHub

---

## 1. Productividad e Inteligencia Artificial

### GitHub Copilot & GitHub Copilot Chat

Es la joya de la corona y la razón por la que muchos desarrolladores eligen este entorno.

* **Cómo explota el motor:** Utiliza los miles de millones de líneas de código público alojadas en GitHub para entrenar su modelo LLM.
* **Qué hace:** No solo autocompleta líneas de código o funciones enteras en tiempo real, sino que el chat lateral te permite pedirle que genere pruebas unitarias, explique código complejo (como scripts de Bash o físicas de fluidos) y depure errores sin salir del editor.

---

## 2. Gestión de Código y Colaboración

### GitHub Pull Requests and Issues (Oficial)

Esta extensión trae la experiencia web de GitHub directamente al panel izquierdo de VS Code.

* **Cómo explota el motor:** Se conecta a la API de GitHub para gestionar el ciclo de vida del proyecto.
* **Qué hace:** Permite revisar, validar y fusionar *Pull Requests* (PRs) viendo los comentarios de tus compañeros en el mismo lienzo donde editas el código. También te permite crear y asignar *Issues* (tareas o reportes de fallos) arrastrando líneas de código directamente a la tarea.

### GitLens — Git supercharged

Aunque no es exclusiva de GitHub (funciona con cualquier servidor Git), es la herramienta más potente para entender la historia del código.

* **Cómo explota el motor:** Se integra con los perfiles de GitHub para mostrarte la autoría línea por línea.
* **Qué hace:** Al pararte sobre cualquier línea de código, te muestra un texto tenue que dice **quién la cambió, en qué commit y hace cuánto tiempo** (conocido como *Git Blame*). Incluye un mapa visual de ramas que facilita enormemente el manejo de repositorios complejos.

---

## 3. Automatización y DevOps

### GitHub Actions (Oficial)

Si utilizas el motor de GitHub para Integración y Despliegue Continuo (CI/CD), esta extensión es indispensable.

* **Cómo explota el motor:** Se vincula con los servidores de ejecución de GitHub (*runners*) para monitorear tus flujos de trabajo.
* **Qué hace:** Te permite gestionar tus archivos de configuración YAML, validar la sintaxis de tus *workflows* antes de subirlos, y ver en tiempo real si las pruebas automatizadas pasaron o fallaron tras hacer un `git push`.

---

## 4. Gestión Remota de Entornos

### GitHub Codespaces

Permite saltar las limitaciones físicas de tu máquina local trasladando el entorno de desarrollo a la nube de GitHub.

* **Cómo explota el motor:** Utiliza contenedores Linux hospedados directamente por GitHub en la nube.
* **Qué hace:** Si necesitas probar un entorno de desarrollo pesado o compilar código en una máquina con más núcleos de CPU o RAM, esta extensión conecta tu VS Code local con una máquina virtual en la nube configurada exactamente con tu repositorio. Es ideal para trabajar en proyectos grandes desde computadoras portátiles ligeras.

---

## Resumen de Combinación Ideal

Para un flujo de trabajo optimizado y profesional, la combinación recomendada en tu barra lateral de VS Code debería incluir:

1. **GitHub Copilot:** Para velocidad de escritura y resolución de dudas técnicas.
2. **GitHub Pull Requests and Issues:** Para mantener el control de tus tareas y revisiones sin abrir el navegador web.
3. **GitLens:** Para auditar el historial de cambios en proyectos colaborativos.


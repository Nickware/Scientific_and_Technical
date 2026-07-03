## ¿Qué es Git?

Git es un **sistema de control de versiones distribuido**.
- **Control de versiones**: Guarda el historial completo de cambios en tus archivos.
- **Distribuido**: Cada copia del repositorio es completa. No dependes de un servidor central para trabajar (aunque usamos GitHub/GitLab para compartir).

Fue creado por **Linus Torvalds** (el mismo creador de Linux) en 2005, precisamente porque estaba harto de las herramientas existentes. Es rápido, eficiente y maneja proyectos gigantes como el kernel de Linux sin sudar.

## Los 3 Estados de Git 

Esta es la clave mental para no volverse loco:

1. **Working Directory (Directorio de trabajo)**: donde está editando tus archivos ahora mismo. El caos creativo.
2. **Staging Area (Índice/Stage)**: La zona de "preparación". Aquí seleccionas qué cambios van al siguiente commit. Es como hacer la maleta antes de viajar.
3. **Repository (Repositorio/.git)**: donde se guardan permanentemente los commits. La historia oficial.

## Flujo básico de trabajo

```bash
# 1. Ver qué cambió
git status

# 2. Agregar cambios al Stage (la maleta)
git add archivo.py
# O agregar todo
git add .

# 3. Guardar el cambio (Commit)
git commit -m "Mensaje descriptivo del cambio"

# 4. Enviar al remoto (GitHub/GitLab)
git push origin main
```

## Conceptos Clave

### 1. **Branches (Ramas)** 🌿
Git brilla aquí. Puedes crear líneas de tiempo alternativas sin afectar la principal.
- `main` o `master`: La versión estable.
- `feature/nueva-funcionalidad`: Donde experimentas.

```bash
git branch nueva-rama      # Crear rama
git checkout nueva-rama    # Cambiarse a ella
# O en uno solo:
git checkout -b nueva-rama
```

### 2. **Merge vs Rebase** ⚔️
- **Merge**: Une dos ramas creando un "commit de merge". Mantiene la historia exacta de lo que pasó. Es honesto pero puede ensuciar el historial.
- **Rebase**: Reescribe la historia. Toma tus commits y los "pone encima" de la otra rama como si hubieras trabajado directamente ahí. Deja un historial lineal y limpio, pero **peligroso** si ya compartiste la rama.

> *Filosofía*: Usa merge para integrar características públicas, rebase para limpiar tu rama privada antes de hacer merge.

### 3. **HEAD**
Es un puntero a donde estás parado. Normalmente apunta a la última commit de la rama actual.

### 4. **Detached HEAD** 😱
Cuando haces checkout a un commit específico (no una rama). Estás "flotando" en el tiempo. Si haces commits ahí, pueden perderse fácilmente si no creas una rama.

## Comandos de Supervivencia 

```bash
# Ver historial bonito
git log --oneline --graph --all

# Deshacer el último commit (pero mantener los cambios en stage)
git reset --soft HEAD~1

# Deshacer el último commit Y los cambios (¡CUIDADO!)
git reset --hard HEAD~1

# Descartar cambios en un archivo (volver al último commit)
git checkout -- archivo.py

# Ver diferencias entre stage y working directory
git diff

# Ver diferencias entre stage y último commit
git diff --staged
```

## .gitignore

Archivo crucial. Le dice a Git qué **ignorar**.
```text
# Archivos compilados
*.o
*.exe

# Entornos virtuales
venv/
.env

# Archivos temporales
*.swp
.DS_Store
```

## Git para tu contexto analítico 

Imagina que estás analizando datos de tus entrenamientos:

1. Tienes un script `analyze_heart_rate.py`.
2. Empiezas a experimentar con un nuevo algoritmo de zonas.
3. Creas una rama: `git checkout -b experimento-zonas`.
4. Haces cambios, fallas, arreglas, commiteas.
5. Funciona perfectamente.
6. Vuelves a `main` y haces merge.
7. Si el experimento era un desastre, simplemente borras la rama. Tu `main` nunca se contaminó.

## Filosofía Gitana 

Git te enseña **humildad y seguridad**:
- **Humildad**: Porque siempre puedes equivocarte, pero Git te permite volver atrás.
- **Seguridad**: porque cada commit es un punto de restauración.
- **Colaboración**: porque separa el "qué hice" (commits) del "cuándo lo integré" (merges).

## Errores comunes de principiantes

1. **Commitear archivos binarios grandes** (datasets completos, modelos entrenados). Usa Git LFS o ignóralos.
2. **Mensajes de commit vagos**: "fix", "update", "changes". Sé específico: "Corrige el cálculo de FCmax usando la fórmula de Tanaka".
3. **Hacer push directo a main**: Usa ramas y Pull Requests/Merge Requests.

## ¿Git vs SVN vs Mercurial?

- **SVN**: Centralizado. Antiguo. Si el servidor cae, no puedes commitear.
- **Mercurial**: Similar a Git pero más simple. Perdió la guerra.
- **Git**: distribuido, rápido, complejo pero poderoso. Ganó.

---

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


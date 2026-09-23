# Desarrollo con Git y GitHub

Este módulo introduce el control de versiones con Git y la colaboración en GitHub. Su propósito es que el estudiante aprenda a mantener un historial de cambios, trabajar en equipo y evitar la pérdida de avances en proyectos técnicos o científicos.

[Volver al README principal](../README.md)

## Objetivos de aprendizaje

Al finalizar este módulo, el estudiante podrá:
- comprender qué es Git y por qué sirve en proyectos de software y ciencia.
- usar los comandos básicos para crear, actualizar y revisar repositorios.
- trabajar con ramas, commits y fusiones.
- colaborar en equipos usando GitHub.
- reconocer errores comunes y buenas prácticas de control de versiones.

## Tabla de contenido

1. [Qué es Git](#qué-es-git)
2. [Estados de Git](#estados-de-git)
3. [Flujo de trabajo básico](#flujo-de-trabajo-básico)
4. [Ramas y fusiones](#ramas-y-fusiones)
5. [Comandos útiles](#comandos-útiles)
6. [Buenas prácticas](#buenas-prácticas)
7. [Validación y verificación](#validación-y-verificación)

## Qué es Git

Git es un sistema de control de versiones distribuido. Permite guardar el historial completo de los cambios en archivos y volver a versiones anteriores cuando sea necesario.

- Control de versiones: registra cada cambio.
- Distribuido: cada copia del repositorio es completa, no depende de un único servidor para trabajar.
- GitHub: plataforma para compartir repositorios y colaborar en equipo.

Git fue creado por Linus Torvalds y se usa ampliamente en proyectos grandes como el kernel de Linux.

## Estados de Git

La clave mental es entender tres estados:

1. Working directory: archivos en tu carpeta local.
2. Staging area: cambios seleccionados para el siguiente commit.
3. Repository: historial persistente dentro de `.git`.

## Flujo de trabajo básico

```bash
# Ver qué cambió
git status

# Preparar cambios
git add archivo.py
# O todos los cambios
git add .

# Guardar el cambio
git commit -m "Mensaje descriptivo del cambio"

# Subir a GitHub
git push origin main
```

## Ramas y fusiones

Las ramas permiten trabajar en líneas de desarrollo separadas sin afectar la principal.

```bash
git branch nueva-rama
git checkout nueva-rama
# o en una sola línea
git checkout -b nueva-rama
```

Conceptos clave:
- `main` o `master`: rama principal.
- `feature/*`: ramas de desarrollo o pruebas.
- `merge`: integra cambios de una rama en otra.
- `rebase`: reescribe historial para mantenerlo lineal.

## Comandos útiles

```bash
# Ver historial
git log --oneline --graph --all

# Deshacer último commit manteniendo cambios
git reset --soft HEAD~1

# Deshacer último commit y cambios (cuidado)
git reset --hard HEAD~1

# Revertir cambios de un archivo
git checkout -- archivo.py

# Ver diferencias
git diff
git diff --staged
```

## Buenas prácticas

- Usa `.gitignore` para ignorar archivos temporales, compilados y datos pesados.
- Escribe mensajes de commit descriptivos.
- Evita hacer push directo a la rama principal sin revisión.
- Usa ramas para experimentos o nuevas funciones.
- No subas datasets grandes si no es necesario.

Ejemplo de `.gitignore`:

```text
*.o
*.exe
venv/
.env
*.swp
.DS_Store
```

## Práctica recomendada

Un flujo útil para proyectos reales es:

1. crear una rama nueva,
2. hacer cambios,
3. revisar con `git diff`,
4. confirmar con `git add` y `git commit`,
5. hacer `git push`,
6. abrir una solicitud o pull request,
7. fusionar solo después de revisión.

## Validación y verificación

Para comprobar que el flujo está funcionando:

```bash
git status
git log --oneline --decorate --graph --all
git diff --staged
```

Si estos comandos muestran cambios esperados y un historial coherente, el repositorio está bien gestionado.

## Reproducibilidad

Git ayuda a mantener la historia del proyecto para que sea reproducible y auditable. Esto es esencial en investigación, ingeniería o desarrollo científico, donde se requiere documentar cómo cambió una solución a lo largo del tiempo.

## Siguientes pasos

- revisar [introduction_to_bash/README.md](../introduction_to_bash/README.md)
- revisar [introduction_makefile/README.md](../introduction_makefile/README.md)
- revisar [introduction_gnuplot/README.md](../introduction_gnuplot/README.md)

---

Este módulo está diseñado como base para el trabajo en equipo y para la gestión ordenada del código en proyectos de ciencia y tecnología.


## 2. Gestión de Código y Colaboración

### GitHub Pull Requests and Issues (Oficial)

Esta extensión trae la experiencia web de GitHub directamente al panel izquierdo de VS Code.

* Cómo explota el motor: Se conecta a la API de GitHub para gestionar el ciclo de vida del proyecto.
* Qué hace: Permite revisar, validar y fusionar *Pull Requests* (PRs) viendo los comentarios de tus compañeros en el mismo lienzo donde editas el código. También te permite crear y asignar *Issues* (tareas o reportes de fallos) arrastrando líneas de código directamente a la tarea.

### GitLens — Git supercharged

Aunque no es exclusiva de GitHub (funciona con cualquier servidor Git), es la herramienta más potente para entender la historia del código.

* Cómo explota el motor: Se integra con los perfiles de GitHub para mostrarte la autoría línea por línea.
* Qué hace: Al pararte sobre cualquier línea de código, te muestra un texto tenue que dice quién la cambió, en qué commit y hace cuánto tiempo (conocido como *Git Blame*). Incluye un mapa visual de ramas que facilita enormemente el manejo de repositorios complejos.

---

## 3. Automatización y DevOps

### GitHub Actions (Oficial)

Si utiliza el motor de GitHub para Integración y Despliegue Continuo (CI/CD), esta extensión es indispensable.

* Cómo explota el motor: Se vincula con los servidores de ejecución de GitHub (*runners*) para monitorear tus flujos de trabajo.
* Qué hace: Te permite gestionar tus archivos de configuración YAML, validar la sintaxis de tus *workflows* antes de subirlos, y ver en tiempo real si las pruebas automatizadas pasaron o fallaron tras hacer un `git push`.

---

## 4. Gestión Remota de Entornos

### GitHub Codespaces

Permite saltar las limitaciones físicas de tu máquina local trasladando el entorno de desarrollo a la nube de GitHub.

* Cómo explota el motor: Utiliza contenedores Linux hospedados directamente por GitHub en la nube.
* Qué hace: Si se necesita probar un entorno de desarrollo pesado o compilar código en una máquina con más núcleos de CPU o RAM, esta extensión conecta tu VS Code local con una máquina virtual en la nube configurada exactamente con tu repositorio. Es ideal para trabajar en proyectos grandes desde computadoras portátiles ligeras.

---

## Resumen de Combinación Ideal

Para un flujo de trabajo optimizado y profesional, la combinación recomendada en tu barra lateral de VS Code debería incluir:

1. GitHub Copilot: Para velocidad de escritura y resolución de dudas técnicas.
2. GitHub Pull Requests and Issues: Para mantener el control de tus tareas y revisiones sin abrir el navegador web.
3. GitLens: Para auditar el historial de cambios en proyectos colaborativos.


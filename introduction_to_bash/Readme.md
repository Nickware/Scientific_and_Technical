# Introducción a Lenguaje Bash

**Bash** (*Bourne Again SHell*) es el intérprete de comandos por defecto en la inmensa mayoría de las distribuciones Linux y sistemas tipo Unix (como macOS, que aunque usa Zsh por defecto desde macOS Catalina, mantiene compatibilidad plena).

Creado por Brian Fox en 1989 para el Proyecto GNU como un reemplazo libre del antiguo *Bourne Shell* (`sh`), es a la vez una **interfaz de línea de comandos (CLI)** para interactuar con el sistema operativo y un **lenguaje de programación interpretado**.

---

## 1. Los dos rostros de Bash

### A. Como Interfaz Interactiva

Es la ventana a través de la cual administra el sistema. Permite ejecutar comandos, navegar por el árbol de directorios, manipular archivos y gestionar procesos en ejecución utilizando pipes (`|`), redirecciones (`>`, `<`), y atajos de teclado esenciales (`Ctrl+R` para buscar en el historial, `Tab` para autocompletar).

### B. Como Lenguaje de Scripting

Permite encadenar secuencias de comandos en archivos ejecutables (`.sh`) para automatizar tareas repetitivas: desde pequeños scripts para renombrar archivos en lote hasta flujos complejos de administración de sistemas, despliegues en servidores, compilación de software o pipelines de datos.

---

## 2. Anatomía Básica y Sintaxis

Un script de Bash combina lógica de programación nativa con herramientas del entorno Unix (`grep`, `sed`, `awk`, `find`, `curl`).

```bash
#!/bin/bash
# ^ Shebang: le indica al kernel que este archivo debe ejecutarse usando Bash

# Variables (sin espacios alrededor del =)
NOMBRE="N.Torres"
DIRECTORIO_BUILD="$HOME/saturne_build"

# Estructuras de Control (Condicionales)
if [ -d "$DIRECTORIO_BUILD" ]; then
    echo "El directorio $DIRECTORIO_BUILD ya existe."
else
    echo "Creando el directorio..."
    mkdir -p "$DIRECTORIO_BUILD"
fi

# Bucles (Loops)
for archivo in *.tar.gz; do
    [ -e "$archivo" ] || continue
    echo "Procesando archivo local: $archivo"
done

```

---

## 3. Elementos Clave que Hacen Potente a Bash

* **Lógica de salida (Exit Status):** Todos los comandos devuelven un código al finalizar (`0` para éxito, un valor de `1` a `255` para errores). Los operadores `&&` (ejecutar si el anterior tuvo éxito) y `||` (ejecutar si falló) se basan en esto.
* **Sustitución de comandos:** Permite capturar la salida de un comando e introducirla en una variable o en otro comando usando `$(comando)`.
* **Manejo de argumentos:** Acceso directo a los parámetros pasados al script mediante variables especiales como `$1`, `$2`, `$@` (todos los argumentos) y `$#` (cantidad de argumentos).
* **Expansión de parámetros:** Permite manipular cadenas, extraer subcadenas o definir valores por defecto en una sola línea (por ejemplo: `DIR="${1:-$HOME}"`).

---

## 4. Fortalezas vs. Limitaciones

| Fortalezas | Limitaciones |
| --- | --- |
| **Omnipresencia:** Está disponible de forma nativa prácticamente en cualquier servidor o contenedor Linux. | **Rendimiento:** Al ser interpretado y lanzar procesos externos, no está diseñado para cálculo numérico intensivo. |
| **Pegamento de herramientas:** Es el estándar para orquestar la ejecución de programas en C, Fortran, Python o contenedores Docker. | **Manejo de datos complejos:** No soporta de forma nativa estructuras de datos avanzadas como JSON multinivel o matrices multidimensionales. |
| **Control total del sistema:** Acceso directo a permisos, usuarios, señales de red y llamadas al kernel. | **Sintaxis estricta con espacios:** Los errores por espacios no deseados (como en `A = B`) son sumamente comunes. |

---

## 5. Buenas Prácticas para Scripts Robustos

Para evitar comportamientos inesperados cuando un comando falla o una variable no está definida, los desarrolladores experimentados suelen incluir al inicio de sus scripts:

```bash
set -euo pipefail

```

* **`set -e`**: Aborta la ejecución inmediatamente si cualquier comando devuelve un error.
* **`set -u`**: Lanza un error si se intenta usar una variable que no ha sido definida.
* **`set -o pipefail`**: Evita que un error en una tubería (`|`) quede oculto si el último comando de la cadena tiene éxito.

Asimismo, la herramienta **ShellCheck** (disponible también como extensión en VS Code) es el linter estándar para detectar errores de sintaxis y potenciales fallos de seguridad en scripts de Bash antes de ejecutarlos.

# Acerca del repositorio

Esta carpeta contiene una colección práctica de ejemplos interactivos en Bash, ideales para aprender fundamentos esenciales del scripting en sistemas Linux o Unix. Los scripts están pensados tanto para principiantes como para quienes desean repasar el manejo de variables, argumentos, arrays y entrada/salida avanzada en Bash.

## Ejemplos incluidos

### 1. Cambiar y mostrar zona horaria

- Demuestra cómo modificar dinámicamente la zona horaria de la sesión usando la variable de entorno `TZ`.
- Utiliza el comando `date` para mostrar la hora local en diferentes regiones.


### 2. Parámetros posicionales y argumentos del script

- Explica el uso de variables especiales:
    - `$#`: Cantidad de argumentos recibidos.
    - `$0`: Nombre del script.
    - `$1`, `$2`, `$3`: Acceso directo a los primeros argumentos.
    - `$*`: Todos los argumentos.
- Permite ver cómo Bash maneja los parámetros al ejecutar el script.


### 3. Manipulación de fechas y la función `set`

- Muestra cómo capturar la salida de un comando (`date`) y descomponerla usando `set` para acceder a partes específicas (como el mes).
- Práctico para extraer información de comandos externos dentro de scripts.


### 4. Manipulación de argumentos con `shift`

- Ilustra cómo cambiar el foco de los argumentos posicionales usando el comando `shift`.
- Permite manejar argumentos en bloques o recorrer listas de parámetros de forma flexible.


### 5. Uso de arrays en Bash

- Ejemplo de declaración y acceso a arrays:
    - Acceso a todos los elementos.
    - Acceso individual por índice.
- Fundamental para almacenar y procesar listas de datos en scripts de shell.


### 6. Here-Document (`cat <<`)

- Ejemplo de cómo imprimir bloques de texto multilinea, utilizando variables dentro del bloque.
- Útil para crear mensajes formateados, scripts dinámicos o archivos de configuración desde Bash.


## ¿Cómo usar estos recursos?

1. **Descargar el script principal** (por ejemplo, `ejemplos.sh`).
2. **Hacerlo ejecutable:**
`chmod +x ejemplos.sh`
3. **Ejecutar el script**, puede pasarle argumentos opcionales:
`./ejemplos.sh arg1 arg2 arg3`
4. **Navegar por el menú interactivo** y seleccionar el ejemplo que desea explorar.
5. **Observar la salida y experimentar** modificando los ejemplos a su gusto.

## Propósito de los recursos

- Servir como referencia y base para quienes comienzan en Bash.
- Brindar ejemplos claros, ejecutables y adaptables.
- Fomentar la experimentación interactiva y el autoaprendizaje.

Estos ejemplos permiten profundizar en el lenguaje de scripting de Bash. Recursos como puntos de partida flexibles y prácticos.


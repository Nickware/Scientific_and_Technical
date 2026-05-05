# Configuración de Debugging con GDB en Visual Studio Code

Esta guía le ayudará a configurar el entorno de depuración en **Visual Studio Code** usando **GDB** para programas escritos en **C o C++** en sistemas **Linux**.

---

## Requisitos Previos

- Sistema Linux (Ubuntu, Debian, Fedora, etc.)
- [Visual Studio Code](https://code.visualstudio.com/) instalado
- Extensiones necesarias:
  - **C/C++** (por Microsoft)
  - **C/C++ Extension Pack** (opcional, pero recomendada)
- Compilador instalado: `gcc` o `g++`
- Depurador: `gdb`

---

## Paso 1: Instalar herramientas esenciales

Abrir una terminal y ejecutar:

```bash
# En Ubuntu/Debian
sudo apt update
sudo apt install build-essential gdb

# En Fedora/RHEL
sudo dnf install gcc gcc-c++ gdb make

# En Arch Linux
sudo pacman -S base-devel gdb
```

Verificar las instalaciones:

```bash
gcc --version
g++ --version
gdb --version
```

---

## Paso 2: Abrir su proyecto en VS Code

1. Crear o abrir una carpeta de proyecto (ej. `mi_proyecto/`).
2. Asegurarse de tener al menos un archivo fuente, por ejemplo: `main.c` o `main.cpp`.

Ejemplo (`main.c`):

```c
#include <stdio.h>

int main() {
    int x = 42;
    printf("Valor de x: %d\n", x);
    return 0;
}
```

---

## Paso 3: Crear la carpeta `.vscode` y los archivos de configuración

Dentro de la carpeta de proyecto, crear la carpeta `.vscode` si no existe:

```bash
mkdir -p .vscode
```

###  Archivo 1: `tasks.json` (para compilar con `-g`)

Crear `.vscode/tasks.json`:

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "type": "cppbuild",
      "label": "C/C++: gcc build active file",
      "command": "/usr/bin/gcc",
      "args": [
        "-fdiagnostics-color=always",
        "-g",
        "${file}",
        "-o",
        "${fileDirname}/${fileBasenameNoExtension}"
      ],
      "options": {
        "cwd": "${fileDirname}"
      },
      "problemMatcher": ["$gcc"],
      "group": {
        "kind": "build",
        "isDefault": true
      }
    }
  ]
}
```

>  **Importante**: La bandera `-g` incluye símbolos de depuración necesarios para GDB.

> Si usa C++, cambiar `"command": "/usr/bin/g++"` y ajustar la extensión del archivo.

---

###  Archivo 2: `launch.json` (para depurar con GDB)

Crear `.vscode/launch.json`:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Debug C/C++ Program",
      "type": "cppdbg",
      "request": "launch",
      "program": "${fileDirname}/${fileBasenameNoExtension}",
      "args": [],
      "stopAtEntry": false,
      "cwd": "${fileDirname}",
      "environment": [],
      "externalConsole": false,
      "MIMode": "gdb",
      "setupCommands": [
        {
          "description": "Habilitar impresión bonita para GDB",
          "text": "-enable-pretty-printing",
          "ignoreFailures": true
        }
      ],
      "preLaunchTask": "C/C++: gcc build active file"
    }
  ]
}
```

Este archivo:
- Usar GDB como backend (`"MIMode": "gdb"`)
- Ejecutar la tarea de compilación antes de depurar (`preLaunchTask`)
- Generar el ejecutable con el mismo nombre que el archivo fuente

---

## Paso 4: Depurar su programa

1. Abrir el archivo fuente (ej. `main.c`) en VS Code.
2. Hacer clic en el ícono de **Run and Debug** (o presionar `Ctrl+Shift+D`).
3. Hacer clic en **"Run and Debug"** o presionar `F5`.
4. VS Code:
   - Compilará el archivo con `gcc -g`
   - Iniciará GDB
   - Detendrá la ejecución en la primera línea (si `stopAtEntry: true`) o en los breakpoints

### Colocar breakpoints

- Hacer clic en el margen izquierdo, junto al número de línea, para colocar un **breakpoint** (aparecerá un punto rojo).
- Durante la depuración, puede inspeccionar variables y usar **Step Over**, **Step Into**, etc. desde la barra de control.

---

## Consejos Útiles

- **Depurar con argumentos**: Editar el campo `"args"` en `launch.json`:
  
  ```json
  "args": ["arg1", "arg2"]
  ```
- **Entrada desde archivo**: Aunque VS Code no redirige fácilmente stdin, puede usar:
  
  ```json
  "args": ["<", "input.txt"]
  ```
  O mejor, modificar temporalmente el código para leer de un archivo durante la depuración.
- **Soporte para múltiples archivos**: Ajustar `tasks.json` para compilar varios archivos:
  
  ```json
  "args": ["-g", "main.c", "utils.c", "-o", "mi_programa"]
  ```

---

## Solución de Problemas Comunes

| Problema                                      | Solución                                                     |
| --------------------------------------------- | ------------------------------------------------------------ |
| *"preLaunchTask terminated with exit code 1"* | Revisar errores de compilación en la pestaña **Terminal > Tasks** |
| No se detiene en breakpoints                  | Asegurarse de que compiló con `-g` y que el ejecutable está actualizado |
| GDB no encontrado                             | Verificar que `gdb` esté instalado y en el `PATH`            |
| No se muestra el código fuente                | Asegurarse de estar depurando el archivo correcto y que el ejecutable coincida con el código |

---

## Recursos Adicionales

- [Documentación oficial de C++ en VS Code](https://code.visualstudio.com/docs/cpp/cpp-debug)
- Extensión recomendada: **Code Runner** (para ejecución rápida, pero no para depuración avanzada)
- Comando útil en terminal: `code .` para abrir la carpeta actual en VS Code

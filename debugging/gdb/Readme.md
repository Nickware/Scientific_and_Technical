# Guía Paso a Paso: Configuración y Uso de GDB en Linux

Esta guía ayudará a configurar y utilizar **GDB (GNU Debugger)** para depurar programas escritos en lenguajes como C o C++ en sistemas Linux.

---

## Requisitos Previos

- Sistema operativo Linux (Ubuntu, Debian, Fedora, etc.)
- Compilador `gcc` o `g++` instalado
- GDB instalado
- Un programa fuente en C/C++ para depurar (ej. `main.c`)

---

## Paso 1: Instalar GDB

Abrir una terminal y ejecuta:

```bash
# En sistemas basados en Debian/Ubuntu
sudo apt update
sudo apt install gdb

# En sistemas basados en Fedora/RHEL
sudo dnf install gdb

# En Arch Linux
sudo pacman -S gdb
```

Verificar la instalación:

```bash
gdb --version
```

---

## Paso 2: Compilar programa con símbolos de depuración

Es **esencial** compilar el código con la bandera `-g` para incluir información de depuración:

```bash
gcc -g -o mi_programa main.c
# o para C++
g++ -g -o mi_programa main.cpp
```

>  Sin `-g`, GDB no podrá mostrar nombres de variables, líneas de código ni establecer breakpoints correctamente.

---

## Paso 3: Iniciar GDB

Ejecutar GDB con el programa compilado:

```bash
gdb ./mi_programa
```

Esto abrirá el prompt de GDB:

```
(gdb)
```

---

## Paso 4: Comandos Básicos de GDB

Una vez dentro de GDB, se puede usar los siguientes comandos:

| Comando                      | Descripción                                           |
| ---------------------------- | ----------------------------------------------------- |
| `run` o `r`                  | Ejecuta el programa                                   |
| `break <línea>` o `b main`   | Establece un breakpoint (ej. `b 10` o `b funcion`)    |
| `next` o `n`                 | Ejecuta la siguiente línea (sin entrar en funciones)  |
| `step` o `s`                 | Ejecuta la siguiente línea (entrando en funciones)    |
| `print <variable>` o `p var` | Muestra el valor de una variable                      |
| `continue` o `c`             | Continúa la ejecución hasta el siguiente breakpoint   |
| `list` o `l`                 | Muestra el código fuente alrededor de la línea actual |
| `quit` o `q`                 | Sale de GDB                                           |

### Ejemplo de sesión:

```gdb
(gdb) break main
(gdb) run
(gdb) next
(gdb) print x
(gdb) continue
(gdb) quit
```

---

## Paso 5: Depuración con argumentos o entrada

Si el programa necesita argumentos o redirección de entrada:

```gdb
(gdb) set args arg1 arg2
(gdb) run

# O para redirigir un archivo como entrada:
(gdb) run < input.txt
```

---

## Paso 6: Salir limpiamente

Cuando termine, usar:

```gdb
(gdb) quit
```

GDB preguntará si se desea terminar el programa en ejecución. Responder `y` si es necesario.

---

## Consejos Adicionales

- Usar `layout src` para una interfaz tipo TUI (Terminal User Interface) con código visible.
- Para depurar programas con múltiples hilos, usar `info threads` y `thread <n>`.
- Si el programa falla con un *segmentation fault*, ejecútarlo en GDB y usar `bt` (*backtrace*) para ver el stack trace.

---

## Recursos Útiles

- [Documentación oficial de GDB](https://sourceware.org/gdb/documentation/)
- `man gdb`
- Comando dentro de GDB: `help <comando>`


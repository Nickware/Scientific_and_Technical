## ¿Qué es un Makefile?

Un **Makefile** es un archivo de configuración usado por la utilidad `make` (originaria de Unix en 1976) para automatizar la construcción de programas. Esencialmente, le dice al sistema:

> "Para construir X, necesito Y y Z. Si Y o Z cambiaron, reconstruye X."

## Estructura básica

```makefile
# Esto es un comentario
target: dependencies
	command_to_execute
```

### Ejemplo clásico en C:

```makefile
CC = gcc
CFLAGS = -Wall -g

main: main.o utils.o
	$(CC) $(CFLAGS) -o main main.o utils.o

main.o: main.c main.h
	$(CC) $(CFLAGS) -c main.c

utils.o: utils.c utils.h
	$(CC) $(CFLAGS) -c utils.c

clean:
	rm -f *.o main
```

## Conceptos clave

### 1. **Targets (objetivos)**
Son los archivos que quieres generar o las acciones que quieres ejecutar (como `clean`).

### 2. **Dependencies (dependencias)**
Archivos necesarios para construir el target. Si cambian, `make` sabe que debe reconstruir.

### 3. **Commands (comandos)**
Las instrucciones para construir el target. **Importante**: deben empezar con un **tabulador**, no espacios. Este es el error más común.

### 4. **Variables**
```makefile
CC = gcc
SRCS = main.c utils.c
OBJS = $(SRCS:.c=.o)
```

### 5. **Reglas implícitas**
`make` tiene reglas por defecto. Por ejemplo, sabe que `.c` → `.o` se compila con `$(CC) -c`.

## Comandos útiles

```bash
make          # Construye el primer target
make clean    # Ejecuta el target 'clean'
make -j4      # Compilación paralela con 4 jobs
make -n       # Dry-run: muestra qué haría sin ejecutar
```

## Patrones avanzados

### Reglas con patrón (%):
```makefile
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@
```
- `$<` = primera dependencia
- `$@` = target
- `$^` = todas las dependencias

### Funciones:
```makefile
SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)
```

## ¿Por qué usar Makefiles hoy?

Aunque existen alternativas modernas (CMake, Meson, Ninja), Make sigue siendo relevante porque:

1. **Universal**: Viene preinstalado en casi todos los sistemas Unix/Linux
2. **Simple para proyectos pequeños**: No necesitas aprender otro lenguaje
3. **Flexible**: Puedes usarlo para cualquier tarea repetitiva, no solo compilación
4. **Base de otros tools**: Muchos sistemas de build modernos generan Makefiles internamente

## Ejemplo práctico para tu contexto

Dado que se practica running y cycling, se podría tener un Makefile para organizar scripts de análisis de datos:

```makefile
DATA_DIR = ./data
RESULTS_DIR = ./results

analyze_run: $(DATA_DIR)/run_data.csv
	python analyze_pace.py $< > $(RESULTS_DIR)/pace_report.txt

analyze_cycle: $(DATA_DIR)/cycle_data.csv
	python analyze_power.py $< > $(RESULTS_DIR)/power_report.txt

all: analyze_run analyze_cycle

clean:
	rm -f $(RESULTS_DIR)/*.txt
```

## Filosofía makeana

El Makefile encarna una idea profunda: **declarar relaciones de dependencia** en lugar de procedimientos secuenciales. Es como decir "el resultado depende de estos inputs" en vez de "haz A, luego B, luego C". Esto permite:

- **Eficiencia**: Solo reconstruye lo necesario
- **Paralelización**: Puede hacer cosas independientes simultáneamente
- **Claridad**: El mapa de dependencias es explícito

# Gas Ideal: Gráfica de Presión vs Temperatura (Fortran 77 + Makefile)

Este es un ejemplo que demuestra cómo usar Fortran 77 junto con un Makefile y Gnuplot para modelar y visualizar la ley del gas ideal:

$\[P = \frac{nRT}{V}\]$

El programa genera datos de presión en función de la temperatura (con volumen y moles constantes) y los grafica automáticamente.

---

## Estructura del repositorio

```
gas-ideal-f77/
├── gas_ideal.f      # Código fuente en Fortran 77
├── Makefile         # Automatiza compilación, ejecución y gráficos
├── README.md        # Este archivo
└── LICENSE          # (Opcional, ver más abajo)
```

---

## Requisitos

- **Compilador de Fortran**: `gfortran` (recomendado)
- **Herramienta de graficación**: `gnuplot`
- Sistema operativo compatible con `make` (Linux, macOS, o WSL en Windows)

### Instalación en Ubuntu/Debian:

```bash
sudo apt update
sudo apt install gfortran gnuplot make
```

### En macOS (con Homebrew):

```bash
brew install gcc gnuplot make
```

> Nota: En macOS, `gfortran` se instala junto con `gcc`.

---

## Cómo usarlo

1. Clona o descarga este repositorio.
2. Abrir una terminal en el directorio del proyecto.
3. Ejecutar:

```bash
make
```

Esto hará lo siguiente:
- Compilará `gas_ideal.f` → genera el ejecutable `gas_ideal`
- Ejecutará el programa → genera `datos.dat`
- Creará un script de Gnuplot (`plot.gp`)
- Generará la gráfica → `gas_ideal.png`

4. ¡Abre `gas_ideal.png` para ver la gráfica!

### Comandos adicionales

| Comando        | Acción |
|----------------|--------|
| `make`         | Compila, ejecuta y grafica |
| `make clean`   | Elimina archivos generados (`gas_ideal`, `datos.dat`, `plot.gp`, `gas_ideal.png`) |
| `make run`     | Solo compila y ejecuta (sin graficar) |
| `make plot`    | Solo genera la gráfica (requiere `datos.dat`) |

---

## Resultado esperado

La gráfica muestra una **relación lineal** entre temperatura (K) y presión (atm), tal como predice la ley del gas ideal cuando \(n\) y \(V\) son constantes.

Ejemplo de salida en `datos.dat`:
```
100.000000       0.366326
108.163277       0.396233
116.326546       0.426140
...
500.000000       1.831629
```

---

## Personalización

Puede modificar los parámetros en `gas_ideal.f`:
- `N`: número de moles
- `V`: volumen en litros
- `T_MIN`, `T_MAX`: rango de temperaturas
- `NT`: cantidad de puntos

Después de editar, vuelve a ejecutar `make`.

---

## Licencia

Este proyecto es de código abierto y está disponible bajo la licencia **MIT**.  

> Ideal para fines educativos, laboratorios introductorios de física o química, o como ejemplo de integración entre Fortran y herramientas de automatización.

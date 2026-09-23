# Introducción a Makefile

Un Makefile es un archivo que le indica a la utilidad `make` cómo compilar, ejecutar y organizar tareas de un proyecto. Es ampliamente usado en entornos Unix y Linux para automatizar compilaciones.

[Volver al README principal](../README.md)

## Objetivos de aprendizaje

Al finalizar este módulo, el estudiante podrá:
- entender qué es un Makefile y para qué sirve.
- distinguir entre targets, dependencias y comandos.
- compilar proyectos automáticamente con `make`.
- usar reglas y variables para simplificar la construcción del software.
- integrar datos y visualización con herramientas como Gnuplot.

## Tabla de contenido

1. [Qué es un Makefile](#qué-es-un-makefile)
2. [Estructura básica](#estructura-básica)
3. [Conceptos clave](#conceptos-clave)
4. [Comandos útiles](#comandos-útiles)
5. [Ejemplo práctico](#ejemplo-práctico)
6. [Buenas prácticas](#buenas-prácticas)
7. [Validación y verificación](#validación-y-verificación)

## Qué es un Makefile

Automatizar la compilación es clave en proyectos con varios archivos o dependencias. En lugar de escribir el comando completo cada vez, el Makefile define la lógica de compilación.

El ejemplo clásico es:

```makefile
CC = gcc
CFLAGS = -Wall -g

main: main.o utils.o
	$(CC) $(CFLAGS) -o main main.o utils.o
```

## Estructura básica

```makefile
# Comentario
target: dependencias
	comando
```

En las reglas, el primer nombre es el objetivo y lo que sigue son las dependencias.

## Conceptos clave

### Targets
Los targets son archivos o pasos a ejecutar, por ejemplo `all`, `run`, `plot` o `clean`.

### Dependencias
Son archivos que deben existir o cambiar antes de construir un objetivo.

### Variables
Se usan para reutilizar valores como compilador y banderas:

```makefile
CC = gfortran
FFLAGS = -O2
```

## Comandos útiles

```bash
make
make run
make plot
make clean
make -n
```

- `make` ejecuta la regla por defecto.
- `make run` compila y ejecuta.
- `make plot` genera la representación gráfica.
- `make clean` elimina archivos temporales.
- `make -n` muestra lo que haría sin ejecutarlo.

## Ejemplo práctico

Este proyecto incluye un ejemplo con la ley del gas ideal:

$$
P = \frac{nRT}{V}
$$

El archivo [Makefile](Makefile) compila el programa [gas_ideal.f](gas_ideal.f), genera datos y produce una gráfica con Gnuplot.

### Ejecución rápida

```bash
make
```

Esto hará lo siguiente:
- compilar `gas_ideal.f`,
- ejecutar el programa,
- generar `datos.dat`,
- crear el script Gnuplot,
- exportar la gráfica.

## Buenas prácticas

- usa tabs en los comandos del Makefile,
- separa objetivos por responsabilidad,
- evita reglas demasiado complejas,
- usa `clean` para dejar el proyecto en estado limpio,
- documenta qué hace cada target.

## Validación y verificación

Puedes verificar la configuración de compilación con:

```bash
make -n
make clean
make
```

Si el flujo se ejecuta sin errores, el proyecto ha sido compilado correctamente y puede generarse la salida esperada.

## Reproducibilidad

Un Makefile hace que la compilación sea reproducible: el mismo proyecto puede construirse de la misma forma en distintas sesiones. Eso es vital en investigación, ingeniería y computación científica.

## Siguientes pasos

- revisar [introduction_gnuplot/README.md](../introduction_gnuplot/README.md)
- revisar [introduction_to_bash/README.md](../introduction_to_bash/README.md)
- revisar [developing_with_git/README.md](../developing_with_git/README.md)

---

Este módulo es la base para automatizar la construcción de programas y dejar tareas repetitivas bajo control.


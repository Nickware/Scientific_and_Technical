# Introducción a Gnuplot

Gnuplot es una herramienta de visualización científica que permite crear gráficos en 2D y 3D a partir de funciones matemáticas o datos experimentales. Es ampliamente usada en física, ingeniería, análisis de datos y educación.

[Volver al README principal](../README.md)

## Objetivos de aprendizaje

Al finalizar este módulo, el estudiante podrá:
- reconocer la utilidad de Gnuplot para visualizar información científica.
- crear gráficos básicos en 2D y 3D.
- interpretar datos y funciones con representación gráfica.
- automatizar la generación de figuras mediante scripts.

## Tabla de contenido

1. [Qué es Gnuplot](#qué-es-gnuplot)
2. [Instalación rápida](#instalación-rápida)
3. [Ejemplo básico](#ejemplo-básico)
4. [Ejemplo práctico: sombrero mexicano](#ejemplo-práctico-sombrero-mexicano)
5. [Buenas prácticas](#buenas-prácticas)
6. [Validación y verificación](#validación-y-verificación)

## Qué es Gnuplot

Gnuplot permite generar gráficas de líneas, puntos, superficies y contornos. Soporta varios formatos de salida como PNG, PDF, SVG y terminales interactivos.

## Instalación rápida

En Ubuntu o Debian:

```bash
sudo apt update
sudo apt install gnuplot
```

## Ejemplo básico

```gnuplot
set title "Algunas funciones matemáticas"
set xrange [-10:10]
set yrange [-2:2]
set zeroaxis
plot (x/4)**2, sin(x), 1/x
```

Este script genera una gráfica con tres funciones: $$(x/4)^2, \sin(x), 1/x$$.

## Ejemplo práctico: sombrero mexicano

El archivo [sombrero.gnu](sombrero.gnu) genera una superficie 3D de la función:

$$
f(x, y) = \frac{\sin(\sqrt{x^2 + y^2})}{\sqrt{x^2 + y^2}}
$$

### Qué hace el script

- define los rangos de los ejes,
- activa `pm3d` para sombreado de color,
- oculta líneas traseras con `hidden3d`,
- usa una paleta de colores para distinguir niveles,
- permite rotación interactiva con el mouse.

### Ejecución

```bash
gnuplot sombrero.gnu
```

## Buenas prácticas

- define títulos y etiquetas para que la figura sea legible,
- usa rangos adecuados a la función o dato,
- guarda la salida en formato PNG o PDF cuando la figura vaya a reportes,
- automatiza la generación con scripts si se repite la misma visualización.

## Validación y verificación

Para comprobar que la herramienta está instalada y funcionando:

```bash
gnuplot --version
```

Para ejecutar la gráfica ejemplo:

```bash
gnuplot sombrero.gnu
```

Si el comando se ejecuta sin errores, la figura se puede abrir y visualizar correctamente.

## Reproducibilidad

La visualización científica debe ser reproducible. Gnuplot permite guardar la lógica de la gráfica en un script, de modo que la figura pueda regenerarse exactamente con los mismos parámetros.

## Siguientes pasos

- revisar [introduction_makefile/README.md](../introduction_makefile/README.md)
- revisar [introduction_to_bash/README.md](../introduction_to_bash/README.md)
- revisar [developing_with_git/README.md](../developing_with_git/README.md)

---

Este módulo conecta la teoría matemática con la representación visual, una parte esencial del trabajo científico y técnico.


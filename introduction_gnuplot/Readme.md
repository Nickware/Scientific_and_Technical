# Gnuplot

Gnuplot es una potente utilidad gráfica con línea de comandos que puede generar gráficos en 2D y 3D de funciones, datos y ajustes de datos [gnuplot](http://www.gnuplot.info). Se ejecuta en todos los sistemas operativos principales incluyendo Linux, Unix, Windows, macOS, entre otros [gnuplot](http://www.gnuplot.info).

Originalmente lanzado en 1986, Gnuplot ha estado en desarrollo activo desde entonces [gnuplot](http://www.gnuplot.info). Se creó para permitir a los científicos y estudiantes visualizar funciones matemáticas e información de datos interactivamente [gnuplot](http://www.gnuplot.info).

## Características Clave

- Soporta muchos estilos de gráficas, incluyendo líneas, puntos, cajas, contornos, campos vectoriales, imágenes, superficies y texto [gnuplot](http://www.gnuplot.info/docs/loc69.html)
- Genera salida para visualizaciones en pantalla interactivas, trazadores, impresoras modernas y varios formatos de archivo como EPS, PDF, PNG, SVG, LaTeX [gnuplot](http://www.gnuplot.info)
- Lee datos en diversos formatos y puede generar múltiples gráficos en una sola imagen [en.wikipedia](https://en.wikipedia.org/wiki/Gnuplot)
- Proporciona capacidades de scripting con bucles, funciones, variables, macros y preprocessado de datos [en.wikipedia](https://en.wikipedia.org/wiki/Gnuplot)
- Realiza ajustes no lineales multidimensionales de datos usando algoritmos como Levenberg–Marquardt [en.wikipedia](https://en.wikipedia.org/wiki/Gnuplot)

## Uso Ejemplo

Aquí hay un ejemplo de cómo crear una gráfica con Gnuplot [en.wikipedia](https://en.wikipedia.org/wiki/Gnuplot):

```gnuplot
set title "Algunas funciones matemáticas" 
set xrange [-10:10]
set yrange [-2:2]
set zeroaxis
plot (x/4)**2, sin(x), 1/x
```

Esto generará una gráfica con tres funciones: $$(x/4)^2, \sin(x), \frac{1}{x}$$

Gnuplot es una herramienta gratuita, flexible y potente para visualizar datos e información de funciones tanto en 2D como en 3D. Su interfaz con línea de comandos y capacidades de scripting la hacen ideal para automatizar gráficas e integrar con otros programas."

# Sombrero Mexicano 

Este script realiza la visualización tridimensional de la función conocida como **sombrero mexicano**, usando el software Gnuplot para crear un gráfico interactivo y coloreado de la superficie definida por la fórmula matemática $f(x, y) = \frac{\sin(\sqrt{x^2 + y^2})}{\sqrt{x^2 + y^2}}$.

### Objetivo del script
El propósito principal es dibujar el gráfico 3D del sombrero mexicano, que es una función oscilatoria tipo sinc, centrada en el origen y con comportamiento radial, usada frecuentemente en física y procesamiento de señales.

### Detalles clave del script

- **Título del gráfico:** Usa "Sombrero Mexicano" para clarificar el tema del gráfico.
- **Rangos de ejes:** Limita los valores de $$x$$ y $$y$$ entre $$-10$$ y $$10$$, permitiendo ver el área relevante del "sombrero".
- **Etiquetas:** Nombramiento claro de los ejes X, Y y Z para mejor interpretación visual.
- **Coloreado pm3d:** El comando `set pm3d` genera un sombreado de colores que representa el valor Z de la función, produciendo un efecto visual atractivo y descriptivo.
- **Ocultar líneas ocultas:** Mejora la presentación eliminando líneas que no deberían ser vistas en perspectiva 3D (`set hidden3d`).
- **Paleta personalizada:** Asigna colores a los niveles de la superficie, ayudando a la interpretación del valor de Z mediante gradientes de azul a rojo.
- **Función matemática:** Grafica el sombrero mexicano, cuya singularidad en el origen crea el pico central; se utiliza la función sinc en coordenadas radiales.
- **Interactividad:** Permite rotar el gráfico con el ratón (`set mouse`), facilitando el análisis desde diferentes perspectivas.

### Aplicaciones y utilidad

- La función sombrero mexicano se usa como **filtro en procesamiento digital de señales** y en **análisis de imágenes** por sus propiedades ideales para resaltar detalles locales y su comportamiento oscilatorio.
- El gráfico ayuda a visualizar el comportamiento de la función, mostrando el pico central y las oscilaciones concéntricas decrecientes.

### Explicación matemática

La función graficada es:

$$
f(x, y) = \frac{\sin(\sqrt{x^2 + y^2})}{\sqrt{x^2 + y^2}}
$$

- En el origen ($$x=0, y=0$$), la función se evalúa mediante el límite, obteniendo el máximo en el centro.
- La forma recuerda a un sombrero tradicional mexicano por sus ondas.

Este script es ideal para mostrar una de las funciones más usadas en física y procesamiento de señales, haciendo uso de las facilidades gráficas de Gnuplot.

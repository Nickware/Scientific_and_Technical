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

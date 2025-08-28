# Establece el título del gráfico
set title "Sombrero Mexicano"

# Configura los rangos de los ejes x e y
set xrange [-10:10]
set yrange [-10:10]

# Establece las etiquetas de los ejes
set xlabel "Eje X"
set ylabel "Eje Y"
set zlabel "Eje Z"

# Dibuja la malla con 'pm3d' para un sombreado de color
set pm3d
set hidden3d # Oculta las líneas que están detrás de la superficie

# Configura la paleta de colores
set palette defined (0 "blue", 1 "cyan", 2 "green", 3 "yellow", 4 "red")

# Define la función del sombrero mexicano
splot sin(sqrt(x**2+y**2))/(sqrt(x**2+y**2)) with pm3d

# Permite una rotación interactiva con el mouse
set mouse

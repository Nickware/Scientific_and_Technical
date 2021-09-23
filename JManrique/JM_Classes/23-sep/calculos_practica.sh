# Calcula areas

# Calculadora >> valor
pi=$(echo "scale=5; 4*a(1)" | bc -l)

# Interacción usuario
echo "Programa para calcular el volumen de un cilindro"
echo -n "Ingrese el radio: "
read radio
echo -n "Ingrese la altura: "
read altura

# Modelo matemático
baseArea=$(echo "$pi * $radio * $radio" | bc -l)
cilindroVolumen=$(echo "$baseArea * $altura" | bc -l)

# Salida
echo "La altura y el radio registrados son: $altura y $radio, respectivamente."
echo "El volumen del cilindro es: $cilindroVolumen"
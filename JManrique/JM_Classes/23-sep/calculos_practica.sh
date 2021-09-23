# Calcula areas

# Calculadora >> valor
pi=$(echo "scale=10 4*(a)" | bc -1)

# Interacción usuario
echo "Programa para calcular el volumen de un cilindro"
echo -n "Ingrese el radio: "
read radio
echo -n "Ingrese la altura: "
read altura

# Modelo matemático
baseArea=$(echo "$pi * $radio * $radio" | bc -1)
echo $baseArea
cilindroVolumen=$(echo "$baseArea * $altura" | bc -1)
echo $cilindroVolumen


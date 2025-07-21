# Introducción a Lenguaje Bash

Este carpeta contiene una colección práctica de **ejemplos interactivos en Bash**, ideales para aprender fundamentos esenciales del scripting en sistemas Linux o Unix. Los scripts están pensados tanto para principiantes como para quienes desean repasar el manejo de variables, argumentos, arrays y entrada/salida avanzada en Bash.

## Ejemplos incluidos

### 1. Cambiar y mostrar zona horaria

- Demuestra cómo modificar dinámicamente la zona horaria de la sesión usando la variable de entorno `TZ`.
- Utiliza el comando `date` para mostrar la hora local en diferentes regiones.


### 2. Parámetros posicionales y argumentos del script

- Explica el uso de variables especiales:
    - `$#`: Cantidad de argumentos recibidos.
    - `$0`: Nombre del script.
    - `$1`, `$2`, `$3`: Acceso directo a los primeros argumentos.
    - `$*`: Todos los argumentos.
- Permite ver cómo Bash maneja los parámetros al ejecutar el script.


### 3. Manipulación de fechas y la función `set`

- Muestra cómo capturar la salida de un comando (`date`) y descomponerla usando `set` para acceder a partes específicas (como el mes).
- Práctico para extraer información de comandos externos dentro de scripts.


### 4. Manipulación de argumentos con `shift`

- Ilustra cómo cambiar el foco de los argumentos posicionales usando el comando `shift`.
- Permite manejar argumentos en bloques o recorrer listas de parámetros de forma flexible.


### 5. Uso de arrays en Bash

- Ejemplo de declaración y acceso a arrays:
    - Acceso a todos los elementos.
    - Acceso individual por índice.
- Fundamental para almacenar y procesar listas de datos en shell scripts.


### 6. Here-Document (`cat <<`)

- Ejemplo de cómo imprimir bloques de texto multilinea, utilizando variables dentro del bloque.
- Útil para crear mensajes formateados, scripts dinámicos o archivos de configuración desde Bash.


## ¿Cómo usar estos recursos?

1. **Descargar el script principal** (por ejemplo, `ejemplos.sh`).
2. **Hacerlo ejecutable:**
`chmod +x ejemplos.sh`
3. **Ejecutar el script**, puede pasarle argumentos opcionales:
`./ejemplos.sh arg1 arg2 arg3`
4. **Navegar por el menú interactivo** y seleccionar el ejemplo que desea explorar.
5. **Observar la salida y experimentar** modificando los ejemplos a su gusto.

## Propósito de los recursos

- Servir como referencia y base para quienes comienzan en Bash.
- Brindar ejemplos claros, ejecutables y adaptables.
- Fomentar la experimentación interactiva y el autoaprendizaje.

Estos ejemplos permiten profundizar en lenguaje Bash scripting. Recursos como puntos de partida flexibles y prácticos.


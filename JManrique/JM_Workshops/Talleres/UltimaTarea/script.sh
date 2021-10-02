#!/usr/bin/bash.exe

# Title: Última Tarea
# Author: Juan Sebastian Manrique Moreno
# Date: 30/09/2021
# Version: 4.4.12(3)-release (x86_64-unknown-cygwin)

# 1. Declaración de variables iniciales

clear

echo "Bienvenido al menú de ejecución, por favor, seleccione qué programa desea ejecutar."
echo ""
echo "                          ----------MENÚ----------"
echo ""
echo \ "                          1. Calculadora."
echo \ "                          2. Juego de preguntas."
echo \ "                          3. Números felices."
echo \ "                          4. Cálculo de raíces."
echo \ "                          5. Números capicúas."
echo \ "                          0. Salir del programa."
echo ""

si='SI'

echo -n "Escriba a continuación el número del programa a ejecutar: "
read
let menu=$REPLY

if [ $menu -eq 1 ]
then
    while [ $menu -eq 1 ] || [ "$ejecucion" == "$si" ]
    do
        clear
        echo "Bienvenido a la calculadora, a continuación el programa le preguntará que operación desea realizar"
        echo ""
        echo "                              ----------MENÚ----------"
        echo ""
        echo \ "                              1. Suma (+)."
        echo \ "                              2. Resta (-)."
        echo \ "                              3. Multiplicación (*)."
        echo \ "                              4. División (/)."
        echo ""

        suma='+'
        resta='-'
        multiplicacion='*'
        division='/'

        echo -n "En este caso, por favor indique el signo de la operación que desea realizar: "
        read decision

        if [ "$decision" == "$suma" ]
        then
            echo ""
            echo "A continuación podrá sumar dos números"
            echo ""

            echo -n "Por favor, escriba el primer número: "
            read primernum
            echo -n "Por favor, escriba el segundo número: "
            read segundonum
            resultado=$(echo "$primernum + $segundonum" | bc -l)

            echo ""
            echo "Calculando... por favor, espere..."
            echo ""
            sleep 5

            echo "El resultado es: $resultado"

            unset primernum
            unset segundonum
            unset resultado
        elif [ "$decision" == "$resta" ]
        then
            echo ""
            echo "A continuación podrá restar dos números"
            echo ""

            echo -n "Por favor, escriba el primer número: "
            read primernum
            echo -n "Por favor, escriba el segundo número: "
            read segundonum
            resultado=$(echo "$primernum - $segundonum" | bc -l)

            echo ""
            echo "Calculando... por favor, espere..."
            echo ""
            sleep 5

            echo "El resultado es: $resultado"

            unset primernum
            unset segundonum
            unset resultado
        elif [ "$decision" == "$multiplicacion" ]
        then
            echo ""
            echo "A continuación podrá multiplicar dos números"
            echo ""

            echo -n "Por favor, escriba el primer número: "
            read primernum
            echo -n "Por favor, escriba el segundo número: "
            read segundonum
            resultado=$(echo "$primernum * $segundonum" | bc -l)

            echo ""
            echo "Calculando... por favor, espere..."
            echo ""
            sleep 5

            echo "El resultado es: $resultado"

            unset primernum
            unset segundonum
            unset resultado
        elif [ "$decision" == "$division" ]
        then
            echo ""
            echo "A continuación podrá dividir dos números"
            echo ""

            echo -n "Por favor, escriba el primer número: "
            read primernum
            echo -n "Por favor, escriba el segundo número: "
            read segundonum
            resto=$(echo "scale=0; $primernum % $segundonum" | bc -l)

            echo ""
            echo "Calculando... por favor, espere..."
            echo ""
            sleep 5

            if [ "$resto" == "0" ]
            then
                resultado=$(echo "scale=0; $primernum / $segundonum" | bc -l)
                echo "El resultado es: $resultado"
            else
                resultado=$(echo "scale=5; $primernum / $segundonum" | bc -l)
                resultado_esp=$(echo "scale=0; $primernum / $segundonum" | bc -l)
                echo "La división no es exacta, a continuación la división en entero con su residuo:"
                echo \ "Número entero: $resultado_esp"
                echo \ "Residuo de la división: $resto"
                echo \ "Representación decimal: $resultado"
            fi

            unset primernum
            unset segundonum
            unset resultado
            unset resultado_esp
            unset resto
        else
            echo ""
            echo "Disculpe, no comprendemos el carácter que registró"
        fi
        echo ""
        echo "¿Desea realizar otra operación?"
        echo -n "Si es así escriba ""SI"", si no, presione ENTER: "
        read
        ejecucion=${REPLY^^}

        if [ "$ejecucion" != "$si" ]
        then
            echo ""
            echo "Gracias por ejecutar nuestro programa, vuelva pronto."
            echo ""
            echo "Saliendo..."
            sleep 3
            exit 0
        fi
    done
elif [ $menu -eq 2 ]
then
    clear
    echo "                                  Bienvenido al juego de preguntas"
    echo "                A continuación usted deberá responder 10 preguntas de cultura general"
    echo "   Si responde más del 75% bien, será condecorado cómo Gran Sabio, si no, puede intentarlo nuevamente"
    echo "Las respuestas correctas junto a las preguntas que respondió bien, estarán al final en un resumen detallado"
    echo ""
    echo "            ------------------------------¡Mucha suerte!------------------------------"
    echo ""

    let resco=0

    echo "1. ¿Cuál es el río más largo del mundo?"
    echo \ "A. El Nilo."
    echo \ "B. El Tigris."
    echo \ "C. El Amazonas."
    echo \ "D. El Magdalena."
    echo ""

    echo -n "Escriba la letra de la que usted considere la respuesta correcta: "
    read
    res1=${REPLY^^}

    echo ""
    echo ""

    echo "2. ¿Cuál es el país con más habitantes en el mundo?"
    echo \ "A. China."
    echo \ "B. Estados Unidos."
    echo \ "C. India."
    echo \ "D. Rusia."
    echo ""

    echo -n "Escriba la letra de la que usted considere la respuesta correcta: "
    read
    res2=${REPLY^^}

    echo ""
    echo ""

    echo "3. ¿Cuál es el país con menos habitantes del mundo?"
    echo \ "A. Holanda."
    echo \ "B. Ciudad del Vaticano."
    echo \ "C. Paraguay."
    echo \ "D. Nueva Zelanda."
    echo ""

    echo -n "Escriba la letra de la que usted considere la respuesta correcta: "
    read
    res3=${REPLY^^}

    echo ""
    echo ""

    echo "4. ¿Cuál es el edificio más alto del mundo?"
    echo \ "A. El Big Ben, en Inglaterra."
    echo \ "B. La torre Colpatria, en Colombia."
    echo \ "C. El Empire State, en Estados Unidos."
    echo \ "D. El Burj Khalifa, en Dubai."
    echo ""

    echo -n "Escriba la letra de la que usted considere la respuesta correcta: "
    read
    res4=${REPLY^^}

    echo ""
    echo ""

    echo "5. ¿Cuántos años duró la primera guerra mundial?"
    echo \ "A. Duró 7 años, de 1941 a 1948."
    echo \ "B. Duró 1 año, de 1916 a 1917."
    echo \ "C. Duró 3 años, de 1914 a 1917."
    echo \ "D. Duró 4 años, de 1914 a 1918."
    echo ""

    echo -n "Escriba la letra de la que usted considere la respuesta correcta: "
    read
    res5=${REPLY^^}

    echo ""
    echo ""

    echo "6. ¿Cuántos años duró la segunda guerra mundial?"
    echo \ "A. Duró 2 años, de 1941 a 1943."
    echo \ "B. Duró 6 años, de 1939 a 1945."
    echo \ "C. Duró 9 años, de 1936 a 1945."
    echo \ "D. Duró 5 años, de 1939 a 1944."
    echo ""

    echo -n "Escriba la letra de la que usted considere la respuesta correcta: "
    read
    res6=${REPLY^^}

    echo ""
    echo ""

    echo "7. ¿Cuál es el océano más grande del mundo?"
    echo \ "A. El océano Índico."
    echo \ "B. El océano Atlántico."
    echo \ "C. El océano Pacífico."
    echo \ "D. El océano Ártico."
    echo ""

    echo -n "Escriba la letra de la que usted considere la respuesta correcta: "
    read
    res7=${REPLY^^}

    echo ""
    echo ""

    echo "8. ¿Cuál es el planeta más grande del sistema solar?"
    echo \ "A. Júpiter."
    echo \ "B. Marte."
    echo \ "C. Neptuno."
    echo \ "D. Mercurio."
    echo ""

    echo -n "Escriba la letra de la que usted considere la respuesta correcta: "
    read
    res8=${REPLY^^}

    echo ""
    echo ""

    echo "9. ¿Cuál es animal más grande del mundo?"
    echo \ "A. El elefante."
    echo \ "B. La ballena azul."
    echo \ "C. La jirafa."
    echo \ "D. El cachalote."
    echo ""

    echo -n "Escriba la letra de la que usted considere la respuesta correcta: "
    read
    res9=${REPLY^^}

    echo ""
    echo ""

    echo "10. ¿Cómo se llama la luna más grande de Saturno?"
    echo \ "A. Encélado."
    echo \ "B. Mimas."
    echo \ "C. Titán."
    echo \ "D. Tetis."
    echo ""

    echo -n "Escriba la letra de la que usted considere la respuesta correcta: "
    read
    res10=${REPLY^^}

    echo ""
    echo ""

    echo ""
    echo "Muchas gracias por responder nuestra encuesta, en un momento le daremos sus resultados"
    echo ""
    echo "Cargando resultados..."
    sleep 5
    echo ""

    if [ "$res1" == "C" ]
    then
        echo "Pregunta 1: ¡Respuesta correcta!"
        echo "================================"
        echo "¿Sabías qué?"
        echo \ "El Bosque lluvioso del Amazonas es tan grande que cubre parte de América del Sur. Es también el"
        echo \ "hogar de una increíble variedad de fauna animal la cual no se pueden encontrar en ningún otro lugar del planeta."
        echo ""
        ((resco++))
    else
        echo "Pregunta 1: ¡Respuesta incorrecta!"
        echo "La respuesta correcta es la: C. El Amazonas."
        echo "============================================"
        echo "¿Sabías qué?"
        echo \ "El Bosque lluvioso del Amazonas es tan grande que cubre parte de América del Sur. Es también el"
        echo \ "hogar de una increíble variedad de fauna animal la cual no se pueden encontrar en ningún otro lugar del planeta."
        echo ""
    fi
    if [ "$res2" == "A" ]
    then
        echo "Pregunta 2: ¡Respuesta correcta!"
        echo "================================"
        echo "¿Sabías qué?"
        echo \ "China tiene nada más y nada menos que 1.400 millones de habitantes. ¡Eso significa que una de cada cinco personas de"
        echo \ "este planeta viven en China! Por eso, no es ninguna sorpresa que el chino sea el idioma más hablado del planeta."
        echo ""
        ((resco++))
    else
        echo "Pregunta 2: ¡Respuesta incorrecta!"
        echo "La respuesta correcta es la: A. China."
        echo "======================================"
        echo "¿Sabías qué?"
        echo \ "China tiene nada más y nada menos que 1.400 millones de habitantes. ¡Eso significa que una de cada cinco personas de"
        echo \ "este planeta viven en China! Por eso, no es ninguna sorpresa que el chino sea el idioma más hablado del planeta."
        echo ""
    fi
    if [ "$res3" == "B" ]
    then
        echo "Pregunta 3: ¡Respuesta correcta!"
        echo "================================"
        echo "¿Sabías qué?"
        echo \ "Pese a ser uno de los lugares más sagrados de toda la cristiandad, la Ciudad del Vaticano es, casualmente, el lugar"
        echo \ "con la mayor tasa de criminalidad del mundo. Esto es debido principalmente al hecho de que es un lugar turístico y"
        echo \ "donde hay turistas inocentes haciendo fotografías de todo lo que ven hay, también, ladrones."
        echo ""
        ((resco++))
    else
        echo "Pregunta 3: ¡Respuesta incorrecta!"
        echo "La respuesta correcta es la: B. Ciudad del Vaticano."
        echo "===================================================="
        echo "¿Sabías qué?"
        echo \ "Pese a ser uno de los lugares más sagrados de toda la cristiandad, la Ciudad del Vaticano es, casualmente, el lugar"
        echo \ "con la mayor tasa de criminalidad del mundo. Esto es debido principalmente al hecho de que es un lugar turístico y"
        echo \ "donde hay turistas inocentes haciendo fotografías de todo lo que ven hay, también, ladrones."
        echo ""
    fi
    if [ "$res4" == "D" ]
    then
        echo "Pregunta 4: ¡Respuesta correcta!"
        echo "================================"
        echo "¿Sabías qué?"
        echo \ "Con 828 metros, el Burj Khalifa es el edificio más alto del mundo. Equivale a tres veces la Torre Eiffel, 15 veces la"
        echo \ "caída de las Niagara Falls y el doble del Empire State. De hecho, se puede ver a 100 kilómetros de distancia si hace"
        echo \ "un día despejado. Pero por si esto fuera poco, ya hay competidores pisándole los talones."
        echo ""
        ((resco++))
    else
        echo "Pregunta 4: ¡Respuesta incorrecta!"
        echo "La respuesta correcta es la: D. El Burj Khalifa, en Dubai."
        echo "=========================================================="
        echo "¿Sabías qué?"
        echo \ "Con 828 metros, el Burj Khalifa es el edificio más alto del mundo. Equivale a tres veces la Torre Eiffel, 15 veces la"
        echo \ "caída de las Niagara Falls y el doble del Empire State. De hecho, se puede ver a 100 kilómetros de distancia si hace"
        echo \ "un día despejado. Pero por si esto fuera poco, ya hay competidores pisándole los talones."
        echo ""
    fi
    if [ "$res5" == "D" ]
    then
        echo "Pregunta 5: ¡Respuesta correcta!"
        echo "================================"
        echo "¿Sabías qué?"
        echo \ "Adolf Hitler, quien más tarde sería figura máxima del nazismo, fue cabo del ejército alemán durante la “Gran Guerra”."
        echo \ "Rusia fue la nación que se llevó la peor parte a nivel humano, debiendo hacer frente a devastadoras cifras de bajas."
        echo ""
        ((resco++))
    else
        echo "Pregunta 5: ¡Respuesta incorrecta!"
        echo "La respuesta correcta es la: D. Duró 4 años, de 1914 a 1918."
        echo "============================================================"
        echo "¿Sabías qué?"
        echo \ "Adolf Hitler, quien más tarde sería figura máxima del nazismo, fue cabo del ejército alemán durante la “Gran Guerra”."
        echo \ "Rusia fue la nación que se llevó la peor parte a nivel humano, debiendo hacer frente a devastadoras cifras de bajas."
        echo ""
    fi 
    if [ "$res6" == "B" ]
    then
        echo "Pregunta 6: ¡Respuesta correcta!"
        echo "================================"
        echo "¿Sabías qué?"
        echo \ "Uno de los actos que le costaron la guerra a Hitler fue el intentar invadir Rusia, país para el que tenía planes"
        echo \ "bastante siniestros. Pero además, Hitler pretendía asesinar a todos los habitantes de Moscú y crear un lago artificial"
        echo \ "que cubriese toda la superficie de la ciudad."
        echo ""
        ((resco++))
    else
        echo "Pregunta 6: ¡Respuesta incorrecta!"
        echo "La respuesta correcta es la: B. Duró 6 años, de 1939 a 1945."
        echo "============================================================"
        echo "¿Sabías qué?"
        echo \ "Uno de los actos que le costaron la guerra a Hitler fue el intentar invadir Rusia, país para el que tenía planes"
        echo \ "bastante siniestros. Pero además, Hitler pretendía asesinar a todos los habitantes de Moscú y crear un lago artificial"
        echo \ "que cubriese toda la superficie de la ciudad."
        echo ""
    fi 
    if [ "$res7" == "C" ]
    then
        echo "Pregunta 7: ¡Respuesta correcta!"
        echo "================================"
        echo "¿Sabías qué?"
        echo \ "El Pacífico contiene aproximadamente 25 000 islas (más que todos los demás océanos del mundo juntos), casi todas las"
        echo \ "cuales están ubicadas al sur de la línea ecuatorial. Cubre un área de 155 557 000 km². El punto más bajo de la superficie" 
        echo \ "de la corteza terrestre, la fosa de las Marianas, se encuentra en el Pacífico."
        echo ""
        ((resco++))
    else
        echo "Pregunta 7: ¡Respuesta incorrecta!"
        echo "La respuesta correcta es la: C. El océano Pacífico."
        echo "==================================================="
        echo "¿Sabías qué?"
        echo \ "El Pacífico contiene aproximadamente 25 000 islas (más que todos los demás océanos del mundo juntos), casi todas las"
        echo \ "cuales están ubicadas al sur de la línea ecuatorial. Cubre un área de 155 557 000 km². El punto más bajo de la superficie" 
        echo \ "de la corteza terrestre, la fosa de las Marianas, se encuentra en el Pacífico."
        echo ""
    fi 
    if [ "$res8" == "A" ]
    then
        echo "Pregunta 8: ¡Respuesta correcta!"
        echo "================================"
        echo "¿Sabías qué?"
        echo \ "La atmósfera de Júpiter se compone principalmente de hidrógeno y helio, al igual que el Sol. La superficie del planeta está"
        echo \ "cubierta de espesas nubes de color rojo, marrón, amarillo y blanco."
        echo ""
        ((resco++))
    else
        echo "Pregunta 8: ¡Respuesta incorrecta!"
        echo "La respuesta correcta es la: A. Júpiter."
        echo "========================================"
        echo "¿Sabías qué?"
        echo \ "La atmósfera de Júpiter se compone principalmente de hidrógeno y helio, al igual que el Sol. La superficie del planeta está"
        echo \ "cubierta de espesas nubes de color rojo, marrón, amarillo y blanco."
        echo ""
    fi
    if [ "$res9" == "B" ]
    then
        echo "Pregunta 9: ¡Respuesta correcta!"
        echo "================================"
        echo "¿Sabías qué?"
        echo \ "La ballena azul es el animal conocido más grande que jamás haya poblado la Tierra. Estos majestuosos mamíferos marinos"
        echo \ "dominan los océanos con sus 30 metros de longitud y hasta 180 toneladas de peso. Solo su lengua puede pesar tanto como" 
        echo \ "un elefante, y el corazón, como un automóvil."
        echo ""
        ((resco++))
    else
        echo "Pregunta 9: ¡Respuesta incorrecta!"
        echo "La respuesta correcta es la: B. La ballena azul."
        echo "================================================"
        echo "¿Sabías qué?"
        echo \ "La ballena azul es el animal conocido más grande que jamás haya poblado la Tierra. Estos majestuosos mamíferos marinos"
        echo \ "dominan los océanos con sus 30 metros de longitud y hasta 180 toneladas de peso. Solo su lengua puede pesar tanto como" 
        echo \ "un elefante, y el corazón, como un automóvil."
        echo ""
    fi
    if [ "$res10" == "C" ]
    then
        echo "Pregunta 10: ¡Respuesta correcta!"
        echo "================================"
        echo "¿Sabías qué?"
        echo \ "Sabemos que Titán es la luna más grande de los 150 satélites de Saturno, pero también destaca por ser la segunda más"
        echo \ "grande de todas las que podemos encontrar en nuestro sistema solar."
        echo ""
        ((resco++))
    else
        echo "Pregunta 10: ¡Respuesta incorrecta!"
        echo "La respuesta correcta es la: C. Titán."
        echo "======================================"
        echo "¿Sabías qué?"
        echo \ "Sabemos que Titán es la luna más grande de los 150 satélites de Saturno, pero también destaca por ser la segunda más"
        echo \ "grande de todas las que podemos encontrar en nuestro sistema solar."
        echo ""
    fi

    echo "Calculando el porcentaje de aciertos..."
    sleep 5
    respor=$(echo "scale=2; ($resco / 10) * 100" | bc -l)
    echo ""

    echo "Y el resultado es... (redoble de tambores)"
    sleep 3

    echo ""

    if [ ${respor%%.*} -eq 100 ]
    then
        echo "¡Felicidades!, todas sus respuestas fueron correctas"
        echo "Me complace condecorarlo como Gran Sabio"
        echo ""
        echo "Gracias por participar, vuelva pronto..."
    elif [ ${respor%%.*} -lt 100 ] && [ ${respor%%.*} -ge 75 ]
    then
        echo "¡Felicidades!, ha sido condecorado como Gran Sabio"
        echo ""
        echo "Gracias por participar, vuelva pronto..."
    else
        echo "¡Lo sentimos!, no cumplió con el mínimo requerido, por ende, no podemos condecorarle como Gran Sabio"
        echo ""
        echo "Gracias por participar, vuelva pronto..."
    fi

    echo ""
    echo "Las referencias a todas estas curiosidades son:"
    echo \ "[1] https://www.cooperatingvolunteers.com/america/10-datos-curiosos-amazonas/"
    echo \ "[2] https://lostraveleros.com/curiosidades-de-china/"
    echo \ "[3] https://psicologiaymente.com/cultura/curiosidades-el-vaticano"
    echo \ "[4] https://lostraveleros.com/curiosidades-del-burj-khalifa/"
    echo \ "[5] https://www.universia.net/co/actualidad/vida-universitaria/10-curiosidades-escondidas-primera-guerra-mundial-1121292.html"
    echo \ "[6] https://www.la91fm.com/siete-cosas-que-no-sabias-de-la-segunda-guerra-mundial/"
    echo \ "[7] https://es.wikipedia.org/wiki/Oc%C3%A9ano_Pac%C3%ADfico"
    echo \ "[8] https://www.elobservador.com.uy/nota/diez-curiosidades-de-jupiter-20167514570"
    echo \ "[9] https://www.nationalgeographic.es/animales/ballena-azul"
    echo \ "[10] https://www.muycomputer.com/2017/08/27/diez-cosas-interesantes-titan/"

    echo ""
    echo "Saliendo del programa..."
    sleep 5
    exit 0
elif [ $menu -eq 3 ]
then
    clear
    echo "               Bienvenido al medidor de felicidad numérica"
    echo "                     ¿Tú número favorito es feliz?"
    echo ""
    echo "A continuación se le solicitará el número que desee verificar si es feliz o no"
    echo -n "Número a verificar: "
    read num
    let num_feliz=${num}

    echo ""
    echo "Verificando... esto puede tardar un poco..."
    echo ""

    let w=0

    while [ $w -le 50 ]
    do
        cant_cifras=$(echo $num_feliz | wc -L)

        if [ $num_feliz -eq 1 ]
        then
            sleep 3
            echo \ "¡Enhorabuena, el número $num es feliz!"
            echo ""
            echo "Gracias por usar nuestro programa, vuelva pronto..."
            echo ""
            echo "Saliendo..."
            sleep 3
            exit 0
        elif [ "$cant_cifras" != "0" ]
        then
            cadena=${num_feliz}
            let historial=0
            let i=0
            let c=${cant_cifras}

            while [ $c -gt 0 ]
            do
                numcifra=${cadena:$i:1}
                ((i++))

                let cuadrado=$(echo "scale=0; $numcifra * $numcifra" | bc -l)
                let num_feliz=$(echo "scale=0; $historial + $cuadrado" | bc -l)
                let historial=${num_feliz}
                let cuadrado=0

                ((c--))
            done
        fi

        ((w++))

    done

    if [ $num_feliz -ne 1 ]
    then
        echo \ "Lo sentimos, el número $num no es feliz"
        echo ""
        echo "Gracias por usar nuestro programa, vuelva pronto..."
        echo ""
        echo "Saliendo..."
        sleep 3
        exit 0
    fi
elif [ $menu -eq 4 ]
then
    clear
    echo "                          Bienvenido a la calculadora cuadrática"
    echo "Aquí, usted podrá calcular el valor de una variable X dentro de una ecuación de 2do grado"
    echo "   Recordemos que la forma general de una ecuación de segundo grado es: Ax^2+Bx+C=0"
    echo ""
    echo "A continuación, se solicitarán 3 datos equivalentes a las constantes que acompañan a esa variable X"
    echo -n "Por favor, registre el primer dato o dato A: "
    read datoa
    echo -n "Por favor, registre el segundo dato o dato B: "
    read datob
    echo -n "Por favor, registre el tercer dato o dato C: "
    read datoc

    echo ""
    echo "Calculando el discriminante..."
    echo ""
    sleep 5

    if [ "$datoa" != "0" ]
    then
        let discriminante=$(echo "scale=0; ($datob * $datob) - 4 * $datoa * $datoc" | bc -l)
        if [ $discriminante -gt 0 ]
        then
            echo "La raíz tiene dos soluciones reales"
            
            echo ""
            echo "Calculando los valores de x..."
            echo ""
            sleep 5

            raiz=$(echo "scale=5; sqrt($discriminante)" | bc -l)
            res1=$(echo "scale=5; ((-1 * $datob) + $raiz) / (2 * $datoa)" | bc -l)
            res2=$(echo "scale=5; ((-1 * $datob) - $raiz) / (2 * $datoa)" | bc -l)

            echo "El primer valor de x es igual a: $res1"
            echo "El segundo valor de x es igual a: $res2"

            echo ""
            echo "Gracias por usar nuestro programa, vuelva pronto..."
            echo ""
            echo "Saliendo..."
            sleep 3
            exit 0
        elif [ $discriminante -eq 0 ]
        then
            echo "La raíz tiene una solución real"

            echo ""
            echo "Calculando el valor de x..."
            echo ""
            sleep 5

            res=$(echo "scale=5; (-1 * $datob) / (2 * $datoa)" | bc -l)

            echo "El valor de x es: $res"

            echo ""
            echo "Gracias por usar nuestro programa, vuelva pronto..."
            echo ""
            echo "Saliendo..."
            sleep 3
            exit 0
        else
            echo "La raíz tiene solución compleja, por lo tanto, no se puede solucionar"
            echo ""
            echo "Gracias por usar nuestro programa, vuelva pronto..."
            echo ""
            echo "Saliendo..."
            sleep 3
            exit 0
        fi
    else
        echo "No se puede calcular la raíz de la expresión por un error en los datos"
        echo ""
        echo "Gracias por usar nuestro programa, vuelva pronto..."
        echo ""
        echo "Saliendo..."
        sleep 3
        exit 0
    fi
elif [ $menu -eq 5 ]
then
    clear
    echo "                          Bienvenido al capicuinador"
    echo ""
    echo "A continuación, se le solicitará el número que desea verificar si es capicúa o no"
    echo -n "Número a verificar: "
    read num

    echo ""
    echo "Verificando..."
    echo ""
    sleep 5

    let cant_cifras=$(echo $num | wc -L)
    let div=$(echo "scale=0; $cant_cifras / 2" | bc -l)
    resto=$(echo "scale=0; $cant_cifras % 2" | bc -l)

    if [ "$resto" == "0" ]
    then
        val1=${num:0:$div}
        if [ $cant_cifras -gt 3 ]
        then
            let w=0
            let i=${div}
            val2=
            while [ $w -lt $div ]
            do
                val_esp=${num:$i:1}
                ((i++))

                val_fin="$val_esp$val2"
                val2=${val_fin}

                ((w++))
            done
        else
            val2=${num:0:$div}
        fi
    else
        val1=${num:0:$div}
        if [ $cant_cifras -gt 3 ]
        then
            let w=0
            let i=$(echo "scale=0; $div + 1" | bc -l)
            val2=
            while [ $w -lt $div ]
            do
                val_esp=${num:$i:1}
                ((i++))

                val_fin="$val_esp$val2"
                val2=${val_fin}

                ((w++))
            done
        else
            ((div++))
            val2=${num:$div:$div}
        fi
    fi

    if [ "$val1" == "$val2" ]
    then
        echo "El número $num es capicúa"
        echo ""
        echo "Gracias por usar nuestro programa, vuelva pronto..."
        echo ""
        echo "Saliendo..."
        sleep 3
        exit 0
    else
        echo "El número $num no es capicúa"
        echo ""
        echo "Gracias por usar nuestro programa, vuelva pronto..."
        echo ""
        echo "Saliendo..."
        sleep 3
        exit 0
    fi
elif [ $menu -eq 0 ]
then
    echo ""
    echo "Saliendo del programa..."
    sleep 5
    clear
    exit 0
else
    echo ""
    echo "Disculpe, el carácter que colocó no coincide, por favor, vuelva a intentarlo"
    echo ""
    echo "Reiniciando..."
    sleep 2
    bash $0
fi
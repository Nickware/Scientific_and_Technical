# Gas Ideal: Gráfica de Presión vs Temperatura (Fortran 77 + Makefile)

Este es un ejemplo que demuestra cómo usar **Fortran 77** junto con un **Makefile** y **gnuplot** para modelar y visualizar la ley del gas ideal:

\[
P = \frac{nRT}{V}
\]

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
- Creará un script de gnuplot (`plot.gp`)
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
Ver archivo [`LICENSE`](LICENSE) para más detalles.

> Ideal para fines educativos, laboratorios introductorios de física o química, o como ejemplo de integración entre Fortran y herramientas de automatización.

# Introducción a MPI

MPI (Message Passing Interface) es una especificación estándar para la comunicación entre procesos en sistemas paralelos o distribuidos. Se usa para dividir tareas grandes en procesos que se ejecutan simultáneamente y comparten datos entre sí.

[Volver al README principal](../README.md)

## Objetivos de aprendizaje

Al finalizar este módulo, el estudiante podrá:
- entender qué es MPI y para qué sirve.
- preparar una configuración básica de ejecución paralela.
- comprender cómo se comunica un clúster simple.
- ejecutar un trabajo paralelo con `mpirun`.
- relacionar MPI con aplicaciones científicas reales.

## Tabla de contenido

1. [Qué es MPI](#qué-es-mpi)
2. [Requisitos previos](#requisitos-previos)
3. [Preparación de red y nodos](#preparación-de-red-y-nodos)
4. [Configuración de SSH](#configuración-de-ssh)
5. [Configuración de archivos compartidos](#configuración-de-archivos-compartidos)
6. [Instalación de OpenMPI y Quantum ESPRESSO](#instalación-de-openmpi-y-quantum-espresso)
7. [Archivo hostfile y ejecución](#archivo-hostfile-y-ejecución)
8. [Buenas prácticas](#buenas-prácticas)
9. [Validación y verificación](#validación-y-verificación)

## Qué es MPI

MPI permite ejecutar un mismo programa en varios procesos, cada uno con parte del trabajo. Es una base común para la computación científica y la simulación de sistemas complejos.

## Requisitos previos

Antes de usar MPI, es necesario:
- tener varios equipos o al menos varios núcleos disponibles,
- contar con acceso por red,
- tener SSH configurado,
- instalar OpenMPI o una implementación compatible,
- contar con un software de cálculo que soporte paralelismo.

## Preparación de red y nodos

En un pequeño clúster, se suele designar un nodo maestro y varios nodos de cálculo.

Ejemplo de IPs:

```text
nodo1: 10.147.20.10
nodo2: 10.147.20.11
nodo3: 10.147.20.12
nodo4: 10.147.20.13
```

Configuración recomendada en `/etc/hosts`:

```bash
sudo nano /etc/hosts
```

```text
10.147.20.10    nodo1
10.147.20.11    nodo2
10.147.20.12    nodo3
10.147.20.13    nodo4
```

Verificación:

```bash
ping nodo2
```

## Configuración de SSH

SSH es fundamental para que el maestro pueda lanzar procesos en los nodos sin intervención manual.

Generación de claves:

```bash
ssh-keygen -t rsa
ssh-copy-id usuario@nodo2
ssh-copy-id usuario@nodo3
ssh-copy-id usuario@nodo4
```

Verificación:

```bash
ssh nodo2 whoami
ssh nodo3 whoami
ssh nodo4 whoami
```

## Configuración de archivos compartidos

Es útil montar una carpeta común para que todos los nodos accedan al mismo conjunto de archivos.

```bash
sudo apt install sshfs
mkdir ~/qe_work
sshfs usuario@nodo1:/home/usuario/qe_cluster ~/qe_work
```

Esto evita inconsistencias al ejecutar trabajos paralelos.

## Instalación de OpenMPI y Quantum ESPRESSO

Instalación en Ubuntu/Debian:

```bash
sudo apt update
sudo apt install gfortran openmpi-bin openmpi-common libopenmpi-dev libfftw3-dev libblas-dev liblapack-dev
```

Luego se compila Quantum ESPRESSO y se copia el ejecutable a la misma ruta en cada nodo.

## Archivo hostfile y ejecución

Se crea un archivo `machines` con el número de procesos por nodo:

```text
nodo1 slots=14
nodo2 slots=14
nodo3 slots=14
nodo4 slots=14
```

Ejecución de ejemplo:

```bash
mpirun -np 56 --hostfile machines /home/usuario/qe-7.2/bin/pw.x -i pw.in > pw.out
```

Interpretación:
- `mpirun`: lanza la ejecución paralela.
- `-np 56`: número total de procesos.
- `--hostfile machines`: lista de nodos disponibles.
- `pw.x`: ejecutable del cálculo.

## Buenas prácticas

- usa una ruta absoluta para el ejecutable en todos los nodos,
- mantén una carpeta común de trabajo,
- revisa que los nodos responden por nombre y no solo por IP,
- usa un número de procesos acorde con los recursos disponibles,
- documenta la configuración para reproducir la ejecución.

## Validación y verificación

Verificación rápida del entorno:

```bash
mpirun --version
ssh nodo2 whoami
ping nodo2
```

Si estos comandos responden correctamente, la base del clúster está funcionando.

## Solución de problemas comunes

- `Permission denied`: revisar claves SSH y permisos en `~/.ssh`.
- `Could not resolve hostname`: revisar `/etc/hosts`.
- `mpirun: command not found`: verificar instalación de OpenMPI.
- ejecución lenta o desbalanceada: revisar número de slots y capacidades de cada nodo.

## Reproducibilidad

MPI se usa especialmente en simulación científica, donde un cálculo puede necesitar miles de procesos y varias horas de ejecución. La clave es documentar exactamente cómo se configuró el sistema y cómo se lanzó el trabajo para poder repetirlo.

## Siguientes pasos

- revisar [introduction_to_ssh/README.md](../introduction_to_ssh/README.md)
- revisar [essentials/README.md](../essentials/README.md)
- revisar [introduction_makefile/README.md](../introduction_makefile/README.md)

---

Este módulo conecta infraestructura, paralelismo y cálculo científico, y es una de las bases más importantes para ejecutar simulaciones de alto costo computacional.


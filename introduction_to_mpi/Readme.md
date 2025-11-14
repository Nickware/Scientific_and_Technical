# Clúster de cálculo paralelo con Quantum ESPRESSO (QE). 

Se tiene una configuración potente y perfectamente adecuada para crear un clúster de cálculo paralelo con Quantum ESPRESSO (QE). Al unir los 4 equipos, puede ejecutar cálculos que se distribuyan entre todos los procesadores (20 núcleos + 16 hilos de eficiencia por i5-14500, lo que hace un total de 144 hilos de procesamiento).

Aquí se presenta una guía paso a paso para configurar su "mini-clúster" casero.

### Visión General del Proceso

El objetivo es que un equipo actúe como **"Maestro"** (desde donde se envían los trabajos) y los cuatro (incluyendo al maestro) actúen como **"Nodos de Cálculo"**. Utilizaremos `MPI (Message Passing Interface)` para la comunicación entre nodos y un sistema de archivos compartido (via `SSH`) para que todos los nodos accedan a los mismos archivos de pseudopotenciales y de entrada.

---

### Paso 1: Preparación Básica de la Red y los Equipos

#### 1.1. Configuración de Red Zerotier
Asegúrese de que los 4 equipos están en la misma red Zerotier y pueden **hacer ping entre sí usando sus direcciones IP de Zerotier**.
*   En cada terminal, ejecute `ip addr show zt0` (o el nombre de la interfaz que Zerotier haya creado) para ver la IP.
*   Anote las IPs de cada máquina. Para este ejemplo, usaremos:
    *   **Nodo1 (Maestro):** `10.147.20.10`
    *   **Nodo2:** `10.147.20.11`
    *   **Nodo3:** `10.147.20.12`
    *   **Nodo4:** `10.147.20.13`

#### 1.2. Configurar los Nombres de Host (Recomendado)
Edite el archivo `/etc/hosts` en **cada uno de los 4 equipos** y añada las siguientes líneas:
```bash
sudo nano /etc/hosts
```
Añada:
```
10.147.20.10    nodo1
10.147.20.11    nodo2
10.147.20.12    nodo3
10.147.20.13    nodo4
```
Ahora, verifique que puede hacer ping usando los nombres:
```bash
ping nodo2
```

#### 1.3. Crear un Usuario Común y Configurar SSH sin Contraseña
**Esto es crucial para que MPI funcione sin problemas.**

*   **Crear usuario (Opcional, pero recomendable):** Cree un usuario idéntico (ej: `qeuser`) con la misma contraseña en los 4 equipos. O, simplemente, use su usuario actual si es el mismo en todos.
*   **Generar claves SSH en el Maestro (nodo1):**
    
    ```bash
    ssh-keygen -t rsa  # Presione Enter para todas las preguntas.
    ```
*   **Copiar la clave pública a todos los nodos (incluído él mismo):**
    
    ```bash
    ssh-copy-id usuario@nodo1
    ssh-copy-id usuario@nodo2
    ssh-copy-id usuario@nodo3
    ssh-copy-id usuario@nodo4
    ```
    Reemplace `usuario` por su nombre de usuario real.
*   **Verifique** que puede conectarse desde `nodo1` a cualquiera de los otros (y a sí mismo) via SSH sin que le pida contraseña:
    
    ```bash
    ssh nodo2 whoami
    ssh nodo3 whoami
    ssh nodo4 whoami
    ```

---

### Paso 2: Configurar un Entorno de Archivos Compartido

Para que QE funcione, todos los nodos necesitan acceso a los mismos archivos de entrada (`*.in`) y pseudopotenciales. La forma más simple es montar una carpeta del maestro en los nodos esclavos usando `SSHFS`.

#### 2.1. Instalar SSHFS en todos los nodos
```bash
sudo apt update
sudo apt install sshfs
```

#### 2.2. Crear una Carpeta de Trabajo en el Maestro
En `nodo1` (el maestro), cree una carpeta que será el directorio de trabajo principal, por ejemplo: `/home/usuario/qe_cluster`.

#### 2.3. Montar la Carpeta del Maestro en los Esclavos
En **nodo2, nodo3 y nodo4**, cree una carpeta y monte la carpeta del maestro.
```bash
# En nodo2, nodo3 y nodo4:
mkdir ~/qe_work
sshfs usuario@nodo1:/home/usuario/qe_cluster ~/qe_work
```
**Nota:** Este montaje se pierde al reiniciar. Para hacerlo permanente, puede añadirlo a `/etc/fstab` pero es más complejo. Por ahora, con que lo monte manualmente es suficiente.

Ahora, cualquier archivo que ponga en `/home/usuario/qe_cluster` en `nodo1` será visible en `~/qe_work` en los otros nodos.

---

### Paso 3: Configurar Quantum ESPRESSO para Ejecución en Paralelo

#### 3.1. Instalar las Herramientas de Desarrollador y MPI
En **los 4 equipos**, instale los compiladores y bibliotecas necesarias:
```bash
sudo apt update
sudo apt install gfortran openmpi-bin openmpi-common libopenmpi-dev libfftw3-dev libblas-dev liblapack-dev
```

#### 3.2. Compilar Quantum ESPRESSO
Solo necesita compilar en **uno de los equipos** (por ejemplo, en `nodo1`) y luego copiar el ejecutable a los demás.

1.  Descargue el código fuente de Quantum ESPRESSO desde su web oficial.
2.  Descomprímalo y acceda a la carpeta.
3.  Configure y compile. Un ejemplo de configuración:
    ```bash
    ./configure MPIF90=mpif90 FFLAGS="-O2 -fallow-argument-mismatch" --with-scalapack=no
    ```
    (Nota: `--with-scalapack=no` simplifica la compilación. Puede intentar con Scalapack después).
4.  Compile todos los códigos:
    ```bash
    make pw
    make ph
    make pp
    # ... etc., para los códigos que necesite.
    ```
5.  Una vez compilado, tendrá los ejecutables en la carpeta `bin` (e.g., `pw.x`, `ph.x`).

#### 3.3. Distribuir los Ejecutables
Copie la carpeta `bin/` completa de QE (desde `nodo1`) a la **misma ruta absoluta** en los otros 3 nodos. Por ejemplo, si en `nodo1` está en `/home/usuario/qe-7.2/bin`, créela y copie los archivos en esa misma ruta en `nodo2`, `nodo3` y `nodo4`.

Esto es importante porque MPI espera encontrar el ejecutable en la misma ruta en todos los nodos.

---

### Paso 4: Crear un Archivo "Machines" para MPI

En el maestro (`nodo1`), en su carpeta de trabajo `/home/usuario/qe_cluster`, cree un archivo llamado `machines`. Este archivo le dice a MPI qué nodos usar y cuántos procesos puede lanzar en cada uno.

Dado que su i5-14500 tiene 6 núcleos "P-Cores" y 8 "E-Cores" (14 núcleos físicos, 20 hilos con Hyper-Threading), un buen punto de partida es usar todos los núcleos físicos. Puede experimentar después.

Contenido del archivo `machines`:
```
nodo1 slots=14
nodo2 slots=14
nodo3 slots=14
nodo4 slots=14
```
Esto le dice a MPI que lance 14 procesos en cada nodo (usando los 14 núcleos físicos). Si quiere ser más agresivo y usar los hilos lógicos, puede poner `slots=20`.

---

### Paso 5: Ejecutar un Cálculo

¡Todo está listo! Vaya a su carpeta de trabajo compartida en el maestro (`/home/usuario/qe_cluster`) y prepare su archivo de entrada `pw.in`.

Para ejecutar `pw.x` usando los 4 equipos, use el siguiente comando:

```bash
mpirun -np 56 --hostfile machines /home/usuario/qe-7.2/bin/pw.x -i pw.in > pw.out
```

**Explicación:**

*   `mpirun`: El comando para lanzar trabajos MPI.
*   `-np 56`: Número total de procesos. Como tenemos 4 nodos con 14 `slots` cada uno, 4*14=56.
*   `--hostfile machines`: Indica el archivo con la lista de nodos.
*   `/home/usuario/qe-7.2/bin/pw.x`: La **ruta absoluta e idéntica** al ejecutable en todos los nodos.
*   `-i pw.in > pw.out`: Opciones estándar de QE para leer la entrada y redirigir la salida.

### Resumen y Verificación

1.  **Red:** Zerotier funcionando, `ping` entre nodos por nombre.
2.  **SSH:** Conexión sin contraseña del maestro a todos los nodos.
3.  **Archivos:** Carpeta de trabajo del maestro montada en los esclavos (SSHFS).
4.  **Software:** MPI y QE instalados y compilados, ejecutables en la misma ruta en todos los nodos.
5.  **Configuración:** Archivo `machines` listo en el directorio de trabajo.

Con esta configuración, se busca haber creado un clúster homogéneo muy capaz que le permitirá reducir drásticamente los tiempos de cálculo de Quantum ESPRESSO. 

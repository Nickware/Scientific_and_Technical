# Guía paso a paso para instalar essencials en entorno Científico

Guía paso a paso dejar listo un sistema en **Deepin 25** (y otras distros), asegurando que se pueda compilar desde el kernel hasta librerías como Geant4 o ROOT. 

---

### 1. Deepin 25 / Debian / Ubuntu (Familia `.deb`)
Deepin 25 se basa en Debian, por lo que utiliza el gestor `apt`.

1.  **Actualizar los repositorios:**
    
    ```bash
    sudo apt update && sudo apt upgrade
    ```
2.  **Instalar el "meta-paquete" de compilación y CMake:**
    
    ```bash
    sudo apt install build-essential cmake g++ gfortran git
    ```
    *`gfortran` es vital para librerías de física antiguas que aún usan Fortran.*
3.  **Librerías de soporte científico (Recomendado):**
    
    ```bash
    sudo apt install libx11-dev libxpm-dev libxft-dev libxext-dev libssl-dev
    ```

---

### 2. Arch Linux (Familia `pacman`)
En Arch, el proceso es más directo pero requiere un grupo de paquetes específico.

1.  **Instala el grupo base-devel:**
    
    ```bash
    sudo pacman -Syu base-devel cmake git gcc-fortran
    ```
    *En Arch, `base-devel` incluye todo lo necesario (make, gcc, patch, etc.).*
2.  **Configuración de optimización (Opcional pero recomendado):**
    Editar `/etc/makepkg.conf` y busca la línea `MAKEFLAGS="-j$(nproc)"`. Esto hará que todas tus compilaciones usen todos los núcleos de tu procesador automáticamente.

---

### 3. Fedora (Familia `dnf`)
Fedora utilizar "grupos de herramientas" para facilitar la vida.

1.  **Instalar herramientas de desarrollo:**
    
    ```bash
    sudo dnf groupinstall "Development Tools" "C Development Tools and Libraries"
    ```
2.  **Instalar CMake y Fortran:**
    
    ```bash
    sudo dnf install cmake gcc-gfortran
    ```

---

### 4. openSUSE (Tumbleweed o Leap)
Utilizar el gestor `zypper` y el concepto de "patterns".

1.  **Instalar el patrón de desarrollo:**
    
    ```bash
    sudo zypper install -t pattern devel_basis devel_C_C++
    ```
2.  **Instalar CMake:**
    
    ```bash
    sudo zypper install cmake
    ```

---

### 5. Slackware (La vieja escuela)
La instalación en Slackware, el enfoque es distinto:

1.  **Durante la instalación:** Seleccionar las series de paquetes **D** (Development) y **L** (Libraries).
2.  **Si ya está instalado:** Slackware suele venir con todo el toolchain (GCC, make) por defecto si elegiste la instalación completa. Para actualizar CMake, podrías necesitar usar [SlackBuilds](https://slackbuilds.org/).

---

### 6. Verificación del entorno (Universal)
Una vez instalado, verificar que las versiones sean correctas ejecutando:
```bash
gcc --version
g++ --version
cmake --version
```

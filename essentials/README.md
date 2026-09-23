# Essentials para entornos científicos

Este módulo prepara el entorno base para desarrollar software científico y ejecutar herramientas de escritorio, compilación y análisis en sistemas Linux o Unix-like.

[Volver al README principal](../README.md)

## Objetivos de aprendizaje

Al finalizar este módulo, el estudiante podrá:
- instalar herramientas básicas de desarrollo científico,
- trabajar con compiladores y CMake,
- preparar un entorno reproducible para proyectos técnicos,
- y validar que el sistema está listo para ejecutar software científico.

## Tabla de contenido

1. [Qué incluye Essentials](#qué-incluye-essentials)
2. [Ubuntu/Debian](#ubuntudebian)
3. [Arch Linux](#arch-linux)
4. [Fedora](#fedora)
5. [openSUSE](#opensuse)
6. [Slackware](#slackware)
7. [Buenas prácticas](#buenas-prácticas)
8. [Validación y verificación](#validación-y-verificación)

## Qué incluye Essentials

La idea central es dejar instalado lo mínimo necesario para trabajar con compiladores, librerías y herramientas de ciencia y desarrollo:

- `gcc`, `g++`, `gfortran`
- `make`, `cmake`, `git`
- librerías de gráficos y soporte de sistema
- entorno para proyectos científicos y de código

## Ubuntu/Debian

```bash
sudo apt update && sudo apt upgrade
sudo apt install build-essential cmake g++ gfortran git libx11-dev libxpm-dev libxft-dev libxext-dev libssl-dev
```

## Arch Linux

```bash
sudo pacman -Syu base-devel cmake git gcc-fortran
```

Opcionalmente ajustar `MAKEFLAGS` en `/etc/makepkg.conf` para usar todos los núcleos.

## Fedora

```bash
sudo dnf groupinstall "Development Tools" "C Development Tools and Libraries"
sudo dnf install cmake gcc-gfortran
```

## openSUSE

```bash
sudo zypper install -t pattern devel_basis devel_C_C++
sudo zypper install cmake
```

## Slackware

Durante la instalación seleccionar los grupos **D** y **L**. Si ya está instalado, revisar el paquete `cmake` y el toolchain base.

## Buenas prácticas

- instala primero el toolchain base,
- verifica compiladores antes de avanzar,
- usa paquetes específicos según la distro,
- mantén el sistema actualizado,
- documenta la instalación para reproducir la configuración.

## Validación y verificación

```bash
gcc --version
g++ --version
gfortran --version
cmake --version
make --version
```

Si estos comandos responden sin errores, el entorno está listo para los siguientes módulos.

## Solución de problemas comunes

- `command not found`: revisar si el paquete fue instalado correctamente.
- errores de compilación con Fortran: revisar `gfortran` y librerías del sistema.
- problemas de CMake: verificar que el compilador está disponible y que no hay conflicto de paquetes.

## Reproducibilidad

Un entorno bien configurado es la base para que todos los módulos del repositorio funcionen con consistencia. Esto incluye herramientas de compilación, acceso remoto y visualización científica.

## Siguientes pasos

- revisar [introduction_to_bash/README.md](../introduction_to_bash/README.md)
- revisar [introduction_makefile/README.md](../introduction_makefile/README.md)
- revisar [introduction_to_ssh/README.md](../introduction_to_ssh/README.md)

---

Este módulo es la base del stack científico: sin un entorno bien preparado, no es posible avanzar de forma fiable en compilación, cálculo ni visualización.


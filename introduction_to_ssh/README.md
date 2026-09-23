# Introducción a SSH

SSH (Secure Shell) es un protocolo para acceder de forma segura a equipos remotos a través de una red. Es esencial en administración de servidores, clústeres y trabajo distribuido.

[Volver al README principal](../README.md)

## Objetivos de aprendizaje

Al finalizar este módulo, el estudiante podrá:
- entender qué es SSH y para qué sirve.
- instalar cliente y servidor SSH.
- generar y usar claves públicas/privadas.
- configurar acceso sin contraseña.
- aplicarlo en un entorno de cálculo distribuido.

## Tabla de contenido

1. [Qué es SSH](#qué-es-ssh)
2. [Requisitos previos](#requisitos-previos)
3. [Instalación del servidor y cliente](#instalación-del-servidor-y-cliente)
4. [Generar claves](#generar-claves)
5. [Copiar clave pública](#copiar-clave-pública)
6. [Verificar acceso sin contraseña](#verificar-acceso-sin-contraseña)
7. [Configuración avanzada](#configuración-avanzada)
8. [Buenas prácticas](#buenas-prácticas)
9. [Validación y verificación](#validación-y-verificación)

## Qué es SSH

SSH permite conectarse a otra máquina como si se estuviera dentro de una terminal local, pero con cifrado y autenticación segura.

Se usa para:
- administrar servidores,
- ejecutar programas en computadoras remotas,
- acceder a nodos de cómputo,
- y automatizar tareas en infraestructura distribuida.

## Requisitos previos

Necesitas:
- un equipo cliente,
- un equipo servidor o remoto,
- acceso a la red,
- permisos para instalar paquetes,
- y una identificación del usuario remoto.

## Instalación del servidor y cliente

Ubuntu/Debian:

```bash
sudo apt update
sudo apt install openssh-server openssh-client -y
```

Verificar servicio:

```bash
sudo systemctl status ssh
```

## Generar claves

En el cliente:

```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
ls -la ~/.ssh/
```

Esto genera clave privada y pública.

## Copiar clave pública

```bash
ssh-copy-id -i ~/.ssh/id_rsa.pub usuario@ip_servidor
```

También puede hacerse manualmente añadiendo la clave a `~/.ssh/authorized_keys`.

## Verificar acceso sin contraseña

```bash
ssh usuario@ip_servidor
```

Si la conexión se abre sin pedir contraseña, la configuración funcionó.

## Configuración avanzada

Archivo `~/.ssh/config`:

```text
Host servidor1
    HostName 192.168.1.100
    User juan
    IdentityFile ~/.ssh/id_rsa
    Port 22
```

Esto permite acceder con:

```bash
ssh servidor1
```

## Buenas prácticas

- nunca compartas la clave privada,
- usa autenticación por claves en lugar de contraseñas,
- deshabilita acceso por contraseña solo después de verificar que todo funciona,
- revisa permisos de `~/.ssh` y `authorized_keys`,
- usa usuarios con privilegios mínimos por seguridad.

## Validación y verificación

Comandos útiles:

```bash
ssh -V
ssh usuario@ip_servidor "whoami"
ssh usuario@ip_servidor "ls -la ~/.ssh"
```

Si los comandos responden y no piden contraseña, la configuración está correcta.

## Solución de problemas comunes

- `Permission denied`: revisa permisos en la carpeta `.ssh` y clave pública.
- `No route to host`: revisa red y firewall.
- `Connection refused`: revisa que el servicio SSH esté activo.

## Reproducibilidad

SSH es un pilar para trabajo distribuido y automatización. La seguridad y la repetibilidad de la conexión permiten ejecutar tareas remotas sin intervención manual, algo clave en clústeres y entornos científicos.

## Siguientes pasos

- revisar [introduction_to_mpi/README.md](../introduction_to_mpi/README.md)
- revisar [essentials/README.md](../essentials/README.md)
- revisar [introduction_makefile/README.md](../introduction_makefile/README.md)

---

Este módulo es el puente para trabajar con máquinas remotas y coordinar tareas en entornos distribuidos.


1. Verificar que el servidor SSH está corriendo:
```bash
# En el servidor:
sudo systemctl status sshd

# Si no está corriendo:
sudo systemctl start sshd
```

2. Verificar que SSH escucha en el puerto 22:
```bash
# En el servidor:
sudo netstat -tuln | grep :22
# o
sudo ss -tuln | grep :22
# Debe mostrar: tcp  0  0  0.0.0.0:22  0.0.0.0:*  LISTEN
```

3. Verificar conectividad de red:
```bash
# Desde el cliente, probar si el host es alcanzable:
ping ip_servidor

# Probar específicamente el puerto 22:
telnet ip_servidor 22
# o
nc -zv ip_servidor 22
```

4. Verificar firewall (bloquea puerto 22):
```bash
# En el servidor, si usa firewall:
# Para UFW (Ubuntu):
sudo ufw status
sudo ufw allow 22/tcp

# Para firewalld (CentOS/RHEL):
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload

# Para iptables:
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
```

5. Verificar IP/hostname correcta:
```bash
# Desde el cliente, verificar que la IP es correcta:
ssh -v usuario@ip_servidor_correcta

# Si usas hostname, verificar que resuelve:
nslookup hostname_servidor
# o
ping hostname_servidor
```

### Error de permisos:
```bash
# En el cliente:
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa ~/.ssh/id_rsa.pub

# En el servidor:
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

### Probar conexión en modo verbose:
```bash
ssh -vvv usuario@ip_servidor
```

### Reiniciar servicio SSH:
```bash
# En el servidor:
sudo systemctl restart sshd
```

---

##  VERIFICACIÓN FINAL

### Comandos para probar:
```bash
# Desde el cliente, debe conectar sin contraseña:
ssh usuario@ip_servidor

# Ejecutar comando remoto sin contraseña:
ssh usuario@ip_servidor "hostname && whoami"
```

---

## RESUMEN DEL PROCESO
1. Instalar SSH en servidor y cliente
2. Generar claves SSH en el cliente
3. Copiar clave pública al servidor
4. Verificar conexión sin contraseña
5. Opcional: Deshabilitar autenticación por contraseña

¡Con esto se debería tener un SSH configurado para ingresar sin contraseña! 

# SSH en Visual Studio Code

Para sacarle provecho a SSH en Visual Studio Code, existen principalmente dos enfoques: trabajar directamente en el servidor (como si fuera tu máquina local) o sincronizar archivos (editar local y subir a remoto).

Aquí hay algunas de las mejores extensiones clasificadas por su uso:

### 1. La opción oficial y superior (Entorno Remoto)

Si el objetivo es programar, depurar y ejecutar comandos directamente en el servidor sin preocuparse por sincronizar archivos, esto es lo único que necesita.

* [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) (de Microsoft)
* Por qué es la mejor: No sincroniza archivos; *abre el servidor* dentro de tu VS Code. Las extensiones que instale (como Python, C++, Docker) se ejecutarán en el servidor, no en tu PC. Es como si el servidor fuera tu computadora local.
* Ideal para: Desarrolladores que necesitan un entorno de desarrollo completo y potente en una máquina remota.



---

### 2. Opciones de Sincronización (SFTP/FTP)

Si prefiere editar archivos localmente y que se suban automáticamente al servidor cada vez que guarde, estas son las mejores alternativas:

* [SFTP](https://marketplace.visualstudio.com/items?itemName=Natizyskunk.sftp) (mantenida por Natizyskunk)
* Por qué destaca: Es el fork más confiable y actualizado de la clásica extensión SFTP. Es excelente para flujos de trabajo donde prefieres mantener el código en tu máquina local y desplegarlo en un servidor (ej. un servidor web de pruebas).
* Ideal para: Edición rápida de sitios web o aplicaciones sencillas donde el código fuente vive en tu equipo.


* [SSH FS](https://www.google.com/search?q=https://marketplace.visualstudio.com/items%3FitemName%3DKelvinSchoofs.vscode-sshfs)
* Por qué destaca: Montar directorios remotos como si fueran carpetas locales en tu explorador de archivos. Ofrece una experiencia más nativa y fluida que otras opciones de sincronización, ya que trata el sistema de archivos remoto como parte de tu espacio de trabajo.



---

### Tabla de Comparación Rápida

| Extensión | Enfoque | ¿Cómo funciona? |
| --- | --- | --- |
| Remote - SSH | Desarrollo Remoto | El servidor se "convierte" en tu entorno local. |
| SFTP | Sincronización | Editas local, se sube al guardar. |
| SSH FS | Montaje de archivos | Acceso directo a archivos remotos como si fueran locales. |

### Recomendación

Si tiene una conexión a internet estable, instalar `Remote - SSH`. 

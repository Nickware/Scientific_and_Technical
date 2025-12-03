# **Guía Completa: Instalación y Configuración SSH (Sin Password)**

Paso a paso completo desde la instalación hasta la configuración de SSH sin contraseña.

---

## **PASO 1: INSTALACIÓN DEL SERVIDOR SSH**

### **En el equipo servidor (destino):**

#### **Para Ubuntu/Debian:**
```bash
# Actualizar sistema
sudo apt update && sudo apt upgrade -y

# Instalar servidor SSH
sudo apt install openssh-server -y

# Verificar que el servicio esté activo
sudo systemctl status ssh
sudo systemctl enable ssh  # Para que inicie automáticamente
```

#### **Para CentOS/RHEL/Fedora:**
```bash
# Instalar servidor SSH
sudo yum install openssh-server -y
# o en versiones nuevas:
sudo dnf install openssh-server -y

# Iniciar y habilitar el servicio
sudo systemctl start sshd
sudo systemctl enable sshd
sudo systemctl status sshd
```

#### **Verificar instalación:**
```bash
# Verificar que SSH está escuchando en puerto 22
sudo netstat -tuln | grep 22
# Debe mostrar: tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN
```

---

## **PASO 2: INSTALACIÓN DEL CLIENTE SSH**

### **En el equipo cliente (desde donde te conectarás):**

#### **Para Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install openssh-client -y
```

#### **Para CentOS/RHEL/Fedora:**
```bash
sudo yum install openssh-clients -y
# o
sudo dnf install openssh-clients -y
```

#### **Verificar instalación:**
```bash
ssh -V
# Debe mostrar: OpenSSH_versión...
```

---

##  **PASO 3: CONFIGURACIÓN BÁSICA DEL SERVIDOR SSH**

### **En el servidor, editar configuración:**
```bash
sudo nano /etc/ssh/sshd_config
```

#### **Configuración recomendada:**
```plaintext
# Habilitar autenticación por clave
PubkeyAuthentication yes

# Permitir autenticación por contraseña (inicialmente)
PasswordAuthentication yes

# Opciones de seguridad
PermitRootLogin no
X11Forwarding no
MaxAuthTries 3
ClientAliveInterval 300
ClientAliveCountMax 2
```

#### **Reiniciar servicio SSH:**
```bash
sudo systemctl restart sshd
```

---

## **PASO 4: GENERAR CLAVES SSH EN EL CLIENTE**

### **En el equipo cliente:**
```bash
# Generar par de claves RSA (sin passphrase)
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""

# Verificar que se crearon las claves
ls -la ~/.ssh/
# Debería ver: id_rsa (clave privada) y id_rsa.pub (clave pública)
```

---

##  **PASO 5: COPIAR CLAVE PÚBLICA AL SERVIDOR**

### **Método 1: Usar ssh-copy-id (Recomendado)**
```bash
# Reemplaza "usuario" y "ip_servidor" con tus datos reales
ssh-copy-id -i ~/.ssh/id_rsa.pub usuario@ip_servidor

# Ejemplo:
ssh-copy-id -i ~/.ssh/id_rsa.pub juan@192.168.1.100
```

### **Método 2: Manual (si ssh-copy-id no funciona)**
```bash
# Copiar contenido de la clave pública
cat ~/.ssh/id_rsa.pub

# En el servidor, pegar este contenido en:
mkdir -p ~/.ssh
chmod 700 ~/.ssh
nano ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

---

##  **PASO 6: VERIFICAR CONEXIÓN SIN CONTRASEÑA**

### **Desde el cliente, probar conexión:**
```bash
ssh usuario@ip_servidor
# Debe conectarse SIN pedir contraseña
```

### **Si pide contraseña, verificar:**
```bash
# Verificar permisos en el servidor
ssh usuario@ip_servidor "chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys"

# Verificar que la clave esté en authorized_keys
ssh usuario@ip_servidor "cat ~/.ssh/authorized_keys"
```

---

##  **PASO 7: CONFIGURACIÓN AVANZADA (OPCIONAL)**

### **Crear archivo de configuración SSH en cliente:**
```bash
nano ~/.ssh/config
```

#### **Agregar configuración:**
```plaintext
Host servidor1
    HostName 192.168.1.100
    User juan
    IdentityFile ~/.ssh/id_rsa
    Port 22

Host servidor2
    HostName 192.168.1.101
    User maria
    IdentityFile ~/.ssh/id_rsa
    Port 22
```

#### **Ahora puedes conectarte con:**
```bash
ssh servidor1  # En lugar de ssh juan@192.168.1.100
ssh servidor2  # En lugar de ssh maria@192.168.1.101
```

---

##  **PASO 8: DESHABILITAR ACCESO POR CONTRASEÑA (SEGURIDAD)**

### ** SOLO después de verificar que las claves SSH funcionan:**

#### **En el servidor, editar configuración:**
```bash
sudo nano /etc/ssh/sshd_config
```

#### **Cambiar estas líneas:**
```plaintext
PasswordAuthentication no
ChallengeResponseAuthentication no
UsePAM no
```

#### **Reiniciar servicio SSH:**
```bash
sudo systemctl restart sshd
```

---

##  **PASO 9: SCRIPT AUTOMATIZADO**

### **Script para configurar múltiples servidores:**

#### **Crear archivo `servers.txt`:**
```plaintext
usuario1@192.168.1.100
usuario2@192.168.1.101
usuario3@192.168.1.102
```

#### **Script `configurar_ssh.sh`:**
```bash
#!/bin/bash

# Generar clave SSH si no existe
if [ ! -f ~/.ssh/id_rsa ]; then
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
fi

# Configurar cada servidor
while IFS= read -r servidor; do
    echo "=== Configurando $servidor ==="
    
    # Copiar clave pública
    ssh-copy-id -i ~/.ssh/id_rsa.pub "$servidor"
    
    # Verificar conexión
    ssh "$servidor" "echo '✓ Conexión SSH sin contraseña exitosa'"
    
    echo "=== $servidor configurado ==="
    echo
done < servers.txt

echo "Todos los servidores configurados"
```

#### **Hacer ejecutable y ejecutar:**
```bash
chmod +x configurar_ssh.sh
./configurar_ssh.sh
```

---

## **SOLUCIÓN DE PROBLEMAS COMUNES**

### **Error de permisos:**
```bash
# En el cliente:
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa ~/.ssh/id_rsa.pub

# En el servidor:
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

### **Probar conexión en modo verbose:**
```bash
ssh -vvv usuario@ip_servidor
```

### **Reiniciar servicio SSH:**
```bash
# En el servidor:
sudo systemctl restart sshd
```

---

##  **VERIFICACIÓN FINAL**

### **Comandos para probar:**
```bash
# Desde el cliente, debe conectar sin contraseña:
ssh usuario@ip_servidor

# Ejecutar comando remoto sin contraseña:
ssh usuario@ip_servidor "hostname && whoami"
```

---

## **RESUMEN DEL PROCESO**
1. **Instalar SSH** en servidor y cliente
2. **Generar claves** SSH en el cliente
3. **Copiar clave pública** al servidor
4. **Verificar** conexión sin contraseña
5. **Opcional**: Deshabilitar autenticación por contraseña

¡Con esto se debería tener un SSH configurado para ingresar sin contraseña! 

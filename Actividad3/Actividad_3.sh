#!/bin/bash

# Parte 1: Gestión de Usuarios

# 1. Creación de Usuarios
# Creamos tres usuarios llamados usuario1, usuario2 y usuario3
sudo useradd usuario1
sudo useradd usuario2
sudo useradd usuario3

# 2. Asignación de Contraseñas
# Establecemos nuevas contraseñas para cada usuario creado
echo "usuario1:contraseña1" | sudo chpasswd
echo "usuario2:contraseña2" | sudo chpasswd
echo "usuario3:contraseña3" | sudo chpasswd

# 3. Información de Usuarios
# Mostramos la información de usuario1 usando el comando id
id usuario1

# 4. Eliminación de Usuarios
# Eliminamos usuario3, pero conservamos su directorio principal
sudo userdel usuario3
sudo mkdir -p /home/usuario3

# Parte 2: Gestión de Grupos

# 1. Creación de Grupos
# Creamos dos grupos llamados grupo1 y grupo2
sudo groupadd grupo1
sudo groupadd grupo2

# 2. Agregar Usuarios a Grupos
# Agregamos usuario1 a grupo1 y usuario2 a grupo2
sudo usermod -aG grupo1 usuario1
sudo usermod -aG grupo2 usuario2

# 3. Verificar Membresía
# Verificamos que los usuarios han sido agregados a los grupos utilizando el comando groups
groups usuario1
groups usuario2

# 4. Eliminar Grupo
# Eliminamos grupo2
sudo groupdel grupo2

# Parte 3: Gestión de Permisos

# 1. Creación de Archivos y Directorios
# Como usuario1, creamos un archivo llamado archivo1.txt en su directorio principal y escribimos algo en él.
# Creamos un directorio llamado directorio1 y dentro de ese directorio, un archivo llamado archivo2.txt.
sudo -u usuario1 bash -c 'touch ~/archivo1.txt && echo "Contenido del archivo1" > ~/archivo1.txt'
sudo -u usuario1 bash -c 'mkdir ~/directorio1 && touch ~/directorio1/archivo2.txt && echo "Contenido del archivo2" > ~/directorio1/archivo2.txt'

# 2. Verificar Permisos
# Verificamos los permisos del archivo y directorio usando el comando ls -l y ls -ld respectivamente.
sudo -u usuario1 bash -c 'ls -l ~/archivo1.txt'
sudo -u usuario1 bash -c 'ls -ld ~/directorio1'

# 3. Modificar Permisos usando chmod con Modo Numérico
# Cambiamos los permisos del archivo1.txt para que sólo usuario1 pueda leer y escribir (permisos rw-), el grupo pueda leer (permisos r--) y nadie más pueda hacer nada.
sudo -u usuario1 bash -c 'chmod 640 ~/archivo1.txt'

# 4. Modificar Permisos usando chmod con Modo Simbólico
# Agregamos permiso de ejecución al propietario del archivo2.txt.
sudo -u usuario1 bash -c 'chmod u+x ~/directorio1/archivo2.txt'

# 5. Cambiar el Grupo Propietario
# Cambiamos el grupo propietario de archivo2.txt a grupo1.
sudo chown :grupo1 /home/usuario1/directorio1/archivo2.txt

# 6. Configurar Permisos de Directorio
# Cambiamos los permisos del directorio1 para que sólo el propietario pueda entrar (permisos rwx), el grupo pueda listar contenidos pero no entrar (permisos r--), y otros no puedan hacer nada.
sudo -u usuario1 bash -c 'chmod 740 ~/directorio1'

# 7. Comprobación de Acceso
# Intentamos acceder al archivo1.txt y directorio1/archivo2.txt como usuario2.
sudo -u usuario2 bash -c 'cat /home/usuario1/archivo1.txt'
sudo -u usuario2 bash -c 'cat /home/usuario1/directorio1/archivo2.txt'

# 8. Verificación Final
# Verificamos los permisos y propietario de los archivos y directorio nuevamente con ls -l y ls -ld.
sudo -u usuario1 bash -c 'ls -l ~/archivo1.txt'
sudo -u usuario1 bash -c 'ls -ld ~/directorio1'

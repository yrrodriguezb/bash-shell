# Comandos Linux


sudo = super user do = Hacer algo como super usuario


## Comandos de permisos en archivos

1. chmod => Modificar permisos sobre un archivo
        u = user
        g = group
        o = other
        a = all

        Ejemplo

        chmod a=rwx file
        chmod ug=rwx file
        chmod o=w

        chmod a+x file
        chmod g-w file

        chmod +x file # Aplica el permiso de ejeucion a todos


        Formato octal 0-7
        r = 4
        w = 2
        x = 1

        # owner = rwx, group=none, other=none
        chmod 700 file 
        
        # owner = rwx, group=rx, other=rx
        chmod 755 file

        # owner = rwx, group=rx, other=r
        chmod 754 file


2. chown => Modificar propietario

        Ejemplo
        
        chown user:group file

        chown root:root file

        # asumir el mismo grupo del usuario
        chown root: file        


3. Terminales en Linux


        1. Identificando terminales 
        
                Las terminales fisicas tendran una númeracion de tty1 - tty6x

        2. Pseudoterminales

                Terminales logicas

        NOTA: pts contiene cada una de las terminales virtuales

        # Identificando la terminal de trabajo
                tty

        # Verificando los usuarios conectados al SO
                w 
                who

4. Verificacion de procesos

        # Verificar procesos que estan corriendo en el SO
                ps
                ps aux

        # Verificar procesos en background
                jobs

        # Entrar en procesos parados
                fg

        # ejecutar procesos o script sin perder la consola - background
                ./script.sh &
                nohub ./script.sh & # La diferencia es que genera un archivo con la información del proceso


5. Monitoreo de recursos

        1. Verificar procesos en tiempo real
                top

        2. Verificar memoreia
                free

        3. Verificar disco duro
                du
                di -hsc /home

        4. Verificar procesos que mas CPU consumen en el sistema
                sudo ps auxf | sort -nr -k 3 | head -n 5

        5. Verificar procesos que mas RAM consumen en el sistema, k=posicion 4 en la salida de ps
                sudo ps auxf | sort -nr -k 4 | head -n 5

        NOTA: Paquete recomendado "htop" - se debe instalar


6. Parametros de Red

        1. Verificar direccion del equipo
                ifconfig
                ip a
                ip -4 a # Lista direcciones IPv4
                ip -6 a # Lista direcciones IPv6

        2. Ver puertas de enalce predeterminadas
                route -n

        3. Verificar direccion IP de un dominio
                nslookup google.com


7. Manejo de paquetes

        1. debian/ubuntu .deb
                Localizados en /var/lib/dpkg

                # Listar todos los paquetes instalados
                dpkg -l

                # Instalar
                dpkg -i paquete

                # Remover
                dpkg -r paquete

        2. apt
                # Buscar paquetes
                sudo apt search paquete


8. Administracion de usuarios


        Verificar forataleza de las contraseñas 
                pwscore

        Archivo de usuario /etc/passwd
        
        Example:
                root:x:0:0:root:/root:/bin/bash
                
                x => clave cifrada, contraseña sombra
                0 => id usuario
                0 => id grupo
                root => nombre de usuario
                /root => Home de usuario
                /bin/bash => Consola de trabajo asignada
        

        Archivo de contraseñas /etc/shadow

        Example:
                root:!:18099:0:99999:7:::


        1. identificacion de usuario
                id

        2. Quien soy yo?
                whoami


9. Administrando cuentas de usuario

        1. Agregar usuario
                useradd nombreusuario
                adduser nombreusuario 

        2. Eliminar usuario
                userdel nombreusuario

        3. Modificar usuario
                usermod 


        NOTA: ver contenido de un comando cat /usr/sbin/adduser
                ver permisos de un usuario sudo -l

10. Administrando grupos

        1. Cambiar de usuario
                sudo su - nombreusuario

        2. Verificar grupos de un usuario:
                groups nombreusuario

        3. Agregar un usuario a un grupo

                -a = add = agregar

                sudo gpasswd -a nombreusuario nombregrupo

                sudo gpasswd -a maria sudo

        4. Eliminar un usuario de un grupo

                -d = delete = eliminar

                sudo gpasswd -d nombreusuario grupo

                sudo gpasswd -d maria sudo

        5. Modiifcar

                usermod -aG sudo maria

        6. ver permisos de un usuario

                sudo -l


11. Usando PAM para el control de acceso de usuarios

        Configuraciones de PAM ls /etc/pam.d


        1. Restringir acceso a ssh a los usuarios, o permitir un horario de conexion especifico
        
                editar /etc/security/time.conf
                
                * = servicios
                * = terminales
                maria|eliza = usuarios
                WK = weekend  fines de semana
                0800-1800 = Horas 

                *;*;maria|eliza,WK0800-1800

                


12. Verificacion de servicios del SO

        Logs de los servicios
                /var/log

                awk = Comando para revison de logs

        1. Verificar estado de un servicio
                sudo systemctl status apache2

        2. Habilitar un servicio
                sudo systemctl enable apache2

        3. Para el servicio
                sudo systemctl stop apache2

        4. Inicar servicio
                sudo systemctl start apache2

        5. Reiniciar el servicio
                sudo systemctl restart apache2

        6. Listar todas las unidades de los servicios
                sudo systemctl list-units -t service --all

        7. administrar logs
                sudo journalctl -f apache2

                # Verificar espacio de logs de journal
                sudo journalctl --disk-usage


        
13. Firewall - ufw

        Reglas:
        
        1. Permitir el puerto 22 ssh
                sudo ufw allow 22 comment 'ssh'
                sudo ufw allow 102.160.10.127 tcp to any port 22 comment 'Permitir ssh ip' 

        2. Activar ufw
                sudo ufw enable

        3. Verificar reglas existentes
                sudo ufw status
                sudo ufw status numbered

        4. Eliminar reglas
                sudo ufw delete numero_regla

        5. Eliminar todas las reflas
                sudo ufw reset


14. Software de auditoria y escaneo

        nmap
        lynis

# NOTAS

### ¿Como realizar el debug de un script?
  
  Hay dos opciones para realizar el debug utilizando el comando bash:

  - Opción -v. Ver el resultado detallado de nuestro script (linea por linea)
  - Opción -x. desplegar información de los comandos que son utilizados

### Validar tamaños y tipo de datos en el ingreso de la información
  - Tamaños: read -n<numero_caracteres>
  - Tipo: Expresiones Regulares

### Envio de opciones vs parametros
  - Envio independiente
  - Envio complementario
  - Leer los valores

### Pasar contraseña para realizar tareas con privilegios elevados
  ``` bash 
    
    read -s -p "Ingresar contraseña: " password
    echo "$password" | sudo -S apt update
    echo "$password" | sudo -S apt install -y postgresql postgresql-contrib
    echo "$password" | sudo -S systemctl disabled postgresql.service
    echo "$password" | sudo -S systemctl start postgresql.service
  ```

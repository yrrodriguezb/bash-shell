# ! /bin/bash
# Programa para ejemplificar la forma de como transferir por la red
# Utilizando las opciones de empaquetamiento para optimizar la velocidad de transferencia

echo "Empaquetar todos los scripts de la carpeta ShellCourses y transferirlos a otro equipo utilizando el comando rsync"


host=""
usuario=""

read -p "Ingrese el Host: " host
read -p "Ingrese el Usuario: " usuario
echo -e "\n En este momento se procederá a empaquetar la carpeta y transferir según los datos ingresados"

rsync -avz $(pwd) $usuario@$host:/home/usuario/Documentos

# /bin/bash
# Programa capturar información de usuario 


# Con echo y la variable $REPLY
option=0
backupName=""

echo "Programa utilidades Postgres"
echo -n "Ingresar una opción: "
read
option=$REPLY
echo -n "Nombre del archivo del backup: "
read
backupName=$REPLY

echo "Opcion: $option, backupName: $backupName"


# Con el comando read
echo "Programa utilidades Postgres"
read -p "Ingresar una opción: " option
read -p "Ingresar el nombre del archivo del backup: " backupName
echo "Opcion: $option, backupName: $backupName"

# /bin/bash
# Programa capturar información del usuario y validarla


# Con echo y la variable $REPLY
option=0
backupName=""

echo -e "Programa utilidades Postgres\n"
# Informacion de un solo caracter
read -n 1 -p "Ingresar una opción: " option
echo -e "\n"
read -n 10 -p "Nombre del archivo del backup: " backupName
echo -e "\n"
echo "Opción: $option, backupName: $backupName"
echo -e "\n"
# -s Modo silencioso
read -s -p "Clave: " clave
echo "Clave: $clave"

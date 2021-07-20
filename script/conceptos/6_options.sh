# /bin/bash
# Programa para ejempificar como se realiza el paso de opciones con sin parametros

echo "Programa Opciones"
echo "Opcion 1 enviada: $1"
echo "Opcion 2 enviada: $2"
echo "Opciones enviadas"
echo -e "\n"
echo "Recuperar los valores"

while [ -n "$1" ]; 
do
  case "$1" in
    -a) echo "-a option utilizada";;
    -b) echo "-b opcion utilizada";;
    -c) echo "-c option utilizada";;
    *) echo "No es un opcion";;
  esac
  shift
done

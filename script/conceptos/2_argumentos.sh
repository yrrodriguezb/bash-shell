# !/bin/bash
# Argumentos en bash

# Como ejecutar un script con argumentos
# Identificador   Descripción
# $0              El nombre del script
# $1 al $10       El número de argumento, si son mas de un digito se utiliza las llaves
# $#              Contador de argumentos
# $*              refiere a todos los argumentos


nombre=$1
apellido=$2

echo "Nombre completo: ${nombre} ${apellido}"
echo "Número de parametros: $#"
echo "Parametros enviados: $*"


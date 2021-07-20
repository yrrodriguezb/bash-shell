# /bin/bash
# Peograma para revisar como ejecutar comandos dentro de un programa 
# y almacenarlos en una variable para su posterior utilización

ubicacionActual=`pwd`
infoKernel=$(uname -a)

echo "La ubicación actual es la siguiente: $ubicacionActual"
echo "Información del kernel: $infoKernel"

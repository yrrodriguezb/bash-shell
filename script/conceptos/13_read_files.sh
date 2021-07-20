# !/bin/bash
# Programa para leer un archivo
# Author Diego Beltran histagram @diegodevelops

echo "Leer archivoss"
cat $1
echo -e "\nAlmacenar valores en un avariable"
valorCat=`cat $1`
echo "$valorCat"

# Se usa variable especial IFS (internal file separator) evitar recortes de espacios en blanco
echo -e "\nLeer archivos linea por linea utilizando while\n"
while IFS= read linea
do
  echo "$linea"
done < $1

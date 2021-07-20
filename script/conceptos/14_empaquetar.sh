# !/bin/bash
# Programa para ejemplificar el empaquetamiento con tar - gzip - zip


# NOTA: Probar pbzip2, otra alternativa de empaquetamiento

echo "Empaquetar todos los scripts de la carpeta actual"


compressFile=shellCourse."$(date +%Y%m%d_%H%M%S%N)".tar

# -c crear
# -v verbose, muestra lo que se esta empaquetando
# -f file o archivos

# Comprimir archivos en un archivo tar
tar -cvf $compressFile *.sh


# Comprimir tar con gzip
# Cuando se empaqueta con gzip el anterior archivo se elimina
gzip $compressFile


# Comprimir los archivos en un archivo zip con clave
compressFileZip=shellCourse."$(date +%Y%m%d_%H%M%S%N)".zip
zip -e $compressFileZip *.sh

# Comprobar el empaquetado
ls -ali *.tar*

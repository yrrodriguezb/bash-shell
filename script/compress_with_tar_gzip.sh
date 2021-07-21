# !/bin/bash

archivo="archivo_nombre"

if [[ -e "$archivo.tar" ]]; then
  rm -rf $archivo.tar
fi

if [[ -e "$archivo.tar.gz" ]]; then
  rm -rf $archivo.tar.gz
fi

# Compress tar to gz
tar -cvf $archivo.tar test  | gzip -9 --keep --recursive >  $archivo.tar.gz

# list file
echo "tar file:"
tar -tvf $archivo.tar

echo -e "\ngzip file:"
gzip -l $archivo.tar.gz

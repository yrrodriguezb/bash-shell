# !/bin/bash
# Break - continue

echo -e "sentencias break y continue\n"

for file in $(ls *.sh)
do
  for nombre in {1..4}
  do
    if [ $file == "10_while_loop.sh" ]; then
      break;
    elif [[ $file == 4* ]]; then
      continue;
    else
      echo "Nombre archivo: $file _ $nombre"
    fi
  done
done

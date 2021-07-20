# !/bin/bash
# Loop anidados

for file in $(ls *.sh)
do
	echo "--------------- $file ---------------------"
	while read -r linea; do
		echo "$linea"
	done < "$file"
done

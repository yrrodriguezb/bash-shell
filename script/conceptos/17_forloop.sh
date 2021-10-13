# !/bin/bash

# Declaracion del array
declare -a list=("bob" "sue" "jake")
declare -p list

# imprimir la cantidad de elementos
echo ${#list[*]}


# iterando las lista
for ((i=0; i<${#list[*]}; i++)) ; do
  echo ${list[$i]}
done


for file in $(ls); do
  stat -c "%n %F" $file;
done



# continue 
for file in $(ls -A); do
  if [[ -d $file ]]; then
    continue;
  fi

  stat -c "%n %F" $file;
done


# break
for file in $(ls); do
  if [[ -f $file ]]; then
    break;
  fi

  stat -c "%n %F" $file;
done

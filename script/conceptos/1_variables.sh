# !/bin/bash
# Variables en bash

numA=10
numB=4

echo "Operaciones Aritmeticas"
echo "Numero A=$numA y B=$numB"
echo "Suma: $((numA + numB))"
echo "Resta: $((numA - numB))"
echo "Multipicación: $((numA * numB))"
echo "División: $((numA / numB))"
echo "Residuo: $((numA % numB))"

echo -e "\nOperaciones Relacionales"
echo "Numero A=$numA y B=$numB"
echo "A > B:" $((numA > numB))
echo "A < B:" $((numA < numB))
echo "A >= B:" $((numA >= numB))
echo "A <= B:" $((numA <= numB))
echo "A == B:" $((numA == numB))
echo "A != B:" $((numA != numB))

echo -e "\nOperaciones de Asignación"
echo "Numero A=$numA y B=$numB"
echo "A += B:" $((numA += numB))
echo "A -= B:" $((numA -= numB))
echo "A *= B:" $((numA *= numB))
echo "A /= B:" $((numA /= numB))
echo "A %= B:" $((numA %= numB))

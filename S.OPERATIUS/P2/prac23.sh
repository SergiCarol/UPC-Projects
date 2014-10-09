#!/bin/bash

FILES=$(find $1 -name "*.py")

for i in $FILES
do
    BUSCA=$(grep -w "class" $i)
    echo $BUSCA
   # awk '{gsub(//, , $1)
    
done



#sort --dictionary-order $PYTHON

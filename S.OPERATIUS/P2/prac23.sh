#!/bin/bash

FILES=$(find $1 -name "*.py")

for i in $FILES
do
    BUSCA=$(grep -w "class" $i ) 
    awk '{ gsub();print}' 
done | sort



#sort --dictionary-order $PYTHON

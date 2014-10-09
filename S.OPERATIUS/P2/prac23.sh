#!/bin/bash

FILES=$(find $1 -name "*.py")

for i in $FILES
do
    awk '/^class/ { gsub("class ","");gsub(/\(.*/,"");print $0,FILENAME}' $i
done | sort -d



#sort --dictionary-order $PYTHON

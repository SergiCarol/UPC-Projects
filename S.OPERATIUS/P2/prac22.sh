#!/bin/bash

FILES=$(find $1 -name "*.jpeg")

for i in $FILES
do
	convert $i -resize 150x200! ${i%.jpeg}-br.jpeg
done
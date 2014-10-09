#!/bin/bash

FILE=$(zenity --title="Selecciona un fitxer" --file-selection)
NAME=$(zenity --title="Escriu una paraula" --entry)

if grep -w $NAME $FILE; then
    echo "Si s'ha trobat la paraula" $NAME
else
    echo "No s'ha trobat la paraula" $NAME
fi

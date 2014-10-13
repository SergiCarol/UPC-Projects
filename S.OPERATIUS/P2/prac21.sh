#!/bin/bash

FILE=$(zenity --title="Selecciona un fitxer" --file-selection)
NAME=$(zenity --title="Escriu una paraula" --entry)

if grep $NAME $FILE; then
    zenity --info --text="S'ha trobat la paraula"
else
	zenity --info --text="No s'ha trobat la paraula"    
fi

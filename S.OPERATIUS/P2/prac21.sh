#!/bin/bash

FILE=$(zenity --title="Selecciona un fitxer" --file-selection)
NAME=$(zenity --title="Escriu una paraula" --entry)

grep -w $NAME $FILE

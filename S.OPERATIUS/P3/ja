#!/bin/bash


if [ $1='-n' ]; then
	if [ -d ~/.ja ]; then
		echo "Esteu segurs que voleu borrar la base de dades? [s/n]"
		read RESPOSTA
		[ RESPOSTA='s' ] && rm -f ~/.ja/*
	else
	    mkdir ~/.ja
	fi
	
fi
 

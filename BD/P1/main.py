#-*- encoding: utf-8 -*-

from fitxer import*

def consulta(x):
    if llegir_placa(x) == "XXXXXXX":
        print('La plaça '+ str(x) +' esta buida')
    else:
        print('La plaça ' str(x) 'esta ocupade per' str(llegir_placa(x)))


consulta(0)

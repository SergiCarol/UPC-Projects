#-*- encoding: utf-8 -*-

from fitxer import*

def consulta(x):
    if llegir_placa(x) == "XXXXXXX":
        print('La plaça '+ str(x) +' esta buida')
    else:
        print('La plaça '+ str(x) +' esta ocupada per '+ str(llegir_placa(x)))

def ocupa(p,m):
    if ocupar_placa(p,m) == True:
        print('Plaça '+str(p)+' ocupada correctament per '+str(m))
    else:
        print('Plaça '+str(p)+' ocupada per '+str(llegir_placa(p)))
    

consulta(1)
ocupa(2)

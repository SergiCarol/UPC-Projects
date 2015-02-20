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

def sortir(m):
    if is_in(m) == -1:
        print('No es traboa dins del parking')
    else:
        ocupar_placa(is_in(m),"XXXXXXX")
        print(str(m)+' ha sortit correctament')

#Aquesta funcio ocupa la primera plaça buida que troba, en cas 
#de que es pugui ocupar retorna true, en cas contrari false
def ocupar_first(m):
    j = is_in("XXXXXXX")
    if j >= 0:
        ocupar_placa(j,m)
        print(str(m)+' ha ocupat la plaça '+str(j))
    else:
        print('El parking esta complet')
    

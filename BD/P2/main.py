#-*- encoding: utf-8 -*-

from fitxer import *
from interpret import Interpret

def ocupa(dni,nom,data):
    """ 
    No es comproven coses dintre ocupar_placa, canviar consulta perque retorni True o false
    o bé fer comrpovacions aqui dintre 
    """
    if  llegir(dni) == ["XXXXXXXXX","XXXXXXXXXX","XXXX"]:
        if ocupar(dni,nom,data) == True:
            print('Shan guardat les dades correctament:\nDNI: '+str(dni)+'\nNOM: '+str(nom)+'\nDATA: '+str(data))
        else:
            print('Has introduit una DNI o una DATA incorrectament')
    else:
        [a,b,h]=llegir(dni)
        print('Tenim una colisio per\nDNI: '+str(a.strip('x00'))+'\nNOM: '+str(b)+'\nDATA: '+str(h))

def sortir(dni):
    """
    Comprovem que la matricula m es troba dins el parking.
    En cas afirmatiu la treiem subtituint el seu valor per 'XXXXXXX'
    """
    if is_in(dni) == -1:
        print('No es traboa dins de la taula')
    else:
        [a,b,h]=llegir(dni)
        if subs(is_in(dni)) == True:
            print('Ha sortit correctament\nDNI: '+str(a)+'\nNOM: '+str(b.strip('x00'))+'\nDATA: '+str(h.strip('x00')))
        else:
            print('Hi ha agut un error')
"""
def consulta(p):
    [a,b,h] = llegir(int(p))
    if a == "XXXXXXX":
        print('La plaça '+ str(p) +' esta buida')
        return True
    else:
        print('La plaça '+ str(p) +' esta ocupada per\nmatricula: '+str(a)+'\ncolor: '+str(b.strip('x00'))+'\nmodel: '+str(h.strip('x00')))
        return False   
"""

def cerca(dni):
    if len(dni)!=9:
        print "El DNI no es correcte"
    else:
        a = is_in(dni)
        if a == -1:
            print('No es traboa dins la taula')
        else:
            print('El DNI: '+str(dni)+' esta en la plaça '+str(a))

def llistat():
    """
    Et retorna una llista amb les places que estan buides.
    """
    if empty_number() == []:
        print('La taula esta plena')
    else:
        print('La taula disposa daquestes places: ')
        print(list(empty_number()))

def ending():
    """
    Funcio que s'executa quan sortim del programa.
    """
    print "Gracies per utilitzar el PARKING 'CARLE'"

def begining():
    print "\n\t\t\t PARKING 'CARLE'"
    info()

def info():
    """
    Et mostra el conjunt de comandes que pots utilitzar en l'interpret.
    """
    print "Les comanandes són:\n -info\n -exit\n -reset\n -cerca 'DNI'\n -llistat_buides\n -sortir 'DNI'\n -ocupar 'DNI' 'NOM' 'DATA'"
    print "*Aquells noms entre cometes simples '' indiquen el nom de la variable"

if __name__=="__main__":
    I= Interpret()
    I._prompt="=> "
    I.set_end(ending)
    I.set_begin(begining)
    I.afegeix_ordre("info",info)
    I.afegeix_ordre("reset",buidar)
    I.afegeix_ordre("cerca",cerca)
    I.afegeix_ordre("llistat_buides",llistat)
    #I.afegeix_ordre("consulta",consulta)
    I.afegeix_ordre("sortir",sortir)
    #I.afegeix_ordre("ocupar_primera",ocupar_first)
    I.afegeix_ordre("ocupar",ocupa)
    I.run()


#buidar()
#ocupa("12345678Q","Pep","1994")
#sortir("12345678Q")
#cerca("12345678Q")
#llistat()

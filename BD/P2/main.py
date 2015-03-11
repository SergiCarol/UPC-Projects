#-*- encoding: utf-8 -*-

from fitxer import *
from interpret import Interpret

def ocupa(nom,dni,data):
    """ 
    No es comproven coses dintre ocupar_placa, canviar consulta perque retorni True o false
    o bé fer comrpovacions aqui dintre 
    """
    if  llegir(nom) == ["XXXXXXXXXX","XXXXXXXXX","XXXX"]:
        if ocupar(nom,dni,data) == True:
            print('Shan guardat les dades correctament:\nNOM: '+str(nom)+'\nDNI: '+str(dni)+'\nDATA: '+str(data))
        else:
            print('Has introduit una DNI o una DATA incorrectament')
    else:
        [a,b,h]=llegir(nom)
        print('Tenim una colisio per\nNOM: '+str(a.strip('x00'))+'\nDNI: '+str(b)+'\nDATA: '+str(h))
        if ocupar(nom,dni,data) == True:
            print('Shan guardat les dades correctament:\nNOM: '+str(nom)+'\nDNI: '+str(dni)+'\nDATA: '+str(data))

def sortir(nom):
    """
    Comprovem que la matricula m es troba dins el parking.
    En cas afirmatiu la treiem subtituint el seu valor per 'XXXXXXX'
    """
    if is_in(nom) == -1:
        print('No es traboa dins de la taula')
    else:
        [a,b,h]=llegir(nom)
        if subs(is_in(nom)) == True:
            print('Ha sortit correctament\nNOM: '+str(a)+'\nDNI: '+str(b.strip('x00'))+'\nDATA: '+str(h.strip('x00')))
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

def cerca(nom):
    if len(nom)>10 or len(nom)==0:
        print "El NOM no es correcte"
    else:
        a = is_in(nom)
        if a == -1:
            print('No es traboa dins la taula')
        else:
            [a,b,h]=llegir(nom)
            print('NOM: '+str(a.strip('x00'))+'\nDNI: '+str(b)+'\nDATA: '+str(h))
"""
def llistat():
    
    Et retorna una llista amb les places que estan buides.
    
    if empty_number() == []:
        print('La taula esta plena')
    else:
        print('La taula disposa daquestes places: ')
        print(list(empty_number()))
"""

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
    print "Les comanandes són:\n -info\n -exit\n -reset\n -consulta 'NOM'\n -esborra 'NOM'\n -insereix 'NOM' 'DNI' 'DATA'"
    print "*Aquells noms entre cometes simples '' indiquen el nom de la variable"

if __name__=="__main__":
    I= Interpret()
    I._prompt="=> "
    I.set_end(ending)
    I.set_begin(begining)
    I.afegeix_ordre("info",info)
    I.afegeix_ordre("reset",buidar)
    I.afegeix_ordre("consulta",cerca)
    #I.afegeix_ordre("llistat_buides",llistat)
    #I.afegeix_ordre("consulta",consulta)
    I.afegeix_ordre("esborra",sortir)
    #I.afegeix_ordre("ocupar_primera",ocupar_first)
    I.afegeix_ordre("insereix",ocupa)
    I.run()


#buidar()
#ocupa("12345678Q","Pep","1994")
#sortir("12345678Q")
#cerca("12345678Q")
#llistat()

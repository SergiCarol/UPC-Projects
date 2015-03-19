#-*- encoding: utf-8 -*-

from fitxer4 import *
from interpret import Interpret

def ocupa(nom,dni,data):
    """ 
    Introduim unes dades utilitzant le sfuncions corresponents.
    Comprovem que la mida del nom no supera la permes (10).
    Inserim les dades en la posicio que li correspon, sempre que aquesta estigui buida.
    En cas contrari, tenim una colisio amb els noms, busquem la posicio buida següent.
    """
    if len(nom)>10:
        print('*La mida del nom ha sigut escursada a 10 caracters.')   
    if  llegir(nom) == ["XXXXXXXXXX","XXXXXXXXX","XXXX"]:
        if ocupar(nom,dni,data) == True:
            print('Shan guardat les dades correctament:\nNOM: '+str(nom[0:10])+'\nDNI: '+str(dni)+'\nDATA: '+str(data))
        else:
            print('Has introduit una DNI o una DATA incorrectament')
    else:
        if ocupar_seg(nom,dni,data) == True:
            print('TENIM COLISIO.')
            print('Shan guardat les dades correctament:\nNOM: '+str(nom[0:10])+'\nDNI: '+str(dni)+'\nDATA: '+str(data))
        else:
            print('Has introduit una DNI o una DATA incorrectament')

def sortir(nom,dni):
    """
    Comprovem que el nom esta dins de la taula, si es aixi esborrem totes les seves dades.
    """
    a = is_in(nom)
    if a == []:
        print('No es troba dins de la taula')
    else:
        [c,b,h]=subs(nom,dni)
        print('Ha sortit correctament\nNOM: '+str(c)+'\nDNI: '+str(b)+'\nDATA: '+str(h))
    
def cerca(nom):
    """
    Busquem les dades del nom que estem buscant, si no existeix ens mostra que el nom no es troba dins la taula.
    Si troba el nom/s ens mostra les seves dades per pantalla.
    """
    if len(nom)>10 or len(nom)==0:
        print "El NOM no es correcte"
    else:
        a = is_in(nom)
        if a == []:
            print('No es troba dins la taula.')
        else:
            for f in a:
                [c,b,h]=posicio(f)
                print('---------------\nNOM: '+str(c)+'\nDNI: '+str(b)+'\nDATA: '+str(h)+'\n----------------')

def ending():
    """
    Funcio que s'executa quan sortim del programa.
    """
    print "Gracies per utilitzar els serveis de 'CARLE'"

def begining():
    print "\n\t\t\t TAULA 'CARLE'"
    info()

def info():
    """
    Et mostra el conjunt de comandes que pots utilitzar en l'interpret.
    """
    print "Les comanandes són:\n -info\n -exit\n -reset\n -consulta 'NOM'\n -esborra 'NOM' 'DNI'\n -insereix 'NOM' 'DNI' 'DATA'"
    print "*Aquells noms entre cometes simples '' indiquen el nom de la variable"

if __name__=="__main__":
    I= Interpret()
    I._prompt="=> "
    I.set_end(ending)
    I.set_begin(begining)
    I.afegeix_ordre("info",info)
    I.afegeix_ordre("reset",buidar)
    I.afegeix_ordre("consulta",cerca)
    I.afegeix_ordre("esborra",sortir)
    I.afegeix_ordre("insereix",ocupa)
    I.run()

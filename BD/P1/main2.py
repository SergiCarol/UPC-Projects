#-*- encoding: utf-8 -*-

from fitxer2 import *
from interpret import Interpret

def ocupa(p,m,c,t):
    """ 
    No es comproven coses dintre ocupar_placa, canviar consulta perque retorni True o false
    o bé fer comrpovacions aqui dintre 
    """
    if  llegir_placa(int(p)) == ["XXXXXXX","XXXXXXXXXX","XXXXXXXXXX"]:
        if ocupar_placa(int(p),m,c,t) == True:
            print('La plaça '+str(p)+' ha estat ocupada correctament per\nmatricula: '+str(m)+'\ncolor: '+str(c)+'\nmodel: '+str(t))
        else:
            print('Has introduit una plaça o una matricula incorrecte')
    else:
        [a,b,h]=llegir_placa(int(p))
        print('La plaça '+str(p)+' ja està ocupada per\nmatricula: '+str(a)+'\ncolor: '+str(b.strip('x00'))+'\nmodel: '+str(h.strip('x00')))

def ocupar_first(m,c,t):
    """
    Aquesta funcio ocupa la primera plaça buida que troba amb la matricula m.
    En cas de que es pugui ocupar retorna true, en cas contrari false
    """
    p = is_in("XXXXXXX")
    if p >= 0:
        ocupar_placa(int(p),m,c,t)
        print('La plaça '+str(p)+' ha estat ocupada correctament per\nmatricula: '+str(m)+'\ncolor: '+str(c)+'\nmodel: '+str(t))
    else:
        print('El parking esta complet')

def sortir(m):
    """
    Comprovem que la matricula m es troba dins el parking.
    En cas afirmatiu la treiem subtituint el seu valor per 'XXXXXXX'
    """
    if is_in(m) == -1:
        print('No es traboa dins del parking')
    else:
        [a,b,h]=llegir_placa(is_in(m))
        ocupar_placa(is_in(m),"XXXXXXX",'X','X')
        print('Ha sortit correctament\nmatricula: '+str(a)+'\ncolor: '+str(b.strip('x00'))+'\nmodel: '+str(h.strip('x00')))


def consulta(p):
    [a,b,h] = llegir_placa(int(p))
    if a == "XXXXXXX":
        print('La plaça '+ str(p) +' esta buida')
        return True
    else:
        print('La plaça '+ str(p) +' esta ocupada per\nmatricula: '+str(a)+'\ncolor: '+str(b.strip('x00'))+'\nmodel: '+str(h.strip('x00')))
        return False   
def cerca(m):
    if len(m)<7:
        print "La matricula no es correcte"
    else:
        a = is_in(m)
        if a == -1:
            print('No es traboa dins del parking')
        else:
            print('La matricula: '+str(m)+' esta en la plaça '+str(a))

def llistat():
    """
    Et retorna una llista amb les places que estan buides.
    """
    if empty_number() == []:
        print('El parking esta complet')
    else:
        print('El parking disposa daquestes places: ')
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
    print "Les comanandes són:\n -info\n -exit\n -cerca 'matricula'\n -llistat_buides\n -consulta 'plaça'\n -sortir 'matricula'\n -ocupar_primera 'matricula' 'color' 'marca'\n -ocupar 'plaça' 'matricula' 'color' 'marca'"
    print "*Aquells noms entre cometes simples '' indiquen el nom de la variable"

if __name__=="__main__":
    I= Interpret()
    I._prompt="=> "
    I.set_end(ending)
    I.set_begin(begining)
    I.afegeix_ordre("info",info)
    I.afegeix_ordre("cerca",cerca)
    I.afegeix_ordre("llistat_buides",llistat)
    I.afegeix_ordre("consulta",consulta)
    I.afegeix_ordre("sortir",sortir)
    I.afegeix_ordre("ocupar_primera",ocupar_first)
    I.afegeix_ordre("ocupar",ocupa)
    I.run()



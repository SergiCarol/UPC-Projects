#-*- encoding: utf-8 -*-

import struct

def hash_(a):
    hashh=0
    i =1
    for c in str(a):
        hashh= (101*hashh + ord(c))*i
        i+=1
    print (hashh%23023)
    return hashh%23023

def llegir(nom):
    
    """
    Donada una posicio retorna la matricula, el color i la marxa del 
    cotxe aparcat o XXXXXXX en cas de que estigui buida
    """

    # Obrim el fitxer
    f=open('persones.dat','r+')
    # Calculem la posicio que volem mirar
    posicio = hash_(nom)
    f.seek(posicio)
    [nom,dni,data] = struct.unpack('10s9s4s',f.read(23))
    f.close()
    return [nom,dni,data]
    
def ocupar(nom,dni,data):
    
    """
    Comprova si la posicio esta ocupada, en el cas de que no ho estigui
    escriu la matricula, el color i la marca, si funciona correctament retorna true,
    en cas contrari retorna false
    """

    if len(dni) == 9 and len(data) == 4: 
        f=open('persones.dat','r+')
        posicio=hash_(nom)
        f.seek(posicio)
        a = struct.pack('10s9s4s',nom,dni,data)
        f.write(a)
        f.close()
        return True
    else:
        return False

def ocupar_seg(nom,dni,data):
    if len(dni) == 9 and len(data) == 4: 
        f=open('persones.dat','r+')
        posicio=hash_(nom)
        f.seek(posicio+23)
        [a,b,c] = struct.unpack('10s9s4s',f.read(23))
        while [a,b,c] != ["XXXXXXXXXX","XXXXXXXXX","XXXX"]:
            posicio=posicio+23
            if posicio<=23000:
                f.seek(posicio)
                [a,b,c] = struct.unpack('10s9s4s',f.read(23))
            else:
                return False
        a = struct.pack('10s9s4s',nom,dni,data)
        f.write(a)
        f.close()
        return True
    else:
        return False

def subs(posicio):
    if posicio < 23023:
        f=open('persones.dat','r+')
        r = f.read()
        f.seek(posicio)
        a = struct.pack('10s9s4s',"XXXXXXXXXX","XXXXXXXXX","XXXX")
        f.write(a)
        f.close()
        return True
    else:
        return False
        

def is_in(nom):
	
    """
    Aquesta funcio comprova si una matricula es troba dintre 
    el parquing, i retorna la seva posicio, en cas de que no i sigui
    retorna -1
    """
    #Obrir document llegir i trobar posicio on hi ha el nom, f.seek(pos.nom) tornar a buscar, posar tote sles posiscions en una llista.
    f=open('persones.dat','r')
    r = f.read()
    f.close()
    if str(nom) in r:
        j=r.find(nom)
        return j
    else:
        return -1
        
def empty_number():
    
    """
    Aquesta funcio busca el numero de plaçes buides que hi ha, 
    les plaçes buides es representen amb la matricula XXXXXXX
    per tan busquem totes les posicions per veure quantes tenen
    espais buits.
    """
    f = open('persones.dat','r')
    r= f.read()
    i = 0
    l = []
    
    if is_in("XXXXXXXXXX") < 0:
        return l        
    while i < 23023:
        f.seek(i)
        i=r.find("XXXXXXXXXX",i)
        
        l.append(i/23)
        i+=23        
    f.close()
        
    return l


def buidar():
    
    """
    Aquesta funcio fica tots els aparcaments buits
    """
    f = open('persones.dat','r+')
    for x in range(23023):
        f.seek(x)
        f.write('X')
    f.close()
    print ('La taula ha sigut buidada')

"""
ocupar("enric","39397715A","1994")
ocupar("sergi","39381257J","1994")
ocupar("Mc","77774525A","1999")
print llegir("enric")
print llegir("sergi")
print llegir("Mc")
"""

#-*- encoding: utf-8 -*-

import struct

def hash_(a):
    hashh=0
    i =1
    for c in str(a):
        hashh= (101*hashh + ord(c))*i
        i+=1
    return hashh%23023

def llegir(nom):
    
    """
    Donada una posicio retorna la matricula, el color i la marxa del 
    cotxe aparcat o XXXXXXX en cas de que estigui buida
    """
    f=open('persones.dat','r+')
    posicio = hash_(nom)
    f.seek(posicio)
    [nom,dni,data] = struct.unpack('10s9s4s',f.read(23))
    f.close()
    return [nom,dni,data]

def posicio(p):
    
    """
    Donada una posicio retorna la matricula, el color i la marxa del 
    cotxe aparcat o XXXXXXX en cas de que estigui buida
    """
    f=open('persones.dat','r+')
    f.seek(p)
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
        f.seek(posicio+1)
        [a,b,c] = struct.unpack('10s9s4s',f.read(23))
        while [a,b,c] != ["XXXXXXXXXX","XXXXXXXXX","XXXX"]:
            posicio=posicio+1
            if posicio<=23000:
                f.seek(posicio)
                [a,b,c] = struct.unpack('10s9s4s',f.read(23))
            else:
                return False
        f.seek(posicio)
        a = struct.pack('10s9s4s',nom,dni,data)
        f.write(a)
        f.close()
        return True
    else:
        return False

def subs(nom,dni):
    f=open('persones.dat','r+')
    r = f.read()
    a=struct.pack('10s9s',nom,dni) 
    p=r.find(a)
    f.seek(p)
    [k,b,c] = struct.unpack('10s9s4s',f.read(23))
    f.seek(p)    
    u=struct.pack('10s9s4s',"XXXXXXXXXX","XXXXXXXXX","XXXX")
    f.write(u)
    f.close()
    return [k,b,c]
    
def is_in(nom):
	
    """
    Aquesta funcio comprova si una matricula es troba dintre 
    el parquing, i retorna la seva posicio, en cas de que no i sigui
    retorna -1
    
    Obrir document llegir i trobar posicio on hi ha el nom, f.seek(pos.nom) tornar a buscar, posar tote sles posiscions en una llista.
    """
    f=open('persones.dat','r')
    a=struct.pack('10s',nom) 
    r=f.read()
    llista=[]
    j=-1
    f.close()
    while True:
        j=r.find(a,j+1)
        if j==-1:
            return llista
        else:
            llista.append(j)
    
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

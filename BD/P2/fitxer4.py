#-*- encoding: utf-8 -*-

import struct

def hash_(a):
    """
    Calculem la posicio en funcio de la mida del nom que introduim, la qual utilitzarem a la hora d'inserir unes noves dades.
    """
    hashh=0
    i =1
    for c in str(a):
        hashh= (101*hashh + ord(c))*i
        i+=1
    return hashh%23023

def llegir(nom):
    
    """
    Donat un nom trobem la seva posicio a partir del hash i retornem les dades que hi han en aquell lloc [nom,dni,data] 
    """
    f=open('persones.dat','r+')
    posicio = hash_(nom)
    f.seek(posicio)
    [nom,dni,data] = struct.unpack('10s9s4s',f.read(23))
    f.close()
    return [nom,dni,data]

def posicio(p):
    
    """
    Donada una posicio retorna llegeix els 23 caracters següents i retorna el nom, dni i data que es troban en aquella posicio.
    """
    f=open('persones.dat','r+')
    f.seek(p)
    [nom,dni,data] = struct.unpack('10s9s4s',f.read(23))
    f.close()
    return [nom,dni,data]
    
def ocupar(nom,dni,data):
    
    """
    Comprova que les dades son corretes, despres escrivim el nom, dni i data en el lloc que li correspon segons hash.
    Si aixo no es correcta retornem False.
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
    """
    Ens permet ocupar la següen posicio lliure si la que correspon al seu nom esta ocupada.
    Comprovem les dades, posteriorment busquem la següent posicio lliure. Un co p trobada escrivim les dades corresponents i retornem True.
    En cas contrari retornem False.
    """
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
    """
    A partir del nom i del dni localitzem el nom que volem esborrar.
    Per trobar el nom llegim el fitxer fins que localitzem el nom i dni.
    Un cop localitzades ens coloquem a la seva posicio i substituim les dades per 'X'.
    Finalment retornem les dades qu ehan sigut substituides.
    """
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
    Comprovem si un nom es troba dins la taula a partir de la lectura del fitxer.
    Guardem en una llista les posicions que corresponen a cada posicio que s'ha trobat el nom fins que obtenim -1, que ens indica que ja no ha trobat res mes.
    Retornem la llista amb les posicion/s del nom.
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
    Ens permet buidar tota la taula.
    Omplim les 23023 posicions amb 'X'.
    """
    f = open('persones.dat','r+')
    for x in range(23023):
        f.seek(x)
        f.write('X')
    f.close()
    print ('La taula ha sigut buidada')

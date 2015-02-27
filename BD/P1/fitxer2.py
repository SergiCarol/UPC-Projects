#-*- encoding: utf-8 -*-

import struct

"""
Donada una posicio retorna la matricula del cotxe aparcat o
XXXXXXX en cas de que estigui buida
"""
def llegir_placa(p):
    # Obrim el fitxer
    f=open('places.dat','r+')
    # Calculem la posicio que volem mirar
    posicio = p*27
    f.seek(posicio)
    [m,c,t] = struct.unpack('7s10s10s',f.read(27))
    #c = c.strip('x00')
    f.close()
    print [m,c,t]
    return [m,c,t]
    
    
"""
Comprova si la posicio esta ocupada, en el cas de que no ho estigui
escriu la matricula, si funciona correctament retorna true,
en cas contrari retorna false
"""
def ocupar_placa(p,m,c,t):
    f=open('places.dat','r+')
    posicio=p*27
    f.seek(posicio)
    a = struct.pack('7s10s10s',m,c,t)
    f.write(a)
    f.close()
  
        
	
"""
Aquesta funcio comprova si una matricula es troba dintre 
el parquing, i retorna la seva posicio, en cas de que no i sigui
retorna -1
"""
def is_in(m):
    f=open('places.dat','r')
    r = f.read()
    f.close()
    if str(m) in r:
        j = r.find(m)/7
        return j
    else:
        return -1
        
        

"""
Aquesta funcio busca el numero de plaçes buides que hi ha, 
les plaçes buides es representen amb la matricula XXXXXXX
per tan busquem totes les posicions per veure quantes tenen
espais buits.
"""
def empty_number():
    f = open('places.dat','r')
    r= f.read()
    i = 0
    l = []
    
    if is_in("XXXXXXX") < 0:
        return l
        
    while i < 7007:
        f.seek(i)
        i=r.find("XXXXXXX",i)
        if i > 0:
            l.append(i/7)
            i+=7
    f.close()
    return l


"""
Aquesta funcio fica tots els aparcaments buits
"""
def buidar():
    f = open('places.dat','r+')
    for x in range(7007):
        f.seek(x)
        f.write('X')
    f.close()



buidar()
ocupar_placa(1,"6543210","VERD","PEUGOT") 
llegir_placa(1)



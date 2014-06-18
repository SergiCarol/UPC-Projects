# -*- encoding:utf-8 -*-

from bitvec import *
from avrexcept import *

class OutOfMemError (AVRException):

    pass

class Memory (object):
    """
    Classe Memory
    =============
    Aquesta classe és la encarregada de organitzar i crear la memoria del MiniAVR. Aquesta classe és abstracta i per tant no poden haver-hi objectes instenciats de la classe, sino que sempre ho són de les seves subclasses **DataMemory** i **ProgramMemory**
    
    Mètodes:
    --------
    
        * .. function:: __init__(self)
        * .. function:: trace_on(self)
        * .. function:: __len__(self) 
        * .. function:: __repr__(self)
        * .. function:: dump(self)
        * .. function:: __getitem__(self,addr)
        * .. function:: __setitem__(self,addr,val)

    """
    
    def __init__(self): # Funciona
        """
        Classe constructora, crea una llisat buida que serà la memoria i inicialitza la variable privada trace en false. En el cas de que es fiqui a TRUE es permetra traçar els accessos al banc de memòria
        """
        
        self._m=[]
        self._trace=False

    def trace_on(self): # Funciona
        """
        Canvia l'estat de la variable _trace a TRUE permeten traçar els accessos al banc de memoria
        """
        
        self._trace=True

    def trace_off(self): #Funciona
        """
        Canvia l'estat de la variable privada _trace a FALSE
        """
        self._trace=False
        

    def __len__(self): # Funciona
        """
        Retorna el nombre de cel·les de memoria
        """
        a=len(self._m)
        return a

    def __repr__(self): #Acabar de mirar
        """
        Retorna un str que conte el bolcat de memoria en un format com el següent:

        0000: 00
        0001: 01
        """
        x=""
        for p,v in enumerate(self._m):
            x+= str(Word(p)) +" : " + str(v) +'\n' 
        return x

    def dump(self,f=0,t=5): #Acabat
        """
        Realitza la mateixa funció que la funció *__repr__* , pero no fa un bolcat de tota la memoria sino que nomes l'efectua entre f i t
        """
        x=""
        for element in range(f,t):
            x+=str(Word(element))+" : " + str(self._m[element])+'\n' 
        return x
                                         
                                           

    def __getitem__(self,addr):
        """
        Retorna el valor que es troba en la adressa *addr* en el
        següent format Read from 3 to 0002 En el cas de que la adressa
        addr sigui més gran que la longitud total de la memoria
        s'aixeca l'excepció OutOfMemError Nomes pot llegir la memoria
        en el cas de que el trace estigui activat.
        """
        if int(addr)>len(self._m):
            
            print "Readfrom"+str(addr)+"outofrange"
            raise OutOfMemError() #MIrar l'excepcio
        else:
            if self._trace == True:
                print "Read from " + str(self._m[addr])+ " to " + str(Word(addr))

            return self._m[addr]
        
        

    def __setitem__(self,addr,val):
        """
        Substitueix el valor que es troba en l'adressa de memoria
        *addr* per el valor *val* (aixó nomes pot passar en el cas de
        que el trace estigui activat) i retorna una string en el
        següent format: Write 3 to 0005 En el cas de que addr sigui
        més gran que la longitud total de la memoria s'aixeca
        l'excepció OutOfMemError()
        """
        
        if addr>len(self._m):
            print "Writefrom"+str(addr)+"outofrange"
            raise OutOfMemError() 
        else:
            self._m[addr]=type(self._m[0])(val)
            if self._trace == True:
                    print "Write " + str(Word(val))+ " to " + str(Word(addr))
        
class ProgramMemory(Memory): # Acabat
    """
    Aquesta classe representa  un banc de memòria per enmagatzemar programes. Per tant les dades enmagatzemades són de mida word

    Mètodes:
    --------
        * .. function:: __init__(self,ncells=1024)
    """
    def __init__(self,ncells=1024):
        """
        Incitalitza un banc de memoria nou d'amplada Word, en cas de
        que no s'especifiqui de quantes cel·les serà de 1024
        """
        
        Memory.__init__(self)
        for x in range(ncells):
            self._m.append(Word(0))
        


class DataMemory(Memory): #Acabat
    """
    Aquesta classe representa un banc de memòria per enmagatzemar. Per tant les dades enmagatzemades són de mida **Byte**.

    Mètodes:
    --------
        * .. function:: __init__(self,ncells=1024)
        * .. function:: dump_reg(self)
    """
   
    def __init__(self,ncells=1024): 
        """
        Incilialitza un banc de memoria d'amplada Byte, si no
        s'especifica cap valor de numero de cel·les serà de 1024, però
        si el valor és menor que 32 la llista serà de 32 elements
        """
       
        Memory.__init__(self)
        if ncells<32:
            for x in range(32):
                self._m.append(Byte(0))
        else:
            for x in range(ncells):
                self._m.append(Byte(0))
        
    def dump_reg(self): 
        """
        Mostra per la terminal el contingut de la memoria en el següent format:
        R00: 00
        R01: 00
        ...
        R31: 00
        X(R27:R26): 0000
        Y(R29:R28): 0000
        Z(R31:R30): 0000
        """
        i=00
        a=""
        for element in self._m[0:32]:
            
            a+= "R"+str("%02d"%i)+" : " + str(element) + '\n'
            i+=01
    
        a+= "X (R27 : R26): " + (str(self._m[27])+str(self._m[26])) + '\n'
        a+= "Y (R29 : R28): " + (str(self._m[29])+str(self._m[28])) + '\n'
        a+= "Z (R31 : R30): " + (str(self._m[31])+str(self._m[30])) + '\n'
        return a

# -*- encoding:utf-8 -*-

from estat import Estat
from supervisor import Supervisor


class Node (object):
    """
    Aquesta classe es la encarregada de crear i treballar amb els nodes.Com podrem observar, amb aquesta classe podrem canviar l'estat dels nodes, ficarlsi un supervisor i demanar en quin estat es troba el node.


    >>> N=Node('node1')
    >>> b=Node('b')
    >>> N.say(Estat(1))
    >>> N.ask()
    Estat(1)
    >>> b.say(Estat(-1))
    >>> b.ask()
    Estat(-1)
    >>> b.say(Estat(1))
    >>> b.ask()
    Estat(1)
    >>> N.set_supervisor(super)
    >>> repr(N)
    "El node node1 esta en l'estat Estat(1)"
    >>> repr(b)
    "El node b esta en l'estat Estat(1)"
    """

    def __init__(self, n):
         self._e = Estat(n)
         self._n = str(n)
    def say(self,e):

        
        supervi= Supervisor()
        if self._e != e:
            self._e=e
            supervi.notify_change()
         

    def ask(self):
        """
        Retorna el nom del node
        """
        return self._e


    def set_supervisor(self,s):

       self._s=s
        


    def __repr__(self):
        return "El node" +" " + self._n+" " +"esta en l'estat" +" "+ str(self._e)


class Entrada (Node):
    def up(self):
        self.say(1)
    def down(self):
        self.say(0)
    
    def undef(self):
        self.say(-1)

    def __repr__(self):
        return "la entrada d'aquest node esta en"+" "+str(self._e)

class Sortida (Node):
    def __repr__(self):
        return "la sortida d'aquest node esta en"+" "+str(self._e)

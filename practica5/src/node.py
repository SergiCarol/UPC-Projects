# -*- encoding:utf-8 -*-

from estat import Estat
from supervisor import Supervisor


class Node (object):
    """
    >>> N = Node('node1')
    >>> N.say(Estat(1))
    >>> N.ask()
    'node1'
    >>> N.set_supervisor(super)
    
    """

    def __init__(self, n):
         self._e = Estat(0)
         self._n = n
   
    def say(self,e):

        
        supervi= Supervisor()
        if self._e == e:
            pass
        else:
            self._e=e
            supervi.notify_change()
         

    def ask(self):
       
        return self._n


    def set_supervisor(self,s):

       self._s=s
        


    def __repr__(self):
        return self._e+" "+'\n'+" " +self._n + " " + '\n' 


class entrada (Node):
    def up(self):
        self.say(1)
    def down(self):
        self.say(0)
    
    def undef(self):
        self.say(-1)
    def __repr__(self):
        return "la entrada d'aquet node esta en"+" "+str( Estat())
class sortirda (Node):
    def __repr__(self):
        return "la sortida d'aquet node esta en"+" "+str( Estat())

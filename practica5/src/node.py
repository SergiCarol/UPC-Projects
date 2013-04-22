# -*- encoding:utf-8 -*-

from estat import Estat



class Node (object):
    """
    >>> N = Node('node1')
    >>> N.say(Estat(1))
    >>> N.ask()
    'node1'
    >>> N.set_supervisor('super')
    super
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
            
            return supervi.notify_change()
         

    def ask(self):
       
        return self._n


    def set_supervisor(self,s):

        s=Supervisor()
        s.add_node(self._n)
        return s


    def __repr__(self):
        return self._e+" "+'\n'+" " +self._n + " " + '\n' 

# -*- encoding:utf-8 -*-

from estat import Estat
from supervisor import Supervisor

class Node (object):
    

    def _init_(self,e,n,s):
      
         est=Estat
         sup=Supervisor
         _e=est
         _n=self.nom
         _s=sup

    def say(self,e):
        """
        >>> n=Node(1,node1,super)
        >>> n.say(1)
        1
        >>> j=Node(3,node1,super)
        >>> j.say(2)
        2
        """
        estat=Estat
        if estat == self._e:
            pass
        else:
            estat=self._e
            return Supervisor.notify_change()
        return estat
    def ask(self):
       
        return self._e

    def set_supervisor(self,s):
        a=_s.add_node(self._n)
        return a


    def __repr__(self):
        pass

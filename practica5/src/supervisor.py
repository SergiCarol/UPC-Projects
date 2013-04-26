# -*- encoding:utf-8 -*-
from node import *
class Supervisor (object):
    def __int__(self):
        """
        Crea un supervisor buit 
        """
        self._nodes=[]
        self._triports=[]
        self._changed=False
    def add_node(self,n):
        """
        Afegeix un node a supervisor
        """
        
        self._nodes+=[n]
        n.set_supervisor(self)
        n.self_supervisor(self)
    def add_triport(self,t):
        """
        Afegeix un triport al supervisor
        """
        self._triports+=[t]
    
    def notify_change(self):
        self.changed=True

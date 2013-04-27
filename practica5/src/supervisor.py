# -*- encoding:utf-8 -*-
from node import *
from triport import *
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
        """
        Avisa al supervisor si algun node canvia d'estat
        """
        self.changed=True

    def run (self,log=False):
        triports=self._triports
        if log==False:
            pass
        elif log==True:
            for element in triports:
                a=element.tick()
                if a==True:
                    return "Tick ->"+" "+ element.__repr__()

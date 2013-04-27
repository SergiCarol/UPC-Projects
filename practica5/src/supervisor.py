# -*- encoding:utf-8 -*-
from node import *
from triport import *
class Supervisor (object):
    def __init__(self):
        """
        Crea un supervisor buit 
        """
        self._nodes = []
        self._triports=[]
        self._changed=False
    def add_node(self,n):
        """
        Afegeix un node a supervisor
        """
        
        g=self._nodes
        g+=[n]
        n.set_supervisor(self)
  
    def add_triport(self,t):
        """
        Afegeix un triport al supervisor
        """
        self._triports+=[t]
    
    def notify_change(self):
        """
        Avisa al supervisor si algun node canvia d'estat
        """
        self._changed=True

    def run (self,log=False):
        triports=self._triports
       
        if log==True:
            for element in triports:
                a=element.tick()
		print element
                if a==True:
                    return "Tick ->"+" "+ element.__repr__()

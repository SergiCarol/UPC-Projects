#-*- encoding:utf-8 -*-
class Supervisor (Object):
    def __int__(self):
        """
        Crea un supervisor buit 
        """
        self._nodes=[]
        self._triports=[]
    def add_node(self,n):
        """
        Afegeix un node a supervisor
        """
        self._nodes+=[n]
    
    def add_triport(self,t):
        """
        Afegeix un triport al supervisor
        """
        self._triports+=[t]

# -*- encoding:utf-8 -*-
import repr as reprlib



class Estat(object):
    """
   
    La classe estat es l'encarregada de fer operacions amb els estats del programa, existeixen 3 tipus d'estats: 1,0 i -1 . Aquets estats signifiquen estat alt, estat baix i estat indefinit respectivament.

    >>> e0 = Estat()
    >>> e0.undef()
    True
    >>> e1 = Estat(1)
    >>> e0 = Estat(0)
    >>> e2 = Estat()
    >>> e3 = Estat(1)
    >>> e4 = Estat(0)
    >>> e1 == e3
    True
    >>> e3 == e2
    False
    >>> e1 & e0
    Estat(0)
    >>> e0 & e0
    Estat(0)
    >>> e1 & e1
    Estat(1)
    >>> e3 | e1
    Estat(1)
    >>> e4 | e1
    Estat(1)
    >>> e2 | e1
    Estat(-1)
    >>> e1 | e1
    Estat(1)
    >>> e2 & e1
    Estat(-1)
    """
    
    def __init__(self, e = -1):
        """
        Constructor de la classe estat, crea els diferents estat , en el cas de que no s'en defineixi cap l'estat sera -1
        """
        if e not in (-1,0,1):
            e = -1
        self._e = e

    def undef(self):
        return self._e == -1

    def __and__(self, altre):
        if self.undef() or altre.undef():
	if self._e == 1 or altre._e == 1:
		return Estat(1)
            return Estat()
        return Estat(self._e * altre._e)      

    def __nonzero__(self):
        return self._e == 1 or self._e == 0
	
    def __or__(self, altre):
        if self.undef() or altre.undef():
	    if self._e == 0 or altre._e == 0:
		return Estat(0)
            return Estat()
	if (self._e + altre._e) == 2:
	    return Estat(1)
       	return Estat(self._e + altre._e)
	
    def __repr__(self):
	if self._e == -1:
		return (("Estat(-1)"))	
        return (("Estat("+ str(self._e) + ")"))

    def __eq__(self, altre):
	return self._e == altre._e

        

# -*- encoding:utf-8 -*-

"""
Ahora se escribirá el modulo estado. Este modulo es muy util para
comprobar en que estado se encuentra un nodo
"""

class Estat(object):
    """
    >>> e0 = Estat()
    >>> e0.undef()
    True
    >>> e1 = Estat(1)
    >>> e0 = Estat(0)
    >>> e1 & e0
    Estat(0)
    >>> e0 & e0
    Estat(0)
    >>> e1 & e1
    Estat(1)
    >>> e1 | e0
    Estat(1)
    >>> e1 | e1
    Estat(1)
    
    """
    
    def __init__(self, e = -1):
        """
        >>> p = Estat()
        >>> p._e
        -1
        >>> t = Estat(3)
        >>> t._e
        -1
        >>> t = Estat(0)
        >>> t._e
        0
        """
        if e not in (-1,0,1):
            e = -1
        self._e = e

    def undef(self):
        """
        >>> p = Estat()
        >>> a = p.undef()
        >>> print a
        False
        >>> p._e = 0
        >>> a = p.undef()
        >>> print a
        True
        """
        return self._e == -1

    def __and__(self, altre):
        """
        
        """
        if self.undef() or altre.undef():
            return Estat()
        return Estat(self._e * altre._e)
            
"""
    def __nonzero__(self):
        return False

    def __repr__(self):
        return False



    def __or__(self):
        return False
""" 
        

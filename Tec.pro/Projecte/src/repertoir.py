# -*- encoding: utf-8 -*-

from avrexcept import *
from instruction import *
from bitvec import *


class Repertoir (object):
    """
    Repertoir és una classe d'instancies de la qual són un conjunt de InstRunner, Representen el conjunt d'instruccions d'un MCU. La seva funció principal és la de que donada una instrucció retorna l'objecte InstRunner capaç d'executar-la

    
    """
    
    def __init__ (self,li):
        """
        Inicialitza la lliste d'objectes de la classe InstRunner que consisteix en el repertori d'instruccions
        :param li: repertori d'instruccions
        :type li: list
        :return: None
        """
        self._li=li


    def find(self,instr):
        """
        instr és un Word que denota una instrucció. El mètode retorna un objecte InstRunner capaç d'executar la instrucció instr. En el cas de que no existeixi cap InstRunner capaç d'executar la instrucció, aixeca l'excepció UnknownCodeError
        """
        l=self._li
        
        for element in l:
            if element.match(instr)==True:
                
                return element
            """
            else:
                raise UnknownCodeError("Aquesta instruccio no existeix")
                """

class UnknownCodeError(AVRException):
    pass

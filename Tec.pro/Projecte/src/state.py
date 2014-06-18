# -*- encoding:utf-8 -*-


"""

Aquest mòdul implementa la classe **State**. La qual representa l’estat de la MCU. L’estat d’un computador està format pel conjunt de tots els registres i memòries. Cada vegada que s’executa una instrucció, l’estat canvia.

"""
from bitvec import Byte, Word
from memory import DataMemory, ProgramMemory

class State(object):
    """
    Classe State
    ============
    
    Aquesta classe representa l'estat de la MCU. L'estat d'un computador està format pel conjunt de tots els registres i memòries. Cada vegada que s'executa una instrucció, l'estat acostuma a canviar.

    Mètodes:
    --------

      * .. function:: __init__(self)
      * .. function:: dump_dat(self)
      * .. function:: dump_prog(self)
      * .. function:: dump_reg(self)

    """
    def __init__(self, data=128, prog=128):
        """
        Inicialitza l’estat de la MCU. data és el nombre de cel·les de la memòria de dades i prog el nombre de cel·les de la memòia de programa. pc és un Word que implementa el registre del Program Counter i flags és un Byte que implementa el registre d'estat(status). On cada bit és un flag d'estat.

        """
        
        self.data=DataMemory(data)
        self.prog=ProgramMemory(prog)
        self.pc=Word(0)
        self.flags=Byte(0)
  
    def dump_dat(self):
        """
        Retorna un **str** que representa el bolcat de la memòria de dades.
        """
        return self.data.dump(0,len(self.data)) #dump(0,len(self.data))-->interval de bolcat de la memòria de dades.
        
    def dump_prog(self):
        """
        Retorna un **str** que representa el bolcat de la memòria de programa.
        """
        return self.prog.dump(0,len(self.prog)) #dump(0,len(self.prog))-->interval de bolcat de la memòria del programa.

    def dump_reg(self):
        """
        Retorna un **str** que representa els registres que hi ha a l’estat. Aixì inclou també PC i flags. El format ha de ser similar a:
        R00: 00
        R01: 00
        ...
        R31: 00
        X(R27:R26): 0000
        Y(R29:R28): 0000
        Z(R31:R30): 0000
        PC: 0000
        CARRY: 0 ZERO: 0 NEG: 0
        """
        carry = self.flags[0]
        zero = self.flags[1]
        neg = self.flags[2]

        x = self.data.dump_reg()
        x = x + 'PC: {0}\n'.format(self.pc)
        x = x + ('CARRY: {0} ZERO: {0} NEG: {0}\n'.format(carry, zero, neg))

        return x



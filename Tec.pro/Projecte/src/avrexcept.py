# -*- encoding: utf-8 -*-


"""
Es un mòdul que defineix diverses classes d'excepcions usades en el simulador.

"""

class AVRException(Exception):

    """
    Es una excepció que denota un problema en el simulador d'AVR. En general s'usa a traves de subclasses.
    
    """

    pass

class OutOfMemException(AVRException):

    """
    Es una excepció que denota un accés a un banc de memòria amb una adreça inexistent.

    Aquesta classe cal implementar-la en el mòdul memory.
    """
    pass

class BreakException(AVRException):

    """
    Es una excepció que es llença sistemàticament cada vegada que s'executa la instrucció BRK. S'usa per aturar la simulació.

    Aquesta classe cal implementar-la en el mòdul instruction.
    """
    pass

class UnknownOpcodeException(AVRException):

    """
    Es una excepció que s'aixeca quan cal executar una instrucció de llenguatge màquina i aquesta no és coneguda.

    Aquesta classe cal implementar-la en el mòdul repertoire.
    """
    pass

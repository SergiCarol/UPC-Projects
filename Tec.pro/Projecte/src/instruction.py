# -*- encoding:utf-8 -*-

from bitvec import *
from memory import *
from state import *
from avrexcept import *

"""
===========
Instruction
===========

En el simulador, cada instrucció del microcontrolador té associada una classe. Per exemple, 
la instrucció ADD té associada la classe Add. Una instància de la classe Add és capaç de 
reconèixer i simular qualsevol instrucció ADD. La classe InstRunner és la super-classe (abstracta)
de totes les classes lligades a instruccions. Concentra els (pocs) serveis comuns que aquestes 
classes lligades a instrucció tenen.
"""

class InstRunner(object):
    """
    Classe InstRunner
    =================
    En el simulador, cada instrucció del microcontrolador té associada una classe per exemple, la instrucció ADD té associada la classe Add. Una instància de la classe Add és capaç de reconeixer i simular qualsevol instrucció ADD

    Mètodes:
    -------
        * .. function:: __repr__(self)
        * .. function:: match(self,instr)
        * .. function:: execute(self,instr,state)
    """
    
    def __repr__(self):
        """
        Retorna una cadena que representa la instrucció.
        """
        return self._n


    def match(self,instr):
        """
        *instr* és un *Word* i denota una instrucció. Retorna **True** si aquesta instància pot executar la instrucció *instr*.
        """
      
        return instr & self._mask == self._opcode
    
    
    def execute(self,instr,state):
        """
        *instr* és un *Word* que denota una instrucció. *state* és una
         instància de la classe **State**.El mètode executa la
         instrucció i, com a resultat, modifica l’estat del
         microcontrolador al qual accedeix a través del paràmetre
         corresponent. Per poder executar la instrucció l’ha de
         descodificar, obtenir els operands (fetch), calcular el
         resultat, modificar cnvenientment el registre d’estat i
         emmagatzemar el resultat.
        """
        pass


class Add(InstRunner): #Acabat
    """
    Classe ADD
    ==========
    Una instància de la classe **Add** és un executador específic per a la instrucció *ADD*.Si invoquem el seu mètode *execute()* executa una instrucció *ADD* del microcontrolador.
    
    """
    def __init__(self):
        """
        16-bit Opcode --> 0000 11rd dddd rrrr
        """
        
        self._n = 'ADD'
        self._mask = 0b1111110000000000
        self._opcode = 0b0000110000000000
        
  
    def execute(self,instr,state):
        op_d = Word(instr).extract_field_u(0b111110000) #d
        op_r = Word(instr).extract_field_u(0b1000001111) #r
        z = state.data[op_d]
        state.data[op_d] += state.data[op_r]
        x = state.data[op_d]
        y = state.data[op_r]
        if (~x[7]&~x[6]&~x[5]&~x[4]&~x[3]&~x[2]&~x[1]&~x[0]) == 0: # Set if the result is $00
            state.flags[1] = 1
        else:
            state.flags[1] = 0
        if x[7] == 1: # Set if MSB of the result is set; cleared otherwise.
            state.flags[2] = 1
        else:
            state.flags[2] = 0
        if (z[7]&y[7]|y[7]&~x[7]|~x[7]&x[7]) == 1:
            state.flags[0] = 1
        else:
            state.flags[0] = 0
        state.pc += 1 # Program Counter     
        

class Adc(InstRunner): #Acabat
    """
    Suma registre-registre amb carry.
    """
    def __init__(self):
        """
        16-bit Opcode --> 0001 11rd dddd rrrr
        """
        self._n = 'ADC'
        self._mask = 0b1111110000000000
        self._opcode = 0b0001110000000000

    def execute(self,instr,state):
        op_d = Word(instr).extract_field_u(0b111110000) #d
        op_r = Word(instr).extract_field_u(0b1000001111) #r
        z = state.data[op_d]
        state.data[op_d] += state.data[op_r]
        x = state.data[op_d]
        y = state.data[op_r]
        if (~x[7]&~x[6]&~x[5]&~x[4]&~x[3]&~x[2]&~x[1]&~x[0]) == 0: # Set if the result is $00
            state.flags[1] = 1
        else:
            state.flags[1] = 0
        if x[7] == 1: # Set if MSB of the result is set; cleared otherwise.
            state.flags[2] = 1
        else:
            state.flags[2] = 0
        if (z[7]&y[7]|y[7]&~x[7]|~x[7]&x[7]) == 1:
            state.flags[0] = 1
        else:
            state.flags[0] = 0
        state.pc += 1 # Program Counter 

class And(InstRunner): #Acabat
    """
    And registre-registre.
    """
    
    def __init__(self):
        self._n = 'AND'
        self._mask = 0b1111110000000000 
        self._opcode = 0b0010000000000000
    
    def execute(self,instr,state):
        op_d = Word(instr).extract_field_u(0b111110000) # d
        op_r = Word(instr).extract_field_u(0b1000001111) # r
        state.data[op_d] &= state.data[op_r] # &
        x = state.data[op_d]
        if (~x[7]&~x[6]&~x[5]&~x[4]&~x[3]&~x[2]&~x[1]&~x[0]) == 0: # Set if the result is $00
            state.flags[1] = 1
        else:
            state.flags[1] = 0
        if x[7] == 1: # Set if MSB of the result is set; cleared otherwise.
            state.flags[2] = 1
        else:
            state.flags[2] = 0
        state.pc += 1 # Program Counter


class Brbc(InstRunner): #Acabat

    """
    Salta a adreça de programa si cert bit de FLAGS és 0.
    """
    
    def __init__(self):
        self._n = 'BRBC'
        self._mask = 0b1111110000000000 
        self._opcode = 0b1111010000000000

    def execute(self,instr,state):
        k = instr.extract_field_s(0b1111111000) #k
        op_s = instr.extract_field_u(0b111) #s
        if not state.flags[op_s]:
            state.pc = state.pc + k + 1
        else:
            state.pc += 1

class Brbs(InstRunner): #Acabat

    """
    Salta a adreça de programa si cert bit de FLAGS és 1.
    """

    def __init__(self):
        self._n = 'BRBS'
        self._mask = 0b1111110000000000 
        self._opcode = 0b1111000000000000

    def execute(self,instr,state):
        k = Word(instr).extract_field_s(0b1111111000) #k
        op_s = Word(instr).extract_field_u(0b111) #s
        if state.flags[int(op_s)] == 1:
            state.pc = state.pc + k + 1
        else:
            state.pc += 1
        

class Break(InstRunner): #Acabat
    """
    Acaba l'execució
    """
    def __init__(self):
        """
        16-bit Opcode --> 1001 0101 1001 1000
        """
        self._n = 'BREAK'
        self._mask = 0b1111111111111111
        self._opcode = 0b1001010110011000

    def execute(self,instr,state):
        
        raise BreakException()

class Eor(InstRunner): #Acabat
    
    """
    Or exclusiva registre-registre.
    """
    
    
    def __init__(self):
        """
        16-bit Opcode --> 0010 01rd dddd rrrr
        """
        self._n = 'EOR'
        self._mask = 0b1111110000000000 
        self._opcode = 0b10010000000000

    def execute(self,instr,state):
        op_d = Word(instr).extract_field_u(0b111110000) # d
        op_r = Word(instr).extract_field_u(0b1000001111) # r
        state.data[op_d] = state.data[op_d] ^ state.data[op_r]
        x = state.data[op_d]
        if (~x[7]&~x[6]&~x[5]&~x[4]&~x[3]&~x[2]&~x[1]&~x[0]) == 0: # Set if the result is $00
            state.flags[1] = 1
        else:
            state.flags[1] = 0
        if x[7] == 1: # Set if MSB of the result is set; cleared otherwise.
            state.flags[2] = 1
        else:
            state.flags[2] = 0
        state.pc += 1 # Program Counter


class Ldi(InstRunner): #Acabat

    """
    Assigna valor a registre.
    """
    def __init__(self):
        """
        16-bit Opcode --> 1110 KKKK dddd KKKK
        """
        
        self._n = 'LDI'
        self._mask = 0b1111000000000000 
        self._opcode = 0b1110000000000000

    def execute(self,instr,state):
        k = Word(instr).extract_field_u(0b111100001111) # K
        op_d = Word(instr).extract_field_u(0b000011110000) + 16 # d
        state.data[op_d] = k # Rd<--K 
        state.pc += 1 # Program Counter

class Lds(InstRunner): #Acabat
    """
    Còpia memòria a registre.
    """
    def __init__(self):
        self._mask = 0b1111100000000000
        self._opcode=0b1010000000000000
        self._n="LDS"
    
    def execute(self,instr,state):
        op_d = instr.extract_field_u(011110000) +16
        K = instr.extract_field_u(0b011100001111) +32
        state.data[op_d]=state.data[K]#Rd=K
        state.pc+=1
        

class Lsr(InstRunner):
    """
    Desplaçament dreta registre.
    """
    def __init__(self):
        """
        16-bit Opcode --> 1001 010d dddd 0110
        """
        self._n = 'LSR'
        self._mask = 0b1111111000001111
        self._opcode = 0b1001010000000110
        
    def execute(self,instr,state):
        
        op_d = instr.extract_field_u(0b111110000) # d
        x = state.data[op_d] 
        state.flags[0] = x[0]
        if (~x[7]&~x[6]&~x[5]&~x[4]&~x[3]&~x[2]&~x[1]&~x[0]) == 0: # Set if the result is $00
            state.flags[1] = 1
        else:
            state.flags[1] = 0
        state.flags[2] = 0

        state.pc += 1 #Program Counter
        

class Mov(InstRunner): #Acabat
    """
    Còpia registre-registre.
    """
    def __init__(self):
        """
        16-bit Opcode --> 0010 11rd dddd rrrr
        """
        self._n = 'MOV'
        self._mask = 0b1111110000000000
        self._opcode = 0b0010110000000000

    def execute(self,instr,state):
        op_d = Word(instr).extract_field_u(0b111110000) # d
        op_r = Word(instr).extract_field_u(0b1000001111) # r
        state.data[op_d] = state.data[op_r] # Rd<--Rr
        state.pc += 1

class Nop(InstRunner): #Acabat
    """
    No fa res. Es la instrucció nul.la.
    """
    def __init__(self):
        """
        16-bit Opcode --> 0000 0000 0000 0000
        """

        self._n = 'NOP'
        self._mask = 0b1111111111111111
        self._opcode = 0b0000000000000000

    def execute(self,instr,state):
        state.pc += 1

class Or(InstRunner): #Acabat
    """
    Or registre-registre.
    """
    def __init__(self):
        """
        16-bit Opcode --> 0010 10rd dddd rrrr
        """
        self._n = 'OR'
        self._mask = 0b1111110000000000
        self._opcode = 0b0010100000000000

    def execute(self,instr,state):
        op_d = Word(instr).extract_field_u(0b111110000) # d
        op_r = Word(instr).extract_field_u(0b1000001111) # r
        state.data[op_d]= state.data[op_d] | state.data[op_r] # Rd<--Rd v Rr
        x = state.data[op_d]
        if (~x[7]&~x[6]&~x[5]&~x[4]&~x[3]&~x[2]&~x[1]&~x[0]) == 0: # Set if the result is $00
            state.flags[1] = 1
        else:
            state.flags[1] = 0
        if x[7] == 1: # Set if MSB of the result is set; cleared otherwise.
            state.flags[2] = 1
        else:
            state.flags[2] = 0
        state.pc += 1 # Program Counter
        

class Rjmp(InstRunner): #Acabat
    """
    Salt relatiu a una nova instrucció.
    """
    def __init__(self):
        """
        16-bit Opcode --> 1100 kkkk kkkk kkkk
        """
        self._n = 'RJMP'
        self._mask = 0b1111000000000000
        self._opcode = 0b1100000000000000

    def execute(self,instr,state):
        k = instr.extract_field_s(0b111111111111) # k
        state.pc = state.pc + k + 1

class Sts(InstRunner): #Acabat
    """
    Còpia registre a memòria.
    """
    def __init__(self):
        """
        16-bit Opcode --> 1010 1kkk dddd kkkk
        """
        self._n = 'STS'
        self._mask = 0b1111100000000000
        self._opcode=0b1010100000000000

    def execute(self,instr,state):
        k = instr.extract_field_u(0b11100001111)+32 # k
        op_r = instr.extract_field_u(0b11110000)+ 16  # r
        state.data[k] = state.data[op_r] # (k)<--Rr
        state.pc += 1 # Program Counter
    
class Sub(InstRunner): #Acabat 
    """
    Resta registre-registre sense carry.
    """
    def __init__(self):
        """
        16-bit Opcode --> 0001 10rd dddd rrrr
        """
        self._n = 'SUB'
        self._mask = 0b1111110000000000
        self._opcode = 0b0001100000000000

    def execute(self,instr,state):
        op_d = Word(instr).extract_field_u(0b111110000) # d
        op_r = Word(instr).extract_field_u(0b1000001111) # r
        z = state.data[op_d]
        state.data[op_d] -= state.data[op_r] # Rd<--Rd-Rr
        x = state.data[op_d]
        y = state.data[op_r]
        if (~x[7]&~x[6]&~x[5]&~x[4]&~x[3]&~x[2]&~x[1]&~x[0]) == 0: # Set if the result is $00
            state.flags[1] = 1
        else:
            state.flags[1] = 0
        if x[7] == 1: # Set if MSB of the result is set; cleared otherwise.
            state.flags[2] = 1
        else:
            state.flags[2] = 0
        if (~z[7]&y[7]|y[7]&x[7]|x[7]&~x[7]) == 1:
            state.flags[0] = 1
        else:
            state.flags[0] = 0
        state.pc += 1 # Program Counter
        

class Subi(InstRunner): #Acabat
    """
    Resta registre-constant sense carry.
    """
    def __init__(self):
        """
        16-bit Opcode --> 0101 kkkk dddd kkkk
        """
        self._n = 'SUBI'
        self._mask = 0b1111000000000000
        self._opcode = 0b0101000000000000
        
    def execute(self,instr,state):

        op_d = Word(instr).extract_field_u(0b11110000) + 16 #d 
        k = Byte(instr).extract_field_s(0b111100001111) # k
        z = state.data[op_d]
        state.data[op_d] -= k # Rd<--Rd-K
        x = state.data[op_d]
        y = Byte(k)
        y=y[7]
        if (~x[7]&~x[6]&~x[5]&~x[4]&~x[3]&~x[2]&~x[1]&~x[0]) == 0: # Set if the result is $00
            state.flags[1] = 1
        else:
            state.flags[1] = 0
        if x[7] == 1: # Set if MSB of the result is set; cleared otherwise.
            state.flags[2] = 1
        else:
            state.flags[2] = 0
        if (~x[7]&z[7]|z[7]&x[7]|x[7]&~x[7]) == 1:
            state.flags[0] = 1
        else:
            state.flags[0] = 0
        state.pc += 1 # Program Counter


class In(InstRunner):
    """
    Quan s’aplica al port 0x0, llegeix un caràcter del teclat.
    """
    
    def __init__(self):
        self._n = "IN"
        self._mask = 0b1111100000000000
        self._opcode = 0b1011000000000000

    def execute(self,instr,state):
        op_d = instr.extract_field_u(0b00111110000) #d
        A = instr.extract_field_u(0b11000001111) #A
        if A == 0:
            afegir=raw_input("Prem una tecla: ")
            state.data[op_d]=ord(afegir)
        state.pc += 1

class Out(InstRunner):
    """
    S’usa per escriure per la pantalla. Quan el port és:
    0x0 Escriu el valor del registre corresponent pel terminal en base 10.
    0x1 Escriu el valor del registre corresponent pel terminal en base 16.
    """
    
    def __init__(self):
        self._n = "OUT"
        self._mask = 0b1111110000000000
        self._opcode = 0b1011100000000000

    def execute(self,instr,state):
        op_r = instr.extract_field_u(0b00111110000) #r
        A = instr.extract_field_u(0b11000001111) #A
        if A == 0:
            print (int(state.data[op_r]))
        elif A == 1:
            print state.data[op_r]
        else:
            print chr(state.data[op_r])
        state.pc+=1
        
class BreakException(AVRException):
    pass

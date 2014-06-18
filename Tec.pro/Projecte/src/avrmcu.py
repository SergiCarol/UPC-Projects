# -*- encoding:utf-8 -*-

from state import *
from repertoir import *

class AvrMcu(object):
    """
    AvrMcu és una classe les instàcies de la qual són simuladors de l'MCU AVR. La seva important és executar un programa escrit en assemblador de l'AVR.
    """
    def __init__(self):
        """
         Inicialitza el simulador. Particularment, fa un reset de l'estat: esborra les memòries, inicialitza el PC i les FLAGS a 0. Inicilitza el repertori d'instruccions amb les instàncies d'InstRunner corresponents.
        """
        self._s = State()
        self._rep = Repertoir([Add(),Adc(),Sub(),Subi(),And(),Or(),Eor(),Lsr(),Mov(),Ldi(),Sts(),Lds(),Rjmp(),Brbs(),Brbc(),Nop(),Break(),In(),Out()])
        
    def reset(self):
        """
        Fa un reset d l'estat deixant-lo de la mateixa forma que el mètode __init__
        """
        self._s = State()

    def set_prog(self,p):
        """
        p és una llista d'enters que representen un programa en llenguatge màquina de l'AVR. El mètode instal·la el programa p en la memoria de programa del simulador a partir de l'adreça 0000.
        """
        for index, value in enumerate(p):
            self._s.prog[index]=value

    def dump_dat(self):
        """
        Retorna un str que representa un bolcat de la memòria de dades del simulador
        """
        return self._s.dump_dat()

            
    def dump_reg(self):
        """
        Retorna un string que correspon amb un bolcat dels registres del simulador
        """
        return self._s.dump_reg()

    def dump_prog(self):
        """
        Retorna un str que representa un bolcat de la memoria de programa del simulador
        """
        return self._s.dump_prog()

    def run(self):
        """
        És el mètode principal del simulador. Quan s'invoca inicia una iteració infinita que:
        a) Obtè la instrucció indicada del PC.
        b) Busca un InstRunner que pugui executar aquesta instrucció.
        c) Executa la instrucció.
        """
    
        try:
            while True:                
                instruc=self._s.prog[self._s.pc]
                i=self._rep.find(instruc) #Busquem la instrucció
                i.execute(instruc,self._s) #Executem la instrucció
            
        except UnknownCodeError:
            print "No existeix instrucció"
        except BreakException:
            print "Simulació acabada"
            return True
            
                
    def set_trace(self,t):
        """
        Quan s'invoca amb t=True activa el mode trace de la memòria de dades. Si s'activa amb t=False es desactica el mode.
        """
        if t == True:
            
            self._s.data.trace_on()
        else:
            self._s.data.trace_off()

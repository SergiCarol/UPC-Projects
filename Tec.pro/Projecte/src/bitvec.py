# -*- encoding:utf-8 -*-
"""
Aquesta classe es l'encarregada de utilitzar el bits d'informació basica que utilitza l'AVR. Consisteix en tres classes:

 - Classe BitVector: La classe Bitvector es la superclasse de les dues altres classes del modul. Es l'encarregada de mantenir tots el metodes per a operar amb Bytes y Words.

 - Classe Byte: La classe Byte es una subclase de la classe Bitvector. Serveix per a indicar que fem referencia a un rang de dades de 8 bits.

 - Classe Word: La classe Word es una subclase de la classe Bitvector. Serveix per a indicar que fem referencia a un rang de dades de 16 bits.
"""

class BitVector(object):

	def __init__(self,w=0):
		"""
		Inicialitza l'objecte amb un valor inicial de w. Cal
		assegurar-se que només s'usen els k bits de menys de
		w, on k és la longitud en bits de self. Aixó
		s'aconsegueix aplicant la màscara corresponent. Noteu
		que el valor de k dependrà de la subclasse concreta
		que s'estigui instanciant.
		"""
		self._w = w

	def extract_field_u(self,mask):
		"""
		Mask és un enter que s'interpreta co m una màscara
		bianria. Retorna sempre un enter positiu. L'objectiu
		d'aquest mètode és facilitar l'extracció de camps
		d'una paraula com ara el número de registre en el de
		la instrucció ADD. Que donada una màscara mask que
		indica un subconjunt de bits de la paraula self,
		aquest mètode torna l'enter sense signe representat
		per aquest subconjunt de bits.
		"""
		aux = 1
		aux2 = 1
		sortida = 0
		while aux < 2 ** len(self):
		    if (aux & mask) != 0:
		        if (aux & int(self._w)) != 0:
		            sortida = sortida | aux2
		        aux2 *= 2
		    aux *= 2
		return sortida

	def extract_field_s(self,mask):
		"""
		Fa exactament el mateix que el mètode
		anterior però interpreta el resultat
		com un enter amb signe. Pot retorna
		doncs en un enter positiu o
		negatiu. S'assumeix que la codificació
		és complement a dos.
		"""
		sortida = 0
		elevado = 0
		aux = 1
		aux2 = 1
		while aux < 2 ** len(self):
		    if (aux & mask) != 0:
		        elevado += 1
		        if (aux & int(self._w)) != 0:
		            sortida = sortida | aux2
		        aux2 *= 2
		    aux *= 2
		if sortida >= 2 ** (elevado-1):
		    sortida -= 2 ** elevado
		return sortida

	def __int__(self):
		"""
		Torna el valor corresponent a self interpretat sempre
		com a un valor sense signe
		"""
		if len(self) == 8: 
			return int(self._w & 255) 
		if len(self) == 16: 
			return int(self._w & 65535)

	def __index__(self):
		"""
		Torna el mateix que en el mètode anterior. Consulteu
		el manual de Python per entendre quin paper juga aques
		mètode.
		"""
		return self._w

	def __repr__(self):
		"""
		Torna la representació en hexadecimal el valor de
		BitVector. Cal tenir en compte la llargada de la
		paraula i escriure sempre el nombre de dígits
		corresponents. Per exemple, si la llargada de la
		paraula és d'un byte i és 10, __repr__ hauria
		d'escriure 0A i no pas A
		"""
		if len(self)==8:
           		return '{0:02X}'.format(int(self._w & 255))
			
        	else:
			return '{0:04X}'.format(int(self._w & 65535))

	def __add__(self,o):
		"""
		Suma paraules. Retorna sempre un objecte de la mateixa
		classe que self. També admeten que el segon operand ,
		o, sigui un int o un BitVector indistintament.
		"""
		a = int(self)
		b = int(o)
		return type(self)(a+b)

	def __sub__(self,o):
		"""
		Resten paraules. Retorna sempre un objecte de la
		mateixa classe que self. També admeten que el segon
		operand , o, sigui un int o un BitVector
		indistintament.
		"""
		a = int(self)
		b = int(o)
		return type(self)(a-b)

	def __and__(self,o):
		"""
		Implmenta les corresponents operacions booleanes bit a
		bit. Els mètodes retornen un objecte de la mateixa
		classe self.
		"""
		a = int(self)
		b = int(o)
		return type(self)(a&b)
	
	def __or__(self,o):
		"""
		Implmenta les corresponents operacions booleanes bit a
		bit. Els mètodes retornen un objecte de la mateixa
		classe self.
		"""
		a = int(self)
		b = int(o)
		return type(self)(a|b)

	def __xor__(self,o):
		"""
		Implmenta les corresponents operacions booleanes bit
		a bit. Els mètodes retornen un objecte de la mateixa
		classe self.
		"""
		a = int(self)
		b = int(o)
		return type(self)(a^b)

	def __invert__(self):
		"""
		Implmenta les corresponents operacions booleanes bit a
		bit. Els mètodes retornen un objecte de la mateixa
		classe self.
		"""
		a = int(self)
		return type(self)(~a)

   	def __rshift__(self,i):
		"""
		Implementen les operacions de rotació dreta. Retornen
		un objecte de la mateixa classe que self. En cas que i
		estigui fora de rang, el mètode aixeca l'excepció
		IndexError.
		"""
		i= int(i)
		if i <= len(self):
			return type(self)(self._w >>i)
		else:
		    raise IndexError("S'ha intentat rotar molt")

	def __lshift__(self,i):
		"""
		Implementen les operacions de rotació
		esquerrra. Retornen un objecte de la mateixa classe
		que self. En cas que i estigui fora de rang, el mètode
		aixeca l'excepció IndexError.
		"""
		i = int(i)
		if i<=len(self):
		    return type(self)(self._w << i)
		else:
		    raise IndexError("S'ha intentat rotar molt")
	def __eq__(self,o):
		"""
		Implmenten la igualtat. Cal tenir en compte que per
		decidir si dos BitVector són iguals només s'han de
		considerar els bits inclosos dins de la mida de la
		paraula.
		"""
		a = int(self)
		b = int(o)
		if a == b:
			return True
		else:
			return False

	def __ne__(self,o):
		"""
		Implmenten la diferencia. Cal tenir en compte que per
		decidir si dos BitVector són iguals només s'han de
		considerar els bits inclosos dins de la mida de la
		paraula.
		"""
		a = int(self)
		b = int(i)
		if a != b:
			return True
		else:
			return False

	def __getitem__(self,i):
		"""
		Permet implementar l'accés  als bits d'una paraula individualment. Si w és un BitVector, llavors es pot escriure w[3] per accedir al quart bit de la paraula. w[3] retorna un bool ja que els bits individuals els representen com a valors booleans. En cas que l'index emprat superi la mida de la paraula, el llença l'exepció KeyError.
		"""
		a = int(self)
		if len(self)-1>=i:
		    	aux = int((a & (1<<i))>>i)
		    	return aux
		else:
		    	raise KeyError("No existeix aquest bit")
		    

	def __setitem__(self,i,v):
		"""
		Permet impl xementar l'accés als bits d'una paraula
		individualment. Si w és un BitVector, llavors es pot
		escriure w[3] per accedir al quart bit de la
		paraula. w[3] retorna un bool ja que els bits
		individuals els representen com a valors booleans. En
		cas que l'index emprat superi la mida de la paraula,
		el llença l'exepció KeyError.
		"""
           	if len(self)-1>=i:
		    if v==0:
		        self._w  &= ~(1<<i)
		    elif v==1:
		        self._w |= 1<<i
		else:
		    raise KeyError("No existeis aquest bit")




class Byte(BitVector):
	"""
        Representa una paraula de 8 bits, és a dir un byte

        Mètodes:

        -------

            * .. function:: __len__(self)

            * .. function:: concat(self,b)
        """

	def __len__(self):
                """
                Sempre torna l'enter 8 atès que un byte son 8 bits.
                """

		return 8
	
	def concat(self,b):
		    

                """

                Concatena self amb el Byte b i retorna un objecte de classe Word. Noteu que self és el MSB i b el LSB.

                """

		return Word((self._w<< 8) + int(b))

class Word(BitVector):
	        """

        Representa una paraula de 16 bits.

        Mètodes:

        -------

            * .. function:: __len__(self)

            * .. function:: lsb(self)

            * .. function:: msb(self)

        """
		def __len__(self):
		    """

                Sempre torna l'enter 16 atès que un word són 16 bits

                return 16

                """

		    return 16

		def lsb(self):
		    """

                Retorna el Byte de menys i més pes repectivament 

                """

		    return Byte(int(self._w))

		def msb(self):
		    """

                Retorna el Byte de menys i més pes repectivament 

                """

		    return Byte(int(self._w) >> 8)






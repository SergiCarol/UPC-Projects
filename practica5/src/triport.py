# -*- encoding:utf-8 -*-
from node import *

class triport(object):
		
	def __init__(self,i1,i2,o):
		self._i1 = i1
		self._i2 = i2
		self._out = o

	def tick(self):
		estat1=self._i1.ask()
	        estat2=self._i2.ask()
		resultat=self._do_function(estat1,estat2)
		self._out.say(resultat)

	def __repr__(self):
		estat1=self._i1.ask()
	        estat2=self._i2.ask()
		return (("\nEstat 1: " + str(estat1) +"\nEstat 2: " +  str(estat2)+  "\nSortida: " +str(self._out) +  '\n'+" "+"Operació: " + str(self.get_name())))

class And(triport):

	def _do_function(self,e1,e2):
		return e1&e2

	def get_name(self):
		return "And"
		
class Or(triport):

	def _do_function(self,e1,e2):
		return e1|e2

	def get_name(self):
		return "Or"



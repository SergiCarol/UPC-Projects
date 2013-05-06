# -*- encoding: utf-8 -*-

from datetime import *

class Dataset(object):

	def __init__(self,name=''):
		self._name = name
		self._ds= []

	def __len__(self):
		return len(self._ds)

	def __str__(self):
		return str("Nom del sensor: ") + str(self._name) + str("\n\nInformació: ") + str(self._ds)

	def add(self,t,v):
		encontrado = False
		for x in self._ds:
			if t <= x[0]:
				encontrado = True
				"""
				Aqui falta poner el error.
				"""
				break
		if encontrado == False:	
			self._ds += [(t,v)]

	def time_vector(self):
		temp = []
		for x in self._ds:
			temp += [x[0]]
		return temp

	def value_vector(self):
		temp = []
		for x in self._ds:
			temp += [x[1]]
		return temp

	def decimate(self,k=10):
		l = []
		for x in self._ds:
			k += x[1]
		if len(self._ds) == 0:
			aux = 1
		media = k/aux
		l += [(self._ds[len(self._ds)-1][0],media)]

	def moving_average(self,k=50):
		l = []
		aux = 0
		for x in self._ds:
			for
			

	def concat(self,ds2):
		if(self._ds[len(self._ds)-1][0]) >= ds2._ds[0][0]:
			"""
			Aqui falta poner el error
			"""
			pass
		else:
			self._ds += ds2._ds

	def transform(self,a=1.0,b=0.0):
		l = []
		for x in self._ds:
			l +=(x[0],a*x[1]+b)
		self._ds = l
			

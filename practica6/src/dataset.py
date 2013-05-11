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
				break
			else:
				raise Outofexception 
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
		d = DataSet(self._name)
		vegades = len(self._ds)/k
		residu = len(self._ds)%k
        	aux = k
		for x in range(vegades):
			sumador = 0
			for y in range(k):
				sumador += self._ds[k*x+y][1]
			sumador = sumador/10
			d.add(self._ds[k*x+9],sumador)
		sumador = 0
		for y in range(residu):
			sumador += self._ds[k*vegades+y][1]
			sumador = sumador/residu
			d.add(self._ds[len(self._ds)-1][0],sumador)
		return d
				
			


	def moving_average(self,k=50):
		d = DataSet(self._name)
		for x in range(len(self._ds)):
			if x != 0:
				temp = x
				aux2 = 0
				aux = 0
				while temp >= 0 and aux2 <= k:
					aux += self._ds[x][0]
				if aux2 == k:
					aux = aux/k
				else:
					aux = aux/temp
				d.add(self._ds[x][1],aux)
		return d	
		

	def concat(self,ds2):
		if(self._ds[len(self._ds)-1][0]) >= ds2._ds[0][0]:
			raise Outofexception
		else:
			self._ds += ds2._ds

	def transform(self,a=1.0,b=0.0):
		l = []
		for x in self._ds:
			l +=(x[0],a*x[1]+b)
		self._ds = l
			
class Outofexception (Exception):
	pass

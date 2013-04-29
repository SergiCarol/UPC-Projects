import datetime
class Dataset(object):

	def __init__(self,name=''):
		self._name = name
		self._ds= []

	def __len__(self):
		return len(self._ds)

	def __str__(self):
		return str("Nom del sensor: ") + str(self._name) + str("\n\nInformació: ") + str(self._ds)

	def add(self,t,v):
		self._ds += [(t,v)]

	def time_vector(self):
		temp = []

	def value_vector(self):
		pass

	def decimate(self,k=10):
		pass

	def moving average(self,k=50):
		pass

	def concat(self,ds2):
		pass

	def transform(self,a=1.0,b=0.0):
		pass

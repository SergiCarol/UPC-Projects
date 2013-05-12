# -*- encoding:utf-8 -*-

import matplotlib.pyplot as plt
from dataset import Dataset


class DataSetPlot(object):
	"""
	La classe *dsplot* será l'encarregat d'imprimir la grafica a pantalla, dese l'informació rebuda desde el *dataset*
	"""
	def __init__(self):
		"""
		Inicialitza un objecte de la classe. En essencia la inicialitzacio s’encarrega de definir tota la grafica excepcio feta de les dades a visualitzar.
		"""
		self.fig = plt.figure()
		self.p = plt.plot([], [])
		plt.legend([''])
	        plt.title("Grafica dades dels sensors")
		plt.grid(True)

	def plot(self,d):
		"""
		Afegeix a la grafica un conjunt de dades determinat per DataSet d. Si s’afegeix mes d’un DataSet es representa cadascun d’un color diferent. L’etiqueta de la llegenda corresponent a aquest *DataSet* es el nom del mateix.
		"""
		self.p=plt.plot([d.time_vector()], [d.value_vector()])
		plt.legend([d._name])
		
		
	def show(self):
		"""
		Mostra la grafica per la pantalla. El metode no retorna fins que l’usuari tanca la finestra de la grafica.
		"""
		plt.show()





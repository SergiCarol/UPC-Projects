# -*- encoding:utf-8 -*-

import matplotlib.pyplot as plt
from dataset import Dataset


class DataSetPlot(object):

	def __init__(self):	
		self.fig = plt.figure()
		self.p = plt.plot([], [])
		plt.legend([''])
	        plt.title("Grafica dades dels sensors")
		plt.grid(True)

	def plot(self,d):
		
		d=Dataset()
		print d
		self.p=plt.plot([d.time_vector()], [d.value_vector()])
		plt.legend([d._name])
		
	
	def show(self):
		plt.show()





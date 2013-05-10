# -*- encoding:utf-8 -*-

import matplotlib.pyplot as plt
import matplotlib.dates as dates
from dataset import Dataset


class DataSetPlot(object):

	def __init__(self):	
		self.fig=plt.figure()
		self.p = plt.plot([], [])
	
		self.l = plt.legend([''])
		
	

	def plot(self,d):
		d=DataSet()
		self.p = ([d.time_vector()], [d.value_vector()])
		self.l = ([d._name()])		

	def show(self):

	   
            self.p.show()





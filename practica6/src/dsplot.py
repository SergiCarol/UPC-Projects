# -*- encoding:utf-8 -*-

import matplotlib.pyplot as plot
import matplotlib.dates as dates
from dataset import Dataset


class DataSetPlot(object):

	def __init__(self):	

		self.p = plot.plot([], [])
		self.a = plot.axis([1,2 ,4 ,5 ,3])
		self.l = plot.legend([''])
		self.count = 0
		self.plt.grid(True)
	

	def plot(self,d):
		d=DataSet()
		self.p = ([d.time_vector()], [d.value_vector()])
		self.l = ([d._name()])		
	
		self.count += 1
		if self.count == 4:
			self.count == 0

		self.a= ([self.hour,self.dateformat])

	def show(self):

	   
            self.p.show()





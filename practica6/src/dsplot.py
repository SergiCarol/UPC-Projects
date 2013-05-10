# -*- encoding:utf-8 -*-

import matplotlib.pyplot as plot
import matplotlib.dates as dates
from dataset import DataSet


class DataSetPlot(object):

	def __init__(self):	

		self.p = plot.plot([], [])
		self.a = plot.axis([, , , ])
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





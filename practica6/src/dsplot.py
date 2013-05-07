# -*- encoding:utf-8 -*-

from pylab import figure
import matplotlib.pyplot as plot
import matplotlib.dates as dates
from dataset import DataSet


class DataSetPlot(object):

	def __init__(self):	

		self.p = plot.plot([], [])
		self.a = plot.axis([1, 7, 18, 30])
		self.l = plot.legend([''])
		self.count = 0
		self.plt.grid(True)
	

	def plot(self,d):
		d=DataSet()
		self.p = ([d.time_vector()], [d.value_vector()], color[self.count])
		self.l = ([d._name()])		
		color = ['r', 'g', 'y', 'b']
		self.count += 1
		if self.count == 4:
			self.count == 0

	

    def show(self):

        ax = f.add_subplot(111)
        for e in ax.get_xticklabels():
            e.set_rotation(60)
            ax.xaxis.set_major_formatter(dat.DateFormatter('%d/%m %H:%M'))
            f.autofmt_xdate()
            self.p.show()





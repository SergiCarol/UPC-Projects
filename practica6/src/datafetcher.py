# -*- encoding_utf-8 -*-
from urllib2 import *
from dataset import Dataset
from datetime import *
import csv
class DataSetFetcher(object):
    def __init__(self,url='http://localhost:8000'):
        self.url=url
    
    def fetch(self,dia,sensor=0):
        Data=Dataset("Sensor"+str(sensor))
        dia_temps="dades_"+dia.strftime("%y")+"_"+dia.strftime("%m")+"_"+dia.strftime('%d')
        pag=urlopen.(self.url+"/"+dia_temps)
        
        with open(dades_11_08_01, 'rb') as f:
            reader = csv.reader(f)
            for row in reader:
                print row
                if row[1]==sensor:
                    Data.add(row[0],row[2])
                        
  


	
    def fetch_interval(self,from_day,to_day,sensor=0):
        Data=Dataset("Sensor"+str(sensor))
        #Mirar aquet tros, segurament es te que canviar
	d = date(from_day)
        d2 = date(to_day)
        while d < d2:
            self.fetch(d,sensor)
            d= d+ timedelta(days=1)
        




class UnknownDataSetException (Exception):
    pass

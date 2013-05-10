# -*- encoding_utf-8 -*-
import urllib2
from dataset import Dataset
from datetime import *
class DataSetFetcher(object):
    def __init__(self,url='http://localhost:8000'):
        self.url=url
    ±
    def fetch(self,dia,sensor=0):
        Data=Dataset("Sensor"+str(sensor))
	d= date(dia)
        dia_temps="dades_"+d.strftime("%y")+"_"+d.strftime("%m")+"_"+d.strftime('%d')
        try:
            pag=urllib2.urlopen(self.url/dia_temps)
            with open(pag, 'rb') as f:
                reader = csv.reader(f)
                for row in reader:
                    if row[1]=sensor:
                        Data.add(row[0],row[2])
                        
        except: 
            raise UnkownDataSetException()


	
    def fetch_interval(self,from_day,to_day,sensor=0):
        Data=Dataset("Sensor"+str(sensor))
	d = date(from_day)
        d2 = date(to_day)
        while d < d2:
            self.fetch(d,sensor)
            d= d+ datedela(days=1)
        




class UnknownDataSetException (Exception):
    pass

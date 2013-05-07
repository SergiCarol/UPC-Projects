# -*- encoding_utf-8 -*-
import urllib2
from dataset import Dataset
from datetime import *
class DataSetFetcher(object):
    def __init__(self,url='http://localhost:8000'):
        self.url=url
    
    def fetch(self,dia,sensor=0):
        Data=Dataset("Sensor"+str(sensor))
	d= date(dia)
        dia_temps="dades_"+d.strftime("%y")+"_"+d.strftime("%m")+"_"+d.strftime('%d')
        
        pag=urllib2.urlopen(self.url/dia_temps)
        for element in pag.readlines():
            if element[9]==sensor:
                Data.add("""
	         	 Afegir lo del cvs
			 """ )	
	    else:
		raise UnkownDataSetException()

	
    def fetch_interval(self,from_day,to_day,sensor=0):
        Data=Dataset("Sensor"+str(sensor))
	d= date(dia)




class UnknownDataSetException (Exception):
    pass

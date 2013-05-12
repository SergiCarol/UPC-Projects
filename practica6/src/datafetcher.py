# -*- encoding:utf-8 -*-

from urllib2 import *
from dataset import Dataset
from datetime import *
import csv

class DataSetFetcher(object):
    """
    La classe *datasetfetcher* serà l'encarregada de buscar en internet les dades del sensor que es vulgui trobar.
    """
    def __init__(self,url='http://localhost:8000'):
	"""
	Inicialitza els objectes de la classe. Cal indicar el servidor d’on cal obtenir els fitxers de dades.
	"""
        self.url=url
    
    def fetch(self,dia,sensor=0):
	"""
	El mètode retorna un DataSet de nom *SensorX*, essent X el numero de sensor, que conte les observacions del sensor sensor corresponents al dia dia. dia es un objecte de classe date. Si no es poden obtenir les dades aixeca l'excepció *UnknownDataSetException*.
	"""
        Dat=Dataset("Sensor "+str(sensor))
        dia_temps="/dades_"+dia.strftime("%y")+"_"+dia.strftime("%m")+"_"+dia.strftime('%d')
        pag=urlopen(self.url+dia_temps)
        reader = csv.reader(pag)
        try:

            for row in reader:
            
                if row[1]==sensor:
                    Dat.add(row[0],row[2])
            return Dat
                                
        except:
            raise UnknownDataSetException()
        

	
    def fetch_interval(self,from_day,to_day,sensor=0):
	"""
	El mètode retorna un DataSet de nom *SensorX*, essent X el numero de sensor, que conte les observacions del sensor sensor corresponents als dies que van de from day a to day incloent el primer i excloent el darrer. from day i to day son objectes de la classe date. Si no es poden obtenir les dades aixeca l'excepció *UnknownDataSetException*.
	"""
        Data=Dataset("Sensor"+str(sensor))
        while from_day < to_day:
            self.fetch(d,sensor)
            from_day= from_day+ timedelta(days=1)
        




class UnknownDataSetException (Exception):
    """
    Aquest error s'aixecarà en alguns casos de les funcions *fetch_interval* i *fetch*.
    """
    pass

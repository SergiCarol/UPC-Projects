# -*- encoding_utf-8 -*-
import urllib2
class DataSetFetcher(object):
    def __init__(self,url='http://localhost:8000'):
        self.url=url
    
    def fetch(self,dia,sensor=0):
        pag=urllib2.urlopen(self.url)
        








class UnknownDataSetException (Exception):
    pass

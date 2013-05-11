# -*- encoding_utf-8 -*-

import sys
from dataset import Dataset
from datafetcher import DataSetFetcher
from sensortransf import *
from dsplot import DataSetPlot
d=Dataset()
fet=DataSetFetcher()
plt=DataSetPlot()
elem1=sys.argv[1]
elem2=sys.argv[3]
elem3=sys.argv[5]
elem4=sys.argv[7]
web=' '
numsenors=[]
diafinal=False
i=0
numdia=0
numdia2=0
for x in sys.argv[:]:
    if x[i]=="-v":
        web=str(sys.argv[x[i+1]])
    elif x[i]=="-s":
        numsenors.append(x[i+1])
    elif x[i]=="-d":
        numdia+=(i+1)
    elif x[i]=="-f":
        numdia2+=(i+1)
        diafinal=True
if diafinal==False:
   
    for element in numsenors:
        fet.fetch(sys.argv[numdia],element)
        normalize(d,element)
        d.decimate()
        d.moving_average()
        plt.show()

else:

    for ele in numsenors:
        fet.fetch_interval(sys.argv[numdia],sys.argv[numdia2],ele)
        normalize(d,element)
        d.decimate()
        d.moving_average()
        plt.show()

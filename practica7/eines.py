# -*- encoding:utf-8 -*-
import time
import random 

def llista(n):
    i=0
    a=[]
    while n>i:
        ran=random.randint(0,(2*n))
        a+=[ran]
            
        i+=1
    
    return a

def clk_reset():
    start=time.time()
    return start
def clk_counter(r):
    temps_total=time.time()-r
    return temps_total



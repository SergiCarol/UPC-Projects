# -*- encoding:utf-8 -*-
import time
import random 
import time
def eines(n):
    reset=clk_reset()
    i=0
    a=[]
    while n>i:
        ran=random.randint(0,(2*n))
        a+=[ran]
            
        i+=1
    clk_counter(reset)
    return a

def clk_reset():
    start=time.time()
    return start
def clk_counter(r):
    temps_total=time.time()-r
    print temps_total
    return temps_total
n=20 
print eines(n)

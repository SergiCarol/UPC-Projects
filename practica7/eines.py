# -*- encoding:utf-8 -*-
import random 
import time
def eines(n):
    clk_reset()
    i=0
    a=[]
    while n>i:
        ran=random.randint(0,(2*n))
        a+=[ran]
            
        i+=1 
    return a

def clk_reset():
    start=time.clock()
    return start
def clk_counter():
    a=clk_reset()
    for a in range(1000):
        l= [2] * 20000
        x=0
        for i in l:
            x+= i
    mesura= time.rell() -a
    print' {0:8.5f} ms'.format(mesura)

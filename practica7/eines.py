# -*- encoding:utf-8 -*-
print "Adios"
import random 
def eines(n):
    i=0
    a=[]
    while n>i:
        ran=random.randint(0,(2*n))
        a+=[ran]
            
        i+=1    
    return a
print eines(20)


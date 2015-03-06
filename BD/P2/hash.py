#-*- encoding: utf-8 -*-

def hash_(a,t):
    hash=0
    for c in a:
        hash= 101*hash + ord(c)
    return hash%t

print hash_("hola",7919)
print hash_("hola",7919)

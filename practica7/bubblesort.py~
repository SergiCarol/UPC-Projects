# -*- encoding:utf-8 -*-

import eines

def ordenar(a):
	"""
	La funció *ordenar* será l'encarregada de rebre una llista de numeros, la cual retornará ordenada. S'ha de tenir en compte que aquesta funció té recursivitat.

	>>> a = [1,2,3,4,5,6]
	>>> s = ordenar(a)
	>>> print s
	[1, 2, 3, 4, 5, 6]
	>>> b = [9,8,7,6,5,4]
	>>> s = ordenar(b)
	>>> print s
	[4, 5, 6, 7, 8, 9]
	>>> c = [23,10,47,-13,89]
	>>> s = ordenar(c)
	>>> print s
	[-13, 10, 23, 47, 89]
	"""
	for x in range(len(a)):
		try:
			if a[x] > a[x+1]:
				aux = a[x]
				a[x] = a[x+1]
				a[x+1] = aux
				ordenar(a)
			
		except:
			
			pass
	return a
			
k=100
p = k
n=1
mitja0 = 0
fitxer = open('dades.dat','w')
while k!=0:
	r=eines.clk_reset()
	a=eines.llista(n)
	for x in range(10):
		b=ordenar(a)
	k-=1
	c=eines.clk_counter(r)
	print (c/10)
	mitja0 += c/10
	fitxer.write("Ordenar una vegada una llista de " + str(n) + " numeros, " + str(p) + " vegada/es, triga " + str(c/10) + " segons\n")
mitja0 = mitja0/100





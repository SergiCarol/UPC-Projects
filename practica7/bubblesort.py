# -*- encoding:utf-8 -*-

import eines

def ordenar(l):
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
	
	
	for x in range(len(a)):
		try:
			if a[x] > a[x+1]:
				aux = a[x]
				a[x] = a[x+1]
				a[x+1] = aux
				ordenar(a)
		except:
			pass


	    l = list(l)
	    """
	canvi = True
	
	while canvi:

		canvi = False 

		for i in range(len(l)-1):

			if l[i] > l[i+1]: 

				l[i], l[i+1] = l[i+1], l[i] 

				canvi = True 

	return l


k=100
p =k
n=100
mitja0 = 0
mitja2 = 0
fitxer = open('dades.dat','w')		
while n<=900:
	
	print n
	
	for e in range(100):
		
		r=eines.clk_reset()
		print "Segueixo viu"
		i=0
		while i!=11:
			
			a=eines.llista(n)
			ordenar(a)
			i+=1
		c=eines.clk_counter(r)
		mitja0 += c/10
	mitja2+=mitja0/100
	writ="Ordenar deu vegades cent llistes de " + str(n) + " elements, triga una mitjana de:  " + str(mitja2) + " segons\n"
	fitxer.write(writ)
	fitxer.flush()
	n+=100
	print "Haciendo n= " + str(n)
fitxer.close()
fitxer = open('dades.dat','w')
mitja0 = mitja0/9

fitxer.write("La mitja de temps total és: " + str(mitja0))
fitxer.close()



k=100
p = 100
n=1000
mitja0 = 0
mitja2 = 0
fitxer = open('dades.dat','w') 
while n<=9000:
	for e in range(100):
		r=eines.clk_reset()
		
		print "Segueixo viu"
		i=0
		while i!=11:
			
			a=eines.llista(n)
			ordenar(a)
			i+=1
		
		c=eines.clk_counter(r)
		mitja0 += c/10
	mitja2+=mitja0/100
	writ="Ordenar deu vegades cent llistes de " + str(n) + " elements, triga una mitjana de:  " + str(mitja2) + " segons\n"
	fitxer.write(writ)
	fitxer.flush()
	n+=1000
	print "Haciendo n= " + str(n)
fitxer.close()
fitxer = open('dades.dat','w')
mitja0 = mitja0/9

fitxer.write("La mitja de temps total és: " + str(mitja0))
fitxer.close()	
	

k=100
p = 100
n=10000
mitja0 = 0
mitja2 = 0
fitxer = open('dades.dat','w')
if n>90000:
	pass
else:	
	for e in range(100):
		r=eines.clk_reset()
		
		print "Segueixo viu"
		i=0
		while i!=11:
			
			a=eines.llista(n)
			ordenar(a)
			i+=1
		c=eines.clk_counter(r)
		mitja0 += c/10
       	mitja2+=mitja0/100
	writ="Ordenar deu vegades cent llistes de " + str(n) + " elements, triga una mitjana de:  " + str(mitja2) + " segons\n"
	fitxer.write(writ)
	fitxer.flush()
	n+=10000
	print "Haciendo n= " + str(n)
fitxer.close()
fitxer = open('dades.dat','w')
mitja0 = mitja0/9

fitxer.write("La mitja de temps total és: " + str(mitja0))
fitxer.close()


p = 100
n=100000
mitja0 = 0
mitja2 = 0
fitxer = open('dades.dat','w')
if n<=500000:
	pass
else:
	for e in range(100):
		r=eines.clk_reset()
		i=0
		
		print "Segueixo viu"
		while i!=11:
			
			a=eines.llista(n)
			ordenar(a)
			i+=1		
		c=eines.clk_counter(r)
		mitja0 += c/10
	mitja2+=mitja0/100
	writ="Ordenar deu vegades cent llistes de " + str(n) + " elements, triga una mitjana de:  " + str(mitja2) + " segons\n"
	fitxer.write(writ)
	fitxer.flush()
	n+=100000
	print "Haciendo n= " + str(n)
fitxer.close()
fitxer = open('dades.dat','w')
mitja0 = mitja0/5

fitxer.write("La mitja de temps total és: " + str(mitja0))
fitxer.close()


# -*- encoding:utf-8 -*-

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
			
z = [7,6,8,3,90,1]
print "La llista sense ordenar es la següent: " + str(z)
ordenado = ordenar(z)
print "El programa ja ha acabat d'ordenar, la llista és la següent: " + str(ordenado)


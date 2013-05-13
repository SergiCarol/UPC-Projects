# -*- encoding:utf-8 -*-

def ordenar(a):
	for x in range(len(a)):
		try:
			if a[x] > a[x+1]:
				aux = a[x]
				a[x] = a[x+1]
				a[x+1] = aux
				ordenar(a)
			else:
				pass
		except:
			
			pass
	return a
			
z = [7,6,8,3,90,1]
print "La llista sense ordenar es la següent: " + str(z)
ordenado = ordenar(z)
print "El programa ja ha acabat d'ordenar, la llista és al següent: " + str(ordenado)


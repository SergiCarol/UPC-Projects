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
ordenado = ordenar(z)
print ordenado

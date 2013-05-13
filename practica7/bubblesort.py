def ordenar(a):
	for x in range(len(a)):
		if a[x] > a[x+1]:
			aux = a[x]
			a[x] = a[x+1]
			a[x+1] = aux
			ordenar(a)
		else:
			pass
			
			

from numpy import *
import matplotlib.pyplot as plt

fitxer=open('dades(copia).dat','r')

fitxer=fitxer.readlines()


i=0
guardat1=[]
guardat2=[]
for x in fitxer:
	i += 1
	if i%10 != 0:
		print i
		a=x.strip().split()
		guardat1.append(a[6])
		print a[6]
		guardat2.append(a[12])
	else:
		pass

lista1=[]
lista2=[]
i = 0
for y in guardat1:
	lista1.append(float(guardat1[i]))
	i += 1

i = 0
for u in guardat1:
	lista2.append(float(guardat2[i]))
	i += 1

print lista1
print lista2

x = lista1

y = lista2

coefficients = polyfit(x, y, 6)
print "HOLA K ASE"
print coefficients

polynomial = poly1d(coefficients)
print polynomial
a = polynomial(100)
print a
a = polynomial(200)
print a
a = polynomial(300)
print a
a = polynomial(400)
print a
a = polynomial(500)
print a
a = polynomial(600)
print a
a = polynomial(700)
print a
a = polynomial(800)
print a
a = polynomial(900)
print a
a = polynomial(1000)
print a
a = polynomial(2000)
print a
a = polynomial(3000)
print a
a = polynomial(4000)
print a
a = polynomial(5000)
print a
a = polynomial(6000)
print a
a = polynomial(7000)
print a
a = polynomial(8000)
print a
a = polynomial(9000)
print a




def plot():

	plt.plot(lista1, lista2) 
	plt.grid(True)
	plt.xlabel("Nombres a ordenar")
	plt.ylabel("Temps (s)")
	plt.title("Temps ordenacio llista")
	plt.show()
	
plot()





























"""

    print x
    a=x.strip().split()
    print a
    for element in a:
        
        if element== "de":
            try:
                guardat1.append(a[i+1])
            except:
                pass
           
            i+=1
        elif element=="de:":
            try:
                guardat2.append(a[i])
            except:
                pass
            i+=1
        i+=1


print guardat1
print guardat2
"""

#-*- encoding: utf-8 -*-

#Retorna la matricula a la plaça p
def llegir_placa(p):
	# Obrim el fitxer
	s = ""
	f=open('places.dat','r+')
	# Calculem la posicio que volem mirar
	posicio = p*7
	f.seek(posicio)
	s+=f.read(7)
	f.close()
	return s

#Comprova si la posicio esta ocupada, en el cas de que no ho estigui
#escriu la matricula, si funciona correctament retorna true,
#en cas contrari retorna false

def ocupar_placa(p,m):

	f=open('places.dat','r+')
	posicio = p*7
	f.seek(posicio)
	f.write(m)
	f.close()
	
	
#Aquesta funcio comprova si una matricula es troba dintre 
#el parquing, i retorna la seva posicio, en cas de que no i sigui
#retorna -1

def is_in(m):
	f=open('places.dat','r+')
	r = f.read()
	f.close()
	if str(m) in r:
		j = r.find(m)/7
		return j
	else:
		return -1



def proba():
	f = open('places.dat','r+')
	for x in range(7007):
		f.seek(x)
		f.write('X')
	f.close()















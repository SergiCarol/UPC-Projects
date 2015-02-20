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

	if llegir_placa(p) == "XXXXXXX":
		posicio = p*7
		f.seek(posicio)
		f.write(m)
		f.close()
		return True
	else :
		f.close()
		return False

def is_in(m):
	f=open('places.dat','r+')
	r = f.read()
	if str(m) in r:
		f.close()
		j = r.index(m)/7
		return j
	else:
		f.close()
		return -1



			














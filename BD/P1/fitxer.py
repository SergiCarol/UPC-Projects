#-*- encoding: utf-8 -*-

def llegir_placa(p):
        """
        Donada una posicio retorna la matricula del cotxe aparcat o
        XXXXXXX en cas de que estigui buida
        """
	# Obrim el fitxer
	s = ""
	f=open('places.dat','r+')
	# Calculem la posicio que volem mirar
	posicio = p*7
	f.seek(posicio)
	s+=f.read(7)
	f.close()
	return s

def ocupar_placa(p,m):
        """
        Comprova si la posicio esta ocupada, en el cas de que no ho estigui
        escriu la matricula, si funciona correctament retorna true,
        en cas contrari retorna false
        """
	if len(m) == 7 and p < 1000:
                f=open('places.dat','r+')
		posicio = p*7
		f.seek(posicio)
		f.write(m)
		f.close()
		return True
	else:
		return False

def is_in(m):
        """
        Aquesta funcio comprova si una matricula es troba dintre 
        el parquing, i retorna la seva posicio, en cas de que no i sigui
        retorna -1
        """
	f=open('places.dat','r')
	r = f.read()
	f.close()
	if str(m) in r:
		j = r.find(m)/7
		return j
	else:
		return -1

def empty_number():
        """
        Aquesta funcio busca el numero de plaçes buides que hi ha, 
        les plaçes buides es representen amb la matricula XXXXXXX
        per tan busquem totes les posicions per veure quantes tenen
        espais buits.
        """
	f = open('places.dat','r')
	r= f.read()
	i = 0
	l = []

	if is_in("XXXXXXX") < 0:
		return l

	while i < 7007:
		f.seek(i)
		i=r.find("XXXXXXX",i)
		if i > 0:
			l.append(i/7)
		i+=7
	f.close()
	return l

def buidar():
        """
        Aquesta funcio fica tots els aparcaments buits
        """
	f = open('places.dat','r+')
	for x in range(7007):
		f.seek(x)
		f.write('X')
	f.close()

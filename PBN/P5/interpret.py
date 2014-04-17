
# -*- encoding:utf-8 -*-

class Interpret(object):
    """
    El modul interpret serà l'encarregat de interpretar totes les ordres que li arribin de l'usuari, i traspassar aquestes ordres en processos que podrà fer el programa.
    """
    def __init__(self):
        """
        Aquí definirem la nova classe de interpret.
        
        >>> p = Interpret()
        """
        self._prompt = ""
        self._dcom = {}
        self._alpha=None
        self._omega=None
    def set_prompt(self,p):
        self._prompt = p

    def afegeix_ordre(self,nomc,ordre):
        """
        Modificador. Afegeix a l'interpret una ordre de nom nomc associada a la funció ordre. Si ja existia una ordre amb aquest nom, es queixa. Noteu que el tercer paràmetre del mètode es una funció!.

        La funció de nom ordre es una funció que té com a únic paràmetre una llista de strings.

        >>> p = Interpret()
        >>> p.prompt = "**"
        >>> p.prompt
        '**'
        >>> def Prueba(c1): print "Has echo la prueba al pelazo, " + c1
        >>> p.afegeix_ordre("Hola",Prueba)
        >>> p.afegeix_ordre("Hola",Prueba)
        La ordre ja existeix
        >>> p.afegeix_ordre("Adios",Prueba)
        >>> p.afegeix_ordre("Adios",Prueba)
        La ordre ja existeix
        """
        if nomc in self._dcom:
            print "La ordre ja existeix"
        else:
            self._dcom[nomc] = ordre

    def run(self):
	"""
	Arrenca l'execució d'aquest intèrpret d'ordres. L'intèrpret s'executa indefinidament fins que l'usuari escriu l'ordre surt.
	
	A cada cicle d'interpretació, l'interpret escriu el prompt, llegeix un string del teclat, l'analitza separant els mots que el formen.

	Finalment, executa l'acció corresponent amb els modificadors que li haguem enviat.
	"""
        print "\t\t\t Benvingut al interpret"
        if self._alpha !=None:
            self._alpha()
        a = raw_input(self._prompt)

        a = a.split()
        if a == []:
            a = ["No command"]
        while a[0] != "exit":
            if a[0] not in self._dcom:
                if a[0] != "No command":
                    print "Aquest metode no existeix"
            elif a[0]== "ajuda":
                print "Les comandes disponibles són :" + str(["exit","start","stop","emergency"])
            else:
                b = self._dcom[a[0]]
               
		if len(a) == 1:
			b()
		if len(a) == 2:
		        b(a[1])
		elif len(a) == 3:
		        b(a[1],a[2])
		elif len(a) == 4:
		        b(a[1],a[2],a[3])
		elif len(a) == 5:
		        b(a[1],a[2],a[3],a[4])
		elif len(a) == 6:
		        b(a[1],a[2],a[3],a[4],a[5])
                
            a =raw_input(self._prompt)
            a = a.split()
            if a == []:
                a = ["No command"]
        
        if self._omega!=None:
            self._omega()
    def set_begin(self,f):
        """
        Fixa la funció 'f' com l'inicialitzador que es crida just abans d'arrencar l'interpret. 'f' és una funció sense paràmetres
        """
             
        self._alpha=f
    def set_end(self,f):
        """
        Fixa la funció 'f' com el finalitzador que es cridarà just abans d'acabar l'execucció de l'interpret
        """
        self._omega=f
       

        
        

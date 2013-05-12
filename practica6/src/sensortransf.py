"""
Aquest modul solament exporta una funcio capaç d’aplicar la transformacio escaient a un DataSet per tal d’obtenir els valors de les temperatures.

S'ha de tenir en compte que les dades que es llegeixen dels sensors no son propiament temperatures. Cal aplicar les transformacions lineals que alli s’expliquen, diferents per a cada sensor, per tal d’obtenir-ne les temperatures.
"""


def normalize(d,s=0):
    """
    La funcio normalize(d,s=0) aplica la transformacio escaient per al sensor s sobre el DataSet d.

    Una vegada aplicada els valors de l’objecte son temperatures en graus Celsius.
    """
    if s==0:
        
        a=100*((3.304/1024)/5,65)

        b=(3,1418/5,65)-50+0,24
        
        d.transform(a,b)
        
    elif s==1:

        for i in d._ds:

            a=100*((3.304/1024)/1)

            b=(0/1)-50+1,37

            d.transform(a,b)

    elif s==2:

        for i in d._ds:

            a=100*((3.304/1024)/5,3978)

            b=(2,1850/5,3978)-50+0,95

            d.transform(a,b)

    elif s==3:

        for i in d._ds:

            a=100*((3.304/1024)/5,2959)

            b=(2,1313/5,2959)-50+0,42

            d.transform(a,b)

    elif s==4:

        for i in d._ds:

            a=100*((3.304/1024)/16,8243)

            b=(10,5953/16,8243)-50+0,29

            d.transform(a,b)

    elif s==5:

        for i in d._ds:

            a=100*((3.304/1024)/16,5574)

            b=(10,5842/16,5574)-50+0,79

            d.transform(a,b)

    


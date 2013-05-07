def normalize(d,s=0):

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

    else:

        print "No existeix el sensor"


# -*- encoding:utf-8 -*-

"""
El modul Main será l'encarregat de executar totes les ordres que tindria que fer l'usuari.

S'ha realitzat d'aquesta manera per a fer mes facil el proces, ja que en el cas de no ser així, cada vegada que volguesim executar el programa hauriem de configurar tot una altre vegada.
"""

from node import Node, Entrada, Sortida
from triport import *
from supervisor import *
# definim 4 entrades
e1 = Entrada(1)
e2 = Entrada(0)
e3 = Entrada(1)
e4 = Entrada(1)
# definim 1 sortida
s = Sortida(1)

# definim el circuit
n1 = Node("N1")
a1 = Or(e1, e2, n1)
n2 = Node("N2")
a2 = Or(e3, e4, n2)
a3 = Or(n1, n2, s)
# creem un supervisor i l’informem dels nodes i triports que ha de supervisar
sup = Supervisor()
sup.add_node(n1)
sup.add_node(n2)
sup.add_triport(a1)
sup.add_triport(a2)
sup.add_triport(a3)
# fixem les entrades i simulem
e1.up()
e2.up()
e3.down()
e4.up()
sup.run()
# escrivim resultats

print s

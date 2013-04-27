# -*- encoding:utf-8 -*-

from node import Node, Entrada, Sortida
from triport import And
from supervisor import Supervisor
# definim 4 entrades
e1 = Entrada(1)
e2 = Entrada(0)
e3 = Entrada(1)
e4 = Entrada(1)
print e1
print e2
print e3
print e4
# definim 1 sortida
s = Sortida(1)
# definim el circuit
n1 = Node("N1")
a1 = And(e1, e2, n1)
n2 = Node("N2")
a2 = And(e3, e4, n2)
a3 = And(n1, n2, s)
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
print a1
print a2
print a3

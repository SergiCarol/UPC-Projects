# -*- encoding:utf-8 -*-

from node import Node, Entrada, Sortida
from triport import And
from supervisor import Supervisor
# definim 4 entrades
e1 = Entrada(’E1’)
e2 = Entrada(’E2’)
e3 = Entrada(’E3’)
e4 = Entrada(’E4’)
# definim 1 sortida
s = Sortida(’S1’)
# definim el circuit
n1 = Node(’N1’)
a1 = And(e1, e2, n1)
n2 = Node(’N2’)
a2 = And(e3, e4, n2)
a3 = And(n1, n2, s)
# creem un supervisor i l’informem dels nodes i triports que ha de supervisar
sup = Supervisor()
sup.add node(n1)
sup.add node(n2)
sup.add triport(a1)
sup.add triport(a2)
sup.add triport(a3)
# fixem les entrades i simulem
e1.up()
e2.up()
e3.down()
e4.up()
sup.run()
# escrivim resultats
print s

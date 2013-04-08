# −∗− coding: utf−8 −∗−
"""
=============
M`
odul fracci ́
o
=============
"""
class Fraccio(object):
    def init (self, n, d=1):
        self. num = n
        self. den = d
        self. simplifica()
    

    def simplifica(self):
        pass
    

    def add (self,a):
        nd= self._den * a._den
        nn= self._num * a._den + a._num * self._sen
        return Fraccio(nn,nd)._simplifica()

    def sub (self,a):
        pass

	def simplifica(self):
		a = self. num
		b = self. den
		while a != b:
			if a > b:
				a −= b
			else:
				b −= a
		return Fraccio(self. num/a, self. den/a)

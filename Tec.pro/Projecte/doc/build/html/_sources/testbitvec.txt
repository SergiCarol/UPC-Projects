Doctest BitVector
=================

La classe BitVector és la classe més bàsica de tot el disseny. Representa un paraula binària de mida “petita”, és a dir, menor o igual a 16 bits i s'interpreta sempre sense signe.Es una classe abstracta i per tant no s’usa directament sinó que s’usa unicament com a super-classe. La representació d’aquesta paraula es fa sobre un **int** de Python, que sempre té pel cap baix  32 bits.

D’aquí se’n deriven les subclasses **Byte** que representen paraules de 8 bits i **Word** que representen paraules de 16 bits. Aquestes classes són usades àmpliament pel simulador.

Entre aquestes la implementació del mètode especial __len__ que indica la mida de la paraula. Cal anar amb compte amb alguns dels mètodes ja que tornen sempre com a resultat un objecte de la mateixa classe que **self** i aquesta classe no és mai **BitVector** sinó **Byte** o **Word** segons convingui.


Tests sobre les clases derivades de BitVector:Byte i Word
---------------------------------------------------------

Importem les eines:
-------------------

.. code-block:: python

   >>> from bitvec import Byte, Word

Comprovem els constructors:
---------------------------

.. code-block:: python

   >>> print Byte(1)
   01
   >>> print Byte(-1)
   -1
   >>> print Word(23)
   0017

Comprovem operacion aritmètiques:
---------------------------------

.. code-block:: python

   >>> print Byte(1) + Byte(2)
   03
   >>> print Byte(1) + 2
   03
   >>> print Byte(2) - Byte(1)
   01
   >>> print Byte(2) - 1
   01
   
Comprovem operacions lògiques:
------------------------------

.. code-block:: python

   >>> Byte(3) | Byte(4)
   07
   >>> Byte(7) | Byte(0b0010)
   07
   >>> Byte(7) & Byte(0b0010)
   02
   >>> Byte(0xff) & Byte(0b1011)
   0B
   >>> Byte(0xff) ^ Byte(0b1011)
   F4
   >>> ~Byte(0xF0)
   -F1
   >>> ~Byte(0b101010)
   -2B
   >>> Byte(1) << 4
   10
   >>> Byte(0xfe) << 3
   f0
   >>> Byte(0xff) >> 4
   0F

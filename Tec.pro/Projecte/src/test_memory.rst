=============
Mòdul  Memory
=============

.. code-block:: python

   >>> from memory import *


Doctest
=======

Provem la classe ProgramMemory
------------------------------
.. code-block:: python

   >>> m = ProgramMemory(8)
   >>> m.__len__()
   8
   >>> print m.__repr__()
   0000 : 0000
   0001 : 0000
   0002 : 0000
   0003 : 0000
   0004 : 0000
   0005 : 0000
   0006 : 0000
   0007 : 0000
   <BLANKLINE>
   >>> print m.dump()
   0000 : 0000
   0001 : 0000
   0002 : 0000
   0003 : 0000
   0004 : 0000
   <BLANKLINE>

   >>> m.trace_off()
   >>> m._trace
   False
   >>> m.trace_on()
   >>> m._trace
   True
   >>> m[4]
   Read from 0000 to 0004
   0000
   >>> m[0000]
   Read from 0000 to 0000
   0000

   >>> m[3] = 5
   Write 0005 to 0003

Provem la classe DataMemory i les seves funcións
------------------------------------------------

.. code-block:: Python
   
   >>> dm = DataMemory(15)
   >>> dm
   0000 : 00
   0001 : 00
   0002 : 00
   0003 : 00
   0004 : 00
   0005 : 00
   0006 : 00
   0007 : 00
   0008 : 00
   0009 : 00
   000A : 00
   000B : 00
   000C : 00
   000D : 00
   000E : 00
   000F : 00
   0010 : 00
   0011 : 00
   0012 : 00
   0013 : 00
   0014 : 00
   0015 : 00
   0016 : 00
   0017 : 00
   0018 : 00
   0019 : 00
   001A : 00
   001B : 00
   001C : 00
   001D : 00
   001E : 00
   001F : 00
   <BLANKLINE>
   >>> print dm.dump_reg()
   R00 : 00
   R01 : 00
   R02 : 00
   R03 : 00
   R04 : 00
   R05 : 00
   R06 : 00
   R07 : 00
   R08 : 00
   R09 : 00
   R10 : 00
   R11 : 00
   R12 : 00
   R13 : 00
   R14 : 00
   R15 : 00
   R16 : 00
   R17 : 00
   R18 : 00
   R19 : 00
   R20 : 00
   R21 : 00
   R22 : 00
   R23 : 00
   R24 : 00
   R25 : 00
   R26 : 00
   R27 : 00
   R28 : 00
   R29 : 00
   R30 : 00
   R31 : 00
   X (R27 : R26): 0000
   Y (R29 : R28): 0000
   Z (R31 : R30): 0000
   <BLANKLINE>



.. code-block:: python

   

   >>> from instruction import InstRunner, Adc, Add, Sub, Subi, And, Or, Eor, Lsr, Mov, Ldi, Sts, Lds, Rjmp, Brbs, Brbc, Nop, Break, In, Out
   >>> from state import State
   >>> from bitvec import BitVector, Byte, Word


ADC
====

.. code-block:: python

   >>> a=Adc()
   >>> b=State(50,50)
   >>> c=Word(7186)
   >>> b.data[1]=2
   >>> b.data[2]=254
   >>> a
   ADC
   >>> a.match(c)
   True
   >>> a.execute(c,b)
   >>> print b.dump_reg()
   R00 : 00
   R01 : 00
   R02 : FE
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
   PC: 0001
   CARRY: 1 ZERO: 1 NEG: 1
   <BLANKLINE>

   
=====
 AND
=====

.. code-block:: python

   >>> a=And()
   >>> b=State(50,50)
   >>> c=Word(8210)
   >>> b.data[1]=2
   >>> b.data[2]=254
   >>> a
   AND
   >>> a.match(c)
   True
   >>> a.execute(c,b)
   >>> print b.dump_reg()
   R00 : 00
   R01 : 02
   R02 : FE
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
   PC: 0001
   CARRY: 0 ZERO: 0 NEG: 0
   <BLANKLINE>


====
 OR
====

.. code-block:: python

   >>> a=Or()
   >>> b=State(50,50)
   >>> c=Word(10258)
   >>> b.data[1]=2
   >>> b.data[2]=254
   >>> a
   OR
   >>> a.match(c)
   True
   >>> a.execute(c,b)
   >>> print b.dump_reg()
   R00 : 00
   R01 : FE
   R02 : FE
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
   PC: 0001
   CARRY: 0 ZERO: 0 NEG: 0
   <BLANKLINE>
  

=====
 EOR
=====

.. code-block:: python

   >>> a=Eor()
   >>> b=State(50,50)
   >>> c=Word(9234)
   >>> b.data[1]=2
   >>> b.data[2]=254
   >>> a
   EOR
   >>> a.match(c)
   True
   >>> a.execute(c,b)
   >>> print b.dump_reg()
   R00 : 00
   R01 : FC
   R02 : FE
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
   PC: 0001
   CARRY: 0 ZERO: 0 NEG: 0
   <BLANKLINE>

   
  
=====
 LSR
=====

.. code-block:: python
   >>> a=Lsr()
   >>> b=State(50,50)
   >>> c=Word(37910)
   >>> b.data[1]=254
   >>> a
   LSR
   >>> a.match(c)
   True
   >>> a.execute(c,b)
   >>> print b.dump_reg()
   R00 : 00
   R01 : FE
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
   PC: 0001
   CARRY: 0 ZERO: 0 NEG: 0
   <BLANKLINE>

=====
 MOV
=====

.. code-block:: python
   >>> a=Mov()
   >>> b=State(50,50)
   >>> c=Word(11282)
   >>> b.data[1]=2
   >>> b.data[2]=254
   >>> a
   MOV
   >>> a.match(c)
   True
   >>> a.execute(c,b)
   >>> print b.dump_reg()
   R00 : 00
   R01 : FE
   R02 : FE
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
   PC: 0001
   CARRY: 0 ZERO: 0 NEG: 0
   <BLANKLINE>

=====
 LDI
=====

.. code-block:: python
   >>> a=Ldi()
   >>> b=State(50,50)
   >>> c=Word(61214)
   >>> a
   LDI
   >>> a.match(c)
   True
   >>> a.execute(c,b)
   >>> print b.dump_reg()
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
   R17 : FE
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
   PC: 0001
   CARRY: 0 ZERO: 0 NEG: 0
   <BLANKLINE>

=====
 LDS
=====

.. code-block:: python
   >>> a=Lds()
   >>> b=State(50,50)
   >>> c=Word(9130)
   >>> a
   LDS
   >>> print b.dump_reg()
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
   PC: 0000
   CARRY: 0 ZERO: 0 NEG: 0
   <BLANKLINE>

=====
 STS
=====

.. code-block:: python
   >>> a=Sts()
   >>> b=State(50,50)
   >>> c=Word(9330)
   >>> b.data[2]=254
   >>> a
   STS
   >>> print b.dump_reg()
   R00 : 00
   R01 : 00
   R02 : FE
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
   PC: 0000
   CARRY: 0 ZERO: 0 NEG: 0
   <BLANKLINE>

======
 RJMP
======

.. code-block:: python
   >>> a=Rjmp()
   >>> b=State(50,50)
   >>> c=Word(49157)
   >>> a
   RJMP
   >>> a.match(c)
   True
   >>> a.execute(c,b)
   >>> print b.dump_reg()
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
   PC: 0006
   CARRY: 0 ZERO: 0 NEG: 0
   <BLANKLINE>

======
 BRBS
======

.. code-block:: python
   >>> a=Brbs()
   >>> b=State(50,50)
   >>> c=Word(61473)
   >>> a
   BRBS
   >>> a.match(c)
   True
   >>> a.execute(c,b)
   >>> print b.dump_reg()
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
   PC: 0001
   CARRY: 0 ZERO: 0 NEG: 0
   <BLANKLINE>

======
 BRBC
======

.. code-block:: python
   >>> a=Brbc()
   >>> b=State(50,50)
   >>> c=Word(62497)
   >>> a
   BRBC
   >>> a.match(c)
   True
   >>> a.execute(c,b)
   >>> print b.dump_reg()
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
   PC: 0005
   CARRY: 0 ZERO: 0 NEG: 0
   <BLANKLINE>

=====
 Out
=====

.. code-block:: python
   >>> a=Out()
   >>> b=State(50,50)
   >>> b.data[1]=99
   >>> c=Word(47120)
   >>> d=Word(47121)
   >>> e=Word(47122)
   >>> a
   OUT
   >>> a.match(c)
   True

   


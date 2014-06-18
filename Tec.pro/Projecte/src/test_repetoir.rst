===============
Class Repertoir
===============


.. code-block:: python 
  
   >>> from repertoir import *

   
Doctest
=======

.. code-block:: python

   >>> a= Repertoir([Add(),Adc(),Sub(),Subi(),And(),Or(),Eor(),Lsr(),Mov(),Ldi(),Sts(),Lds(),Rjmp(),Brbs(),Brbc(),Nop(),Break(),In(),Out()])
   >>> a.find(61199)
   LDI
   >>> a.find(57361)
   LDI
   >>> a.find(3857)
   ADD
   >>> a.find(11777)
   MOV
   >>> a.find(8704)
   AND
   >>> a.find(0000)
   NOP
   >>> a.find(38296)
   BREAK








===================
Test del modul word
===================

Clase Byte
==========

Importem.

.. code-block:: python

	>>> from bitvec import Byte

Creem bytes.

.. code-block:: python

	>>> print Byte(1)
	01
	>>> print Byte(15)
	0F
	>>> print Byte(403)
	93
	>>> print Byte(-1)
	FF

Comprovem que fa correctament les operacions aritmetiques.

.. code-block:: python

	>>> Byte(12) + Byte(2)
	0E
	>>> Byte(12) + 2
	0E
	>>> Byte(12) - Byte(2)
	0A
	>>> Byte(12) - 2
	0A
	>>> Byte(403) - 3
	90

Comprovem les operacions llogiques.

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
	>>> ~Byte(0xf0)
	0F
	>>> ~Byte(0b101010)
	D5
	>>> Byte(1) << 4
	10
	>>> Byte(0xfe) << 3
	F0
	>>> Byte(0xff) << 4
	F0
	>>> Byte(0xff) >> 4
	0F

Clase Word
==========

Importem.

.. code-block:: python

	>>> from bitvec import Word

Creem bytes.

.. code-block:: python

	>>> print Word(1)
	0001
	>>> print Word(15)
	000F
	>>> print Word(403)
	0193
	>>> print Word(-1)
	FFFF

Comprovem que fa correctament les operacions aritmetiques.

.. code-block:: python

	>>> Word(12) + Byte(2)
	000E
	>>> Word(12) + 2
	000E
	>>> Word(12) - Byte(2)
	000A
	>>> Word(12) - 2
	000A
	>>> Word(403) - 3
	0190


Comprovem les operacions llogiques.

.. code-block:: python

	>>> Word(3) | Word(4)
	0007
	>>> Word(7) | Word(0b00000010)
	0007
	>>> Word(7) & Word(0b00000010)
	0002
	>>> Word(0x43ff) & Word(0b00001011)
	000B
	>>> Word(0x00ff) ^ Word(0b00001011)
	00F4
	>>> ~Word(0x0ff0)
	F00F
	>>> ~Word(0b101010)
	FFD5
	>>> Word(1) << 4
	0010
	>>> Word(0xfe) << 3
	07F0
	>>> Word(0xff) << 4
	0FF0
	>>> Word(0xff) >> 4
	000F




   





Introducció
===========

Aquest es el treball destinat a explicar la sisena practica de *Tecnologies de la programació*.

En aquesta practica realitzarem un programa que captura, enmagatzema i visalutza dades provinents d'un sistema de sensors. S'ha de tenir que s'accedirá a aquestes dades a traves de la xarxa.

El temps total de la practica será de 2 setmanes.

Objectius
---------

El programa que es realitzará, tindrá el següents objectius:

- Tenir un primer contacte amb alguns serveix de l'extensa llibreria de *Python*.

- Consolidar el treball amb classes d'objectes.

- Conslidar l'us de les eines de test i el disseny basat en tests.

- Consolidar l'us de les eines de documentaco de programari i de les eines de gestió de versions.

Materia nova
------------

La materia nova que es tinrá que utilitzar en aquesta practica será la següent:

- Modul **urllib2**: Aquest modul será el destinat de llegir la url en la qual está penjada l'informació sobre els sensors.

- Llibreria **dataset**: FALTA PONER EXPLICACIÓN

- Llibreria **datetime**: Aquesta llibreria será l'encarregada de facilitar l'acces a les dades que contenen la data de les mostres dels sensors.

- Modul **plot** i **dates** de la llibreria **matplotlib.pyplot**: Aquests moduls será l'encarregat de generar grafiques a partir d'una llista.

Descripció del sistema
----------------------

El esquema general de l'aplicació será el següent:

.. image:: Imagen_1
   :align: center

Els procesos que segueix una senyal fins a arribar al nostre ordinador, són les següents:

 **1-** La dada es capturada per el sistema de detecció del sensor.

 **2-** La dada ya capturada, es transfereix a l'electronica del sensor, que la converteix en un senyal electric.

 **3-** A continuació arriba el recolector dde dades del servidor, que es l'encarregat d'enmagatzemar tota l'informació que li arriba. Si o tinguesim això, no podriem agafar facilment l'historic de dades, ja que no quedarien registrades enlloc.

 **4-** Finalment a través d'internet les dades són accesibles desde el nostre ordinador, on podrem manipular les dades com ens convingui.


Manipulació dades sensor
------------------------

Per finalitzar l'introducció, comentarem una cosa que es molt important: El format de les dades del sensor.

Això es important perque hem de saber ma






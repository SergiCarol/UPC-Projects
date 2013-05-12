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

També hem de comentar una cosa que es molt important: El format de les dades del sensor.

Això es important perque hem de saber de quina manera están escrites les dades del sensor.

En primer lloc, s'ha de tenir en compte que el nom del fitxer té relació amb la data a la qual pertanyen les dades. Així el fitxer **dades_11_08_01**, per exemple, conté les dades del sis sensors corresponents al dia º d'agost del 2011.

Un fitxer de daes s'organitza en linies. Cada linia correspon a una dada d'un sensor en un instant de temps. El format d'una linia es el que segueix:

*00:00:04,5,526.000000*

Noteu que hi ha tres camps separats per comes. El primer es l'instant de temps a que correspon la dada. Fixeu-vos que la sintaxi és la classica de HH:MM:SS. El segon es el numero de sensor. Finalment el tercer és el valor de la dada i es de tipus real. El fitxer conté molts centenars de dades i per tant no es convenient emmagatzemar-lo completament a la memoria del computador.

Mostra de dades en grafica
--------------------------

Per terminar l'introducció parlarem sobre lo més important de tot el projecte: Les grafiques.

Fins ara, cada vegada que teniem que mostrar alguna dada a l'usuari (fos de la forma que fosi), sempre li mostravem per consola. Això pot ser mol senzill, però a la vegada molt poc util.

Si lo que volem fer es mostrar un seguit de dades (de moltes dades), i que l'usuari les pugui interpretar facilment, no podem donar-li una gran llista de dades escrita. Ho hem de fer de una manera més bona: Les grafiques.






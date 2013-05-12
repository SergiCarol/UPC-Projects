Introducció
===========

Aquest és el treball destinat a explicar la sisena pràctica de *Tecnologies de la programació*.

En aquesta pràctica realitzarem un programa que captura, enmagatzema i visuslitza dades provinents d'un sistema de sensors. S'ha de tenir en compte  que s'accedirà a aquestes dades a traves de la xarxa.

El temps total de la practicà serà de 2 setmanes.

Objectius
---------

El programa que es realitzarà, tindrá el següents objectius:

- Tenir un primer contacte amb alguns serveis de l'extensa llibreria de *Python*.

- Consolidar el treball amb classes d'objectes.

- Conslidar l'us de les eines de test i el disseny basat en tests.

- Consolidar l'us de les eines de documentació de programari i de les eines de gestió de versions.

Materia nova
------------

La materia nova que es tindrà que utilitzar en aquesta pràctica serà la següent:

- Modul **urllib2**: Aquest modul serà el destinat de llegir la url en la qual està penjada l'informació sobre els sensors.

- Llibreria **datetime**: Aquesta llibreria serà l'encarregada de facilitar l'acces a les dades que contenen les dades de les mostres dels sensors.

- Modul **plot** i **dates** de la llibreria **matplotlib.pyplot**: Aquests moduls será l'encarregat de generar grafiques a partir d'una llista.

Descripció del sistema
----------------------

El esquema general de l'aplicació serà el següent:

.. image:: Imagen_1
   :align: center

Els procesos que segueix una senyal fins a arribar al nostre ordinador, són les següents:

 **1-** La dada es capturada per el sistema de detecció del sensor.

 **2-** La dada ya capturada, es transfereix a l'electronica del sensor, que la converteix en un senyal elèctric.

 **3-** A continuació arriba el recolector dde dades del servidor, que es l'encarregat d'enmagatzemar tota l'informació que li arriba. Si o tinguesim això, no podriem agafar facilment l'historic de dades, ja que no quedarien registrades enlloc.

 **4-** Finalment a través d'internet les dades són accesibles desde el nostre ordinador, on podrem manipular les dades com ens convingui.


Manipulació dades sensor
------------------------

També hem de comentar una cosa que és molt important: El format de les dades del sensor.

Això és important perque hem de saber de quina manera estàn escrites les dades del sensor.

En primer lloc, s'ha de tenir en compte que el nom del fitxer té relació amb la data a la qual pertanyen les dades. Així el fitxer **dades_11_08_01**, per exemple, conté les dades dels cinc sensors corresponents al dia 1 d'agost del 2011.

Un fitxer de dades s'organitza en linies. Cada linia correspon a una dada d'un sensor en un instant de temps. El format d'una linia és el que següent:

*00:00:04,5,526.000000*

Noteu que hi ha tres camps separats per comes. El primer és l'instant de temps a que correspon la dada. Fixeu-vos que la sintaxi és la classica de HH:MM:SS. El segon és el número de sensor. Finalment el tercer és el valor de la dada i és de tipus real. El fitxer conté molts centenars de dades i per tant no és convenient enmagatzemar-lo completament a la memòria del computador.

Mostra de dades en la gràfica
-----------------------------

Per acabar l'introducció parlarem sobre lo més important de tot el projecte: Les gràfiques.

Fins ara, cada vegada que teniem que mostrar alguna dada a l'usuari (fos de la forma que fosi), sempre li mostravem per consola. Això pot ser molt senzill, però a la vegada molt poc util.

Si lo que volem fer és mostrar un seguit de dades (de moltes dades), i que l'usuari les pugui interpretar facilment, no podem donar-li una gran llista de dades escrita. Ho hem de fer de una manera més bona: Les gràfiques. Aquestes gràfiques es reaitzaràn amb el matplotlib. Per a instalar aquest pack escribim en la consola:

.. code-block:: python

   $ sudo apt-get install python-matplotlib

Una vegada el tenim instalat podrem realitzar gràfiques com aquesta:

.. image:: Imagen_2
   :align: center

Lògicament, abans de fer les gràfiques, hem tingut d'apendre a utilitzar aquesta llibreria.






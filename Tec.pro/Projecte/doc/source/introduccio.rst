============
Introduccció
============

      :autors: Sergi Carol, Enric Caballé, David Martín, Héctor Vidal i Pavel Macutela
      :data: 24/06/2013

Objectiu del Projecte
======================

L'objectiu d'aquest treball és bàsicament implementar un simulador d'un microcontrolador(Micro Controler Unit) real.
Un microcontrolador és un computador molt simple integrat en un sol xip s'utilitza essencialment en aplicacions de control.

Aquest AVR simula un microcontrolador es de la família AVR d'Atmel. Peró nomes podem fer algunes simulacions i no és completa ni exacta. 
 
El treball comporta tenir una comanda que permet simular un programa escrit en assemblador de l'AVR.


Repertori d'instruccions
========================

Els computadors es dediquen a executar instruccions del *llenguatge màquina* enmagatzemades en la memòria. Una instrucció té una longitud en bits, formada per diversos camps que indica el que ha de fer la instrucció(*opcode*). A part hi han altres dades que indiquen sobre quines dades cal fer l'operació indicada per l'opcode. Per exemple, es pot donar el valor de la dada directament o bé indicar en quina adreça de memòria s'ha d'anar a buscar la dada.

En aquest projecte treballarem amb un repertori d'instruccions reduït però exactament compatible amb els del microcontrolador AVR.

Les instruccions de llenguatge màquina de l'AVR són de 2 bits d'amplada i el seu format varia segons el mode d'adreçament.

instruccions:
-------------

    ADC ---> Suma registre-registre amb carry.

    SUB ---> Resta registre-registre sense carry.
   
    SUBI ---> Resta registre-constant sense carry.
    
    AND ---> And registre-registre.
    
    OR ---> Or registre-registre.
    
    EOR ---> Or exclusiva registre-registre.
    
    LSR ---> Desplaçament dreta registre.
    
    MOV ---> Còpia registre-registre.
    
    LDI ---> Assigna valor a registre.
    
    STS ---> Còpia registre a memòria.
    
    
    LDS ---> Còpia memòria a registre.
    
    RJMP ---> Salt relatiu a una nova instrucció.
    
    BRBS ---> Salta l' adreça de programa si cert bit de FLAGS és 1. 
    
    BRBC ---> Salta l' adreça de programa si cert bit de FLAGS és 0.
    
    NOP ---> No fa res. És la instrucció nul·la.
    
    BREAK ---> Atura la simulació i acaba l'execució del programa simulador.
    
    IN --> Quan s'aplica al port 0x0, llegeix un caràcter del teclat
    
    OUT---> S'usa per escriure per la pantalla.


Estructura del Projecte
-----------------------

El projecte s'estrucutra al voltant d'una sèrie de mòduls ,cadascun conté unes classes que representen parts de l'arquitectura o conceptes relacionats. Els mòduls son els següents.

**bitvec**: Conté diverses classes que tenen com a objectiiu representar les paraules de diferent longitud que intervenen en la simulació.

**memory**: Conté unes classes que representen les diverses tipòlogies de memòria de l'arquitectura de l'AVR.

**state**: Contè una classe que representa l'estat (inclosa la memòria) del microcontrolador.

**instruction**: Contè les classes que implementen el significat de totes i cadascuna de les operacions de llenguatge màquina que admet el simulador.

**repertoir**: Contè una classe que agrupa el receptori d'instrucions del simulador.

**avrmcu**: Contè una classe que implementa el control general del microcontrolador. És en certa manera de classe que aglutina la resta de components.

**intelhex**: És un  mòdul que incorporem al nostre projecte. L'utilitzarem per poder llegir amb facilitat programes en llenguatge màquina continguts en fitxers de format *Intel HEX*.

**avrexcep**: És un mòdul que defineix diverses classes d'exepcions usades en el simulador.

**simavr**: És un modul principal del simulador. Els ususaris finals del simulador invoquen aquest mòdul per simular programes.

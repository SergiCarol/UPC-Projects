#!/usr/bin/python
# -*- encoding:utf-8 -*-

from interpret import Interpret
import serial

def forceA():
    ser.write("A_on")
    a=ser.readline()
    if a == "encesA\r\n":
        print "El semafor A està en verd"
    elif a== "nothing\r\n":
        print "El semafor A està en verd sense actuar"
    else:
        print "Error: el semafor no s'ha pogut ficar en verd"

def forceB():
    ser.write("B_on")
    a=ser.readline()
    if a == "encesB\r\n":
        print "El semafor B està en verd"
    elif a== "nothing\r\n":
        print "El semafor B està en verd sense actuar"
    else:
        print "Error: el semafor no s'ha pogut ficar en verd"

def stop():
    ser.write("Soff")
    a=ser.readline()
    if a == "apagat\r\n":                                                   
        print "Shutdown"
    else:
        print "Error : La comanda stop només es pot utilitzar si el semafor està ences"

def ajuda():
    print " Les comanandes són : start , stop , estat_A, estat_B, force_A i force_B"

def start():
    ser.write("S_on")
    a=ser.readline()
    if a== "control_on\r\n":
        print "Els semafors s'han engegat correctament"
    else:
        print "Error 404: Semafors not found "

def stateA():
    ser.write("Aval")
    a=ser.readline()
    print a

def stateB():
    ser.write("Bval")
    a=ser.readline()
    print a


if __name__=="__main__":
    # Incialitzem el port serie.
    ser=serial.Serial('/dev/ttyACM0',9600)
    # Cridem la classe interpet.    
    I= Interpret()
    # Afegim les ordres.
    I.afegeix_ordre("ajuda",ajuda) 
    I.afegeix_ordre("start",start)
    I.afegeix_ordre("stop",stop)
    I.afegeix_ordre("estat_A",stateA)
    I.afegeix_ordre("estat_B",stateB)
    I.afegeix_ordre("force_A",forceA)
    I.afegeix_ordre("force_B",forceB)
    I._prompt="***"
    I.run()
    ser.close()

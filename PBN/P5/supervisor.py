#!/usr/bin/python
# -*- encoding:utf-8 -*-

from interpret import Interpret
import serial
import time
def forceA():
    ser.write("FA\r\n")
    a=ser.readline()
    if a == "OK\r\n":
        print "El semafor A està en verd\r\n"
    elif a== "COMERR\r\n":
        print "El semafor A està en verd sense actuar\r\n"
    else:
        print "Error: el semafor no s'ha pogut ficar en verd\r\n"

def forceB():
    ser.write("FB\r\n")
    a=ser.readline()
    if a == "OK\r\n":
        print "El semafor B està en verd\r\n"
    elif a== "COMERR\r\n":
        print "El semafor B està en verd sense actuar\r\n"
    else:
        print "Error: el semafor no s'ha pogut ficar en verd\r\n"

def stop():
    ser.write("H\r\n")
    a=ser.readline()
    if a == "apagat\r\n":                                                   
        print "Shutdown\r\n"
    else:
        print "Error : La comanda stop només es pot utilitzar si el semafor està ences\r\n"

def ajuda():
    print " Les comanandes són : start , stop , estat_A, estat_B, force_A i force_B\r\n"

def start():
    ser.write("R\r\n")
    a=ser.readline()
    if a== "control_on\r\n":
        print "Els semafors s'han engegat correctament\r\n"
    else:
        print "Error 404: Semafors not found\r\n "

def stateA():
    ser.write("?A\r\n")
    a=ser.readline()
    print a

def stateB():
    ser.write("?B\r\n")
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
    print "Inicializant el Interpret... \n"
    time.sleep(1.5)
    I.run()
    ser.close()

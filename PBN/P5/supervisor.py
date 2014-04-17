# -*- encoding:utf-8 -*-

from interpret import Interpret
import serial

def forceA():
    ser.write("forceA")
    a=ser.readline()
    if a == "encesA\n":
        print "El semafor A està en verd"
    else:
        print "Error: el semafor no s'ha pogut ficar en verd"

def forceB():
    ser.write("forceB")
    a=ser.readline()
    if a == "encesB\n":
        print "El semafor B està en verd"
    else:
        print "Error: el semafor no s'ha pogut ficar en verd"

def stop():
    ser.write("control_off")
    b=ser.readline()
    if b == "apagat\n":                                                   
        print "Shutdown"
    else:
        print "Error : La comanda stop només es pot utilitzar si el semafor està ences"

def ajuda():
    print " Les comanandes són : start , stop , estat_A, estat_B, force_A i force_B"

def start():
    ser.write("control_on")
    a=ser.readline()
    if a== "ences\n":
        print "Els semafors s'han engegat correctament"
    else:
        print "Error 404: Semafors not found "

def stateA():
	ser.write("estatA")
    a=ser.readline()
   	if a!="semoff\n":
   		print a
   	else:
   		print "Error"

def stateB():
	ser.write("estatB")
    a=ser.readline()
   	if a!="semoff\n":
   		print a
   	else:
   		print "Error"


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
    I.afegeix_ordre("force_B",forceA)
    I._prompt="***"
    I.run()
    ser.close()

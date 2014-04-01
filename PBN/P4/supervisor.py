# -*- encoding:utf-8 -*-

from interpret import Interpret
import serial

def start():
    
    ser.write('R')
    a=ser.readline()
    if a == "RESTART\n":
        print "RESTART"
    else:
        print "error"
def stop():
    
    ser.write('S')
    b=ser.readline()
    if b == "SHUTDOWN\n":
        print "SHUTDOWN"
    else:
        print "error"

def ajuda():
    print " Les comanandes són : start , stop , emergency"
def emergency():
    
    ser.write('E')
    a=ser.readline()
    if a== "EMERGENCY\n":
        print "EMERGENCY"
    else:
        print "Error : La comanda emergency no es pot utilitzar com inicialitzador ni com a restart després d'un stop "
if __name__=="__main__":
    ser=serial.Serial('/dev/ttyACM0',9600)
    I= Interpret()
    I.afegeix_ordre("ajuda",ajuda)
    I.afegeix_ordre("start",start)
    I.afegeix_ordre("stop",stop)
    I.afegeix_ordre("emergency",emergency)
    I._prompt="***"
    I.run()
    ser.close()

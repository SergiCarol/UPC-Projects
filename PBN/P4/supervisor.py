# -*- encoding:utf-8 -*-

from interpret import Interpret
import serial

def start():
    
    ser.write('R')
    a=ser.readline()
    print a
    if a == "RESTART":
        print "RESTART"
    else:
        print "error"
def stop():
    ser.write('S')
    b=ser.readline()
    print b
    if b == "SHUTDOWN":
        print "SHUTDOWN"
    else:
        print "error"

def ajuda():
    print " Les comanandes són : start , stop , emergency"
def emergency():
    ser.write('E')
    a=ser.readline()
    print a
    if a== "EMERGENCY":
        print "EMERGENCY"
    else:
        print "error"
if __name__=="__main__":
    ser=serial.Serial('/dev/ttyACM0',9600)
    I= Interpret()
    I.afegeix_ordre("ajuda",ajuda)
    I.afegeix_ordre("start",start)
    I.afegeix_ordre("stop",stop)
    I.afegeix_ordre("emergency",emergency)
    I._prompt="***"
    I.run()
    

from interpret import Interpret
import serial

def start():
    ser.write('R')
    a=ser.readlines()
    if a== "RESTART":
        print "RESTART"
    else:
        print "error"

def stop():
    ser.write('S')
    a=ser.readlines()
    if a== "SHUTDOWN":
        print "SHUTDOWN"
    else:
        print "error"

def emergency():
    ser.write('E')

    if a == "EMERGENCY":
        print "EMERGENCY"
    else:
        print "error"
        
if __name__=="__main__":
    ser=serial.Serial('/dev/ttyACM0',9600)
    ser
    I= Interpret()

    I.afegeix_ordre("start",start)
    I.afegeix_ordre("stop",stop)
    I.afegeix_ordre("emergency",emergency)
    I.afegeix_ordre("A",A)
    I.afegeix_ordre("B",B)
    I._prompt="***"
    I.run()
    

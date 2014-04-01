from interpret import Interpret
import serial

def start():
    ser.write('R')


def stop():
    ser.write('S')

def emergency():
    ser.write('E')
 
def A():
    ser.write('A')
def B():
    ser.write('B')

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
    

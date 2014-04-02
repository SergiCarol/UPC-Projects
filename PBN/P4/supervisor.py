# -*- encoding:utf-8 -*-

from interpret import Interpret
import serial

def start():
    
    ser.write('R')                                              # Escribim pel port serie
    a=ser.readline()                                            # Llegim el contingut del port serie
    if a == "RESTART\n":                                        # En el cas de que sigui un restart és que tot ha sortit bé
        print "RESTART"
    else:                                                       # Si no, es que ja està funcionant
        print "Error :  El semafor ja està inicilitzat"
def stop():
    
    ser.write('S')
    b=ser.readline()
    if b == "SHUTDOWN\n":                                                   
        print "SHUTDOWN"
    else:
        print "Error : La comanda stop només es pot utilitzar si el semafor està ences"

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
    ser=serial.Serial('/dev/ttyACM0',9600)   # Incialitzem el port serie
    I= Interpret()                                                # Cridem la classe interpet
    I.afegeix_ordre("ajuda",ajuda)                                # Afegim les ordres 
    I.afegeix_ordre("start",start)
    I.afegeix_ordre("stop",stop)
    I.afegeix_ordre("emergency",emergency)
    I._prompt="***"
    I.run()
    ser.close()
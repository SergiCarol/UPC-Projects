#!/usr/bin/python
# -*- encoding:utf-8 -*-

from interpret import Interpret
import serial
import time

if __name__=="__main__":
    # Incialitzem el port serie.
    ser=serial.Serial('/dev/ttyACM0',9600)
    # Cridem la classe interpet.    
    I= Interpret()
    # Afegim les ordres.
    I._prompt="***"
    print "Inicializant el Interpret... \n"
    time.sleep(1.5)
    I.run()
    #Ens gurada el contingut despres de ('***')
    a=raw_input('***')
    ser.write(a)
    r=ser.readline()
    print r
    r=ser.readline()
    print r
    ser.close()

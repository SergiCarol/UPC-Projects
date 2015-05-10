#-*- encoding: utf-8 -*-
"""
import  RPi.GPIO as GPIO

def setup(pin):
    GPIO.setup(pin,GPIO.OUT)
    off(pin)

def on(pin):
    GPIO.output(18,True)

def off(pin):
    GPIO.output(18,False)
    
def estat(pin):
    return GPIO.input(18)
"""

import serial


def on(serial):
	serial.write("O")

def off(serial):
	serial.write("F")

def estat(serial):
	serial.write("C")
	a=serial.read()
        print a
	return a

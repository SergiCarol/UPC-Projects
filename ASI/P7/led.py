#-*- encoding: utf-8 -*-

import  RPi.GPIO as GPIO

def setup(pin):
    GPIO.setup(pin,GPIO.OUT)
    off(pin)

def on(pin):
    GPIO.output(18,True)

def off(pin):
    GPIO.output(18,False)
    

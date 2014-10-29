CC=avr-gcc

CFLAGS=-std=c99 -Os -mmcu=atmega328p -fshort-enums -DF_CPU=16000000UL -I./libpbn
LDFLAGS=-mmcu=atmega328p

vpath lib% libpbn

.PHONY: clean veryclean  main avr avr_rx

checksum.o: checksum.h 

gpio_device.o: gpio_device.h

frame.o:frame.h 

trans: frame.o checksum.o gpio_device.o -lpbn

recep: frame.o checksum.o gpio_device.o -lpbn

trans.hex: trans
		avr-objcopy -Oihex $< $@
recep.hex: recep
		avr-objcopy -Oihex $< $@

avr:trans.hex 
	avrdude -c arduino -p atmega328p -P /dev/ttyACM0 -U $<
	picocom /dev/ttyACM0

avr_rx: recep.hex
	avrdude -c arduino -p atmega328p -P /dev/ttyACM1 -U $<
	picocom /dev/ttyACM1

clean:
	rm -f  aplic ∗ ̃ *.hex *.txt *.pyc *.c~ *.o 
tar_clean:
	rm -f aplic ∗ ̃ *.hex *.txt *.pyc *.c~ *.o 
	tar cvf Sergi_Carol_Enric_Lenard.tar.gz .


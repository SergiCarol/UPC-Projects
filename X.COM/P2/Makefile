CC=avr-gcc

CFLAGS=-std=c99 -Os -mmcu=atmega328p -fshort-enums -DF_CPU=16000000UL -I./libpbn
LDFLAGS=-mmcu=atmega328p

vpath lib% libpbn

.PHONY: clean veryclean  main avr avr_rx

checksum.o: checksum.h 

lan.o:lan.h 

aplic: lan.o checksum.o -lpbn

main.hex: aplic
		avr-objcopy -Oihex $< $@


avr:main.hex 
	avrdude -c arduino -p atmega328p -P /dev/ttyACM0 -U $<
	picocom /dev/ttyACM0

avr_rx: main.hex
	avrdude -c arduino -p atmega328p -P /dev/ttyACM1 -U $<
	picocom /dev/ttyACM1

clean:
	rm -f  ∗ ̃ *.hex *.txt *.pyc *.c~ *.o 
tar_clean:
	rm -f aplic ∗ ̃ *.hex *.txt *.pyc *.c~ *.o 
	tar cvf Sergi_Carol_Enric_Lenard.tar.gz .


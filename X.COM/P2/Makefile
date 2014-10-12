CC=avr-gcc

CFLAGS=-std=c99 -Os -mmcu=atmega328p -fshort-enums -DF_CPU=16000000UL -I./libpbn
LDFLAGS=-mmcu=atmega328p

vpath lib% libpbn

.PHONY: clean veryclean  main avr

main: checksum.o lan.o -lpbn
		$(CC) $(CFLAGS) checksum.o lan.o -o main

checksum.o: checksum.h 

lan.o:lan.h  

main.hex: main
		avr-objcopy -Oihex $< $@


avr:main.hex 
	avrdude -c arduino -p atmega328p -P /dev/ttyACM0 -U $<


clean:
	rm -f main ∗ ̃ *.hex *.txt *.pyc *.c~ *.o 
tar_clean:
	rm -f main ∗ ̃ *.hex *.txt *.pyc *.c~ *.o 
	tar cvf Sergi_Carol_Enric_Lenard.tar.gz .


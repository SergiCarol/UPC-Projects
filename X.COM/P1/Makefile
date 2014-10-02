.PHONY: avr	

avr:
	avr-gcc -std=c99 -Os -mmcu=atmega328p -fshort-enums -DF_CPU=16000000UL checksum.c blck_serial.c queue.c serial.c test_checksum.c -o jose

	avr-objcopy -Oihex jose main.hex	
	sudo avrdude -c arduino -p atmega328p -P /dev/ttyACM0 -U main.hex	
	sudo picocom /dev/ttyACM0
.PHONY: clean
clean:
	rm -f main ∗ ̃ *.hex *.txt *.pyc *.c~ *.o 
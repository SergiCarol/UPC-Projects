.PHONY: avr clean tar_clean	


test_checksum:
	avr-gcc -std=c99 -Os -mmcu=atmega328p -fshort-enums -DF_CPU=16000000UL checksum.c blck_serial.c queue.c serial.c test_checksum.c -o main

	avr-objcopy -Oihex main main.hex	
	sudo avrdude -c arduino -p atmega328p -P /dev/ttyACM0 -U main.hex	
	sudo picocom /dev/ttyACM0


error_morse_pc:
	gcc error_morse_pc.c -o main

test_crc:
	avr-gcc -std=c99 -Os -mmcu=atmega328p -fshort-enums -DF_CPU=16000000UL checksum.c blck_serial.c queue.c serial.c test_crc.c -o main

	avr-objcopy -Oihex main main.hex	
	sudo avrdude -c arduino -p atmega328p -P /dev/ttyACM0 -U main.hex	
	sudo picocom /dev/ttyACM0

clean:
	rm -f main ∗ ̃ *.hex *.txt *.pyc *.c~ *.o 
tar_clean:
	rm -f main ∗ ̃ *.hex *.txt *.pyc *.c~ *.o 
	tar cvf projecte.tar.gz .

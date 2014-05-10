PHONY: avr main	clean tar
main:
avr: 
	avr-gcc -std=c99 -Os -mmcu=atmega328p -fshort-enums -DF_CPU=16000000UL modulator.c test_modulator.c -o main
	avr-objcopy -Oihex main main.hex	
	sudo avrdude -c arduino -p atmega328p -P /dev/ttyACM0 -U main.hex
clean:
	rm main main.hex *.txt
tar: clean
	tar cvf projecte.tar.gz .

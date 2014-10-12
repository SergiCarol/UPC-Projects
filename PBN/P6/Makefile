PHONY: avr main	clean tar
main:
avr: 
	avr-gcc -std=c99 -Os -mmcu=atmega328p -fshort-enums -DF_CPU=16000000UL timer.c queue.c mtbl.c mchar.c ether.c modulator.c serial.c blck_serial.c gpio_device.c lamp.c semaph.c control.c crossing.c -o main
	avr-objcopy -Oihex main main.hex	
	sudo avrdude -c arduino -p atmega328p -P /dev/ttyACM0 -U main.hex
clean:
	rm -f main main.hex *.txt *.pyc *.c~
tar: 
	tar cvf projecte.tar.gz .

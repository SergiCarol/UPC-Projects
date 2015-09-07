PHONY: avr main	clean tar
main:
avr: 
	avr-gcc -std=c99 -Os -mmcu=atmega328p -fshort-enums -DF_CPU=16000000UL timer.c queue.c  serial.c gpio_device.c  bcab.c -o main
	avr-objcopy -Oihex main main.hex	
	sudo avrdude -c arduino -p atmega328p -P /dev/ttyACM0 -U main.hex
clean:
	rm -f main main.hex *.txt *.pyc *.c~ *.beam

tar: 	clean
	tar cvf projecte.tar.gz .

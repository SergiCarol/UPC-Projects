PHONY: avr main		
main: 
avr:
	avr-gcc -std=c99 -Os -mmcu=atmega328p -fshort-enums -DF_CPU=16000000UL gpio_device.c main.c semaphore.c serial_device.c controlsem.c  -o main
	avr-objcopy -Oihex main main.hex	
	sudo avrdude -c arduino -p atmega328p -P /dev/ttyACM0 -U main.hex

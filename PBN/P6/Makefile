PHONY: avr main		
main: 
avr:
	avr-gcc -std=c99 -Os -mmcu=atmega328p -fshort-enums -DF_CPU=16000000UL gpio_device.c queue.c serial.c blck_serial.c lamp.c timer.c test_timer.c -o main
	avr-objcopy -Oihex main main.hex	
	sudo avrdude -c arduino -p atmega328p -P /dev/ttyACM0 -U main.hex

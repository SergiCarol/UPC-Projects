.set PORTB , 0x05
.set PINB , 0x03
.equ DDRB , 0x04

.global main

main:
	sbi	DDRB , 5
	cbi	PORTB , 5
loop:
	in 		r16 , PORTB
	sbrs 	r16 , 3
	sbi		PORTB , 5
	rjmp	loop
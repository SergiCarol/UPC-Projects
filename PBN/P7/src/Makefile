CC=avr−gcc
CPPFLAGS=−DF CPU=16000000UL
CFLAGS=−Wall −std=c99 −Os −mmcu=atmega328p −fshort−enums −Ilibpbn
vpath lib% libpbn
	master: control.o −lpbn
	master.o: control.h

.PHONY: libpbn

libpbn:
	$(MAKE) −C libpbn
.PHONY: clean veryclean

clean:
	\rm −f ∗ ̃ ∗.o ∗.s ∗.hex
	$(MAKE) −C libpbn clean
CC=gcc
CFLAGS = -std=c99
.PHONY: parent child

parent.o: parent.c matrix.o
child.o: child.c matrix.o
matrix.o: matrix.h

parent: child parent.o matrix.o
	$(CC) $(CFLAGS) parent.o matrix.o -o parent -lrt
child: child.o matrix.o
	$(CC) $(CFLAGS) child.o matrix.o -o child -lrt


clean:
	rm -f *.o parent child matrix

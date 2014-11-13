CC=gcc

.PHONY: parent child

parent.o: parent.c matrix.o
child.o: child.c
matrix.o: matrix.h

parent: child parent.o matrix.o
	$(CC) parent.o matrix.o -o parent -lrt
child: child.o
	$(CC) child.o -o child -lrt


clean:
	rm -f *.o parent child

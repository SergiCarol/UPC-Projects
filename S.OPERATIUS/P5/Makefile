CC=gcc

.PHONY: parent child

parent.o: parent.c 
child.o: child.c

parent: parent.o 
	$(CC) parent.o -o parent
child: child.o
	$(CC) child.o -o child


clean:
	rm -f *.o parent child

CC=gcc
.PHONY: shrtbl poll pollgraph

shrtbl.o: shrtbl.h
poll.o: poll.c shrtbl.o
pollgraph.o: pollgraph.c shrtbl.o

poll: poll.o shrtbl.o
	$(CC)  poll.o shrtbl.o -o poll -lrt -pthread
pollgraph: pollgraph.o shrtbl.o
	$(CC)  pollgraph.o shrtbl.o -o pollgraph -lrt -pthread

clean:
	rm -f *.o *.png poll pollgraph 

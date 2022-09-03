CC=$(CROSS_PREFIX)gcc
CPP=$(CROSS_PREFIX)g++
CFLAGS=-Wall -g $(PROFILE) -MMD
CFLAGS+= -O3
#CFLAGS+=-flto
#CFLAGS+=-Os
LDFLAGS=

CFLAGS+=-p
LDFLAGS+=-p

#linenoise_example: linenoise.h linenoise.c

example: linenoise.c example.c
	$(CC) -Wall -W -Os -g -o example linenoise.c example.c
	rm -f *.d

linenoise.o: linenoise.c
	$(CC) $(CFLAGS) -c -o $@ $<

lib: linenoise.o
	ar r libnoise.a linenoise.o
	rm -f *.d *.o

clean:
	rm -f linenoise_example *.o *.a

PROG= fsevent_watch
SRC= $(wildcard *.c)
OBJ= $(SRC:.c=.o)

CC= clang
CFLAGS= -DCLI_VERSION="\"$(shell git describe --always)\""
CFLAGS+= -Wno-deprecated-declarations
#CFLAGS+= -DDEBUG
LDFLAGS= -framework CoreFoundation -framework CoreServices

PREFIX ?= /usr/local

$(PROG): $(OBJ)
	$(CC) $(LDFLAGS) $(OBJ) -o $@

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

install: $(PROG)
	install -m 755 $< $(PREFIX)/bin

clean:
	rm -f *.o $(PROG)

printflags:
	perl -lane 'printf "\\%o%s", $$., $$F[0]' < flags | pbcopy


SRC= $(wildcard *.c)
OBJ= $(SRC:.c=.o)

CC= clang
CFLAGS= -DPROJECT_VERSION="0.1"
LDFLAGS= -framework CoreFoundation -framework CoreServices

fsevent_watch: $(OBJ)
	$(CC) $(LDFLAGS) $(OBJ) -o $@

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

# fsevent_watch

The tool allows you to watch filesystem events on a Mac.

This is a standalone fork the C tool inside https://github.com/thibaudgg/rb-fsevent
focused on usability and *composability* with other tools.

## Awesomeness

* `fsevent_watch` has a damn simple parseable output (tab-delimited)

```
% ./fsevent_watch -F .  # in the mean time i run `make clean fsevent_watch`
86693279	0x00010200=[IRemoved]	/tank/proger/fsevent_watch/main.o
86693282	0x00010200=[IRemoved]	/tank/proger/fsevent_watch/fsevent_watch
86693291	0x00011900=[ICreated,IRenamed,IModified]	/tank/proger/fsevent_watch/cli.o-b995d254
86693292	0x00010a00=[IRemoved,IRenamed]	/tank/proger/fsevent_watch/cli.o
86693301	0x00011900=[ICreated,IRenamed,IModified]	/tank/proger/fsevent_watch/compat.o-b9dbbb8a
86693302	0x00010a00=[IRemoved,IRenamed]	/tank/proger/fsevent_watch/compat.o
86693305	0x00010100=[ICreated]	/tank/proger/fsevent_watch/main.o-2f7870a4
86693311	0x00011900=[ICreated,IRenamed,IModified]	/tank/proger/fsevent_watch/main.o-2f7870a4
86693312	0x00010a00=[IRemoved,IRenamed]	/tank/proger/fsevent_watch/main.o
86693324	0x00014d00=[ICreated,IInodeMetaMod,IRenamed,IChangeOwner]	/tank/proger/fsevent_watch/fsevent_watch.ld_gYfEvE
86693325	0x00010a00=[IRemoved,IRenamed]	/tank/proger/fsevent_watch/fsevent_watch
```

* `fsevent_watch` does line-buffering so you can even develop the tool with itself!

```
% ./fsevent_watch -F . | egrep --line-buffered '\.[ch]$' | xargs -t -n1 -I% make
make
clang -c -DCLI_VERSION="\"f785a34\"" -Wno-deprecated-declarations main.c -o main.o
clang -framework CoreFoundation -framework CoreServices cli.o compat.o main.o -o fsevent_watch
make
make: `fsevent_watch' is up to date.
make
make: `fsevent_watch' is up to date.
^C
```

## Building

* just run `make install` (and make sure you have a compiler)

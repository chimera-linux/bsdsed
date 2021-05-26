CC      ?= cc
CFLAGS  ?= -O2
PREFIX  ?= /usr/local
BINDIR  ?= $(PREFIX)/bin
DATADIR ?= $(PREFIX)/share
MANDIR  ?= $(DATADIR)/man/man1
EXTRA_CFLAGS = -Wall -Wextra -I. -Dlint

OBJS = compile.o main.o misc.o process.o errc.o

PROGRAM = sed
INSTALL_NAME ?= $(PROGRAM)

.PHONY: clean

all: $(PROGRAM)

.c.o:
	$(CC) -c -o $@ $< $(EXTRA_CFLAGS) $(CFLAGS)

$(PROGRAM): $(OBJS)
	$(CC) $(EXTRA_CFLAGS) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $(PROGRAM)

clean:
	rm -f $(OBJS) $(PROGRAM)

install:
	install -D -m 755 $(PROGRAM) $(DESTDIR)$(BINDIR)/$(INSTALL_NAME)
	install -D -m 644 $(PROGRAM).1 $(DESTDIR)$(MANDIR)/$(INSTALL_NAME).1

check:
	PATH=.:$(PATH) ./tests/multi_test.sh || exit 1
	PATH=.:$(PATH) ./tests/inplace_race_test.sh || exit 1
	rm -f lines*

PREFIX ?= /usr/local
MANDIR ?= $(PREFIX)/share/man

.PHONY: all install

all:

install:
	install -m 755 jan $(PREFIX)/bin
	gzip -nk9 jan.8
	install -m 644 jan.8.gz $(MANDIR)/man8
	rm jan.8.gz

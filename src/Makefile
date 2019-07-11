# Copyright © 2017-2018 by SuperSonic Imagine, SA

ifdef DESTDIR
prefix = /usr
else
prefix = /usr/local
endif

# Install Variables
BINDIR=$(prefix)/bin
LOGROTDIR=/etc/logrotate.d
SHAREDIR=$(prefix)/share/kt-update

.PHONY: all build clean install uninstall
all : build

clean:

install: kt-update kt-update.env
	# Bin
	mkdir -p $(DESTDIR)$(BINDIR)
	install -m755 kt $(DESTDIR)$(BINDIR)
	install -m755 kt-update $(DESTDIR)$(BINDIR)
	install -m644 kt-update.env $(DESTDIR)$(BINDIR)
	# Logrotate
	mkdir -p $(DESTDIR)$(LOGROTDIR)
	install -m644 logrotate $(DESTDIR)$(LOGROTDIR)/kt-update
	# ShareDir
	mkdir -p $(DESTDIR)$(SHAREDIR)

uninstall:
	rm $(DESTDIR)$(CRONDIR)/kt-update
	rm $(DESTDIR)$(BINDIR)/kt
	rm $(DESTDIR)$(BINDIR)/kt-update
	rm $(DESTDIR)$(BINDIR)/kt-update.env
	rm $(DESTDIR)$(LOGROTDIR)/kt-update
	rm -rf $(DESTDIR)$(SHAREDIR)


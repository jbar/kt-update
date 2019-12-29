# Copyright © 2017-2018 by SuperSonic Imagine, SA

ifdef DESTDIR
prefix = /usr
else
prefix = /usr/local
endif

# Install Variables
BINDIR=$(prefix)/bin
LIBDIR=$(prefix)/lib
LOGROTDIR=/etc/logrotate.d
SHAREDIR=$(prefix)/share/kt-update

.PHONY: all build clean install uninstall
all : build

clean:

install: kt-update kt-update.env
	# Bin
	mkdir -p $(DESTDIR)$(BINDIR)
	install -m755 kt $(DESTDIR)$(BINDIR)
	ln -s kt $(DESTDIR)$(BINDIR)/kt-update
	mkdir -p $(DESTDIR)$(LIBDIR)
	install -m755 kt-update.env $(DESTDIR)$(LIBDIR)
	# Logrotate
	mkdir -p $(DESTDIR)$(LOGROTDIR)
	install -m644 logrotate $(DESTDIR)$(LOGROTDIR)/kt-update
	# ShareDir
	mkdir -p $(DESTDIR)$(SHAREDIR)

uninstall:
	#rm $(DESTDIR)$(CRONDIR)/kt-update
	rm $(DESTDIR)$(BINDIR)/kt
	rm $(DESTDIR)$(BINDIR)/kt-update
	rm $(DESTDIR)$(LIBDIR)/kt-update.env
	rm $(DESTDIR)$(LOGROTDIR)/kt-update
	rm -rf $(DESTDIR)$(SHAREDIR)


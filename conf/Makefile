ETCDIR=/etc/cron-apt
ACTIONDIR=$(ETCDIR)/action.d
DOCDIR=/usr/share/doc/cron-apt

all:

clean:

install: install-examples config 0-update 3-download
	mkdir -p $(DESTDIR)$(ETCDIR)
	mkdir -p $(DESTDIR)$(ACTIONDIR)
	mkdir -p $(DESTDIR)$(ETCDIR)/config.d
	mkdir -p $(DESTDIR)$(ETCDIR)/mailmsg.d
	mkdir -p $(DESTDIR)$(ETCDIR)/syslogmsg.d
	mkdir -p $(DESTDIR)$(ETCDIR)/mailonmsgs
	mkdir -p $(DESTDIR)$(ETCDIR)/syslogonmsgs
	mkdir -p $(DESTDIR)$(ETCDIR)/errormsg.d
	mkdir -p $(DESTDIR)$(ETCDIR)/logmsg.d
	install -m644 config $(DESTDIR)$(ETCDIR)
	install -m644 0-update $(DESTDIR)$(ACTIONDIR)/
	install -m644 3-download $(DESTDIR)$(ACTIONDIR)/

install-examples: config 0-update 3-download 9-notify
	mkdir -p $(DESTDIR)$(DOCDIR)/examples
	install -m644 [0-9]-* -p $(DESTDIR)$(DOCDIR)/examples
	install -m644 config $(DESTDIR)$(DOCDIR)/examples

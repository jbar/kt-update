CRONDIR=/etc/cron.d
BINDIR=/usr/sbin
LOGROTDIR=/etc/logrotate.d
SHAREDIR=/usr/share/cron-apt

all:

clean:

install: cron.d cron-apt functions
	# Cron job
	mkdir -p $(DESTDIR)$(CRONDIR)
	install -m644 cron.d $(DESTDIR)$(CRONDIR)/cron-apt
	# Bin
	mkdir -p $(DESTDIR)$(BINDIR)
	install -m755 cron-apt $(DESTDIR)$(BINDIR)
	# Shared functions
	mkdir -p $(DESTDIR)$(SHAREDIR)
	install -m644 functions $(DESTDIR)$(SHAREDIR)/functions
	# Logrotate
	mkdir -p $(DESTDIR)$(LOGROTDIR)
	install -m644 logrotate $(DESTDIR)$(LOGROTDIR)/cron-apt

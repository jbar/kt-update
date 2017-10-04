MANDIR=/usr/share/man

all:
	docbook-to-man cron-apt.sgml > cron-apt.8
	docbook-to-man cron-apt.fr.sgml > cron-apt.fr.8
	gzip -9 *.8

clean:
	rm -f cron-apt.8* cron-apt.fr.8*

install: cron-apt.8.gz cron-apt.fr.8.gz
	mkdir -p $(DESTDIR)$(MANDIR)/man8
	install -m644 cron-apt.8.gz \
		$(DESTDIR)$(MANDIR)/man8
	mkdir -p $(DESTDIR)$(MANDIR)/fr/man8
	install -m644 cron-apt.fr.8.gz \
		$(DESTDIR)$(MANDIR)/fr/man8/cron-apt.8.gz

MANDIR = /usr/share/man
MANDATE = $(shell LANG=C git log -1 --format="%ad" --date="format:%d %B %Y" ../README.md)

kt-update.8.gz:
ifeq "$(MANDATE)" ""
	pandoc -s -t man ../README.md  | gzip > kt-update.8.gz
else
	sed '1,6s;^date:.*;date: $(MANDATE);' < ../README.md | pandoc -s -t man | gzip > kt-update.8.gz
endif

kt.8.gz: kt-update.8.gz
	ln -s kt-update.8.gz kt.8.gz

all: kt-update.8.gz

clean:
	rm -f kt-update.8.gz kt.8.gz

install: kt-update.8.gz
	mkdir -p $(DESTDIR)$(MANDIR)/man8
	install -m644 kt-update.8.gz \
		$(DESTDIR)$(MANDIR)/man8
	ln -s kt-update.8.gz $(DESTDIR)$(MANDIR)/man8/kt.8.gz
	#mkdir -p $(DESTDIR)$(MANDIR)/fr/man8
	#install -m644 kt-update.fr.8.gz \
	#	$(DESTDIR)$(MANDIR)/fr/man8/kt-update.8.gz

uninstall:
	#rm $(DESTDIR)$(MANDIR)/fr/man8/kt-update.8.gz
	rm $(DESTDIR)$(MANDIR)/man8/kt-update.8.gz $(DESTDIR)$(MANDIR)/man8/kt.8.gz

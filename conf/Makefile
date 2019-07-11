ETCDIR=/etc/kt-update
DOCDIR=/usr/share/doc/kt-update
CERTDIR=/etc/ssl/certs
COMPLETIONDIR=/usr/share/bash-completion/completions
DEFAULTSERVERURI=https://raw.githubusercontent.com/jbar/server-example
DEFAULTID=stable

01default.conf: example.conf
	sed 's,^#\?IDENTIFIER=.*,IDENTIFIER="$(DEFAULTID)", ' example.conf > 01default.conf
	sed -i 's,^#\?KT_SERVER_URI=.*,KT_SERVER_URI="$(DEFAULTSERVERURI)", ' 01default.conf
	echo '# Default options when using wget, you better not touch it...' >> 01default.conf
	echo 'WGET_OPTIONS+=" --ca-directory=$(CERTDIR)"' >> 01default.conf

all: 01default.conf bash_completion.d/kt-update

clean:
	rm 01default.conf

install: install-examples 01default.conf
	mkdir -p $(DESTDIR)$(ETCDIR)/conf.d
	install -m644 01default.conf $(DESTDIR)$(ETCDIR)/conf.d
	#mkdir -p $(DESTDIR)$(CERTDIR)
	#install -m644 *.pem $(DESTDIR)$(CERTDIR)/
	mkdir -p $(DESTDIR)$(COMPLETIONDIR)
	install -m644 bash_completion.d/kt-update $(DESTDIR)$(COMPLETIONDIR)/

install-examples: example.conf
	mkdir -p $(DESTDIR)$(DOCDIR)
	install -m644 example.conf $(DESTDIR)$(DOCDIR)/

uninstall:
	rm -rv $(DESTDIR)$(ETCDIR)
	rm -rv $(DESTDIR)$(DOCDIR)
	rm -v $(DESTDIR)$(COMPLETIONDIR)/kt-update

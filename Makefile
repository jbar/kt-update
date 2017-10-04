MAKEDIRS = src conf man

LOGDIR=/var/log/cron-apt
LIBDIR=/var/lib/cron-apt

all:
	for md in $(MAKEDIRS) ; do \
		$(MAKE) -C $$md $@ ; \
	done

clean:
	for md in $(MAKEDIRS) ; do \
		$(MAKE) -C $$md $@ ; \
	done

install:
	for md in $(MAKEDIRS) ; do \
		$(MAKE) -C $$md $@ ; \
	done
	# Log
	mkdir -p $(DESTDIR)$(LOGDIR)
	# Lib
	mkdir -p $(DESTDIR)$(LIBDIR)
	mkdir -p $(DESTDIR)$(LIBDIR)/mailchanges

test: test.forced

test.forced:
	$(MAKE) -C test test

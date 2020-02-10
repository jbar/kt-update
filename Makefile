MAKEDIRS = src conf man

LOGDIR=/var/log/kt-update
LIBDIR=/var/lib/kt-update

all:
	for md in $(MAKEDIRS) ; do \
		$(MAKE) -C $$md $@ ; \
	done

clean:
	for md in $(MAKEDIRS) ; do \
		$(MAKE) -C $$md $@ ; \
	done
	make -C test clean

install:
	for md in $(MAKEDIRS) ; do \
		$(MAKE) -C $$md $@ ; \
	done
	# Log
	mkdir -p $(DESTDIR)$(LOGDIR)
	# Lib
	mkdir -p $(DESTDIR)$(LIBDIR)

uninstall:
	for md in $(MAKEDIRS) ; do \
		$(MAKE) -C $$md $@ ; \
	done
	# Log
	rm -rv $(DESTDIR)$(LOGDIR)
	# Lib
	rm -rv $(DESTDIR)$(LIBDIR)

test: test.forced

test.forced:
	$(MAKE) -C test test

prefix=/usr/local
exec_prefix=$(prefix)
bindir=$(exec_prefix)/bin
sbindir=$(exec_prefix)/sbin
sysconfdir=$(prefix)/etc

INSTALL=install
INSTALL_PROGRAM=$(INSTALL)
INSTALL_DATA=$(INSTALL) -m 644

all :

dmc-env :
	echo "#!/bin/sh" >$@
	echo "export DMC_SYSCONFDIR=\"$(sysconfdir)\"" >>$@

installdirs :
	mkdir -p $(DESTDIR)$(bindir)
	mkdir -p $(DESTDIR)$(sbindir)
	mkdir -p $(DESTDIR)$(sysconfdir)

install : dmc-env installdirs
	$(INSTALL_PROGRAM) -t $(DESTDIR)$(bindir) \
		dmc-env
	$(INSTALL_PROGRAM) -t $(DESTDIR)$(sbindir) \
		dmc-load \
		dmc-mklvm
	$(INSTALL_DATA) -t $(DESTDIR)$(sysconfdir) \
		dmctab
	rm dmc-env

clean :

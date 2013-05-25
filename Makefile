prefix=/usr/local
exec_prefix=$(prefix)
sbindir=$(exec_prefix)/sbin
sysconfdir=$(prefix)/etc

INSTALL=install
INSTALL_PROGRAM=$(INSTALL)
INSTALL_DATA=$(INSTALL) -m 644

all :

installdirs :
	mkdir -p $(DESTDIR)$(sbindir)
	mkdir -p $(DESTDIR)$(sysconfdir)

install : installdirs
	$(INSTALL_PROGRAM) -t $(DESTDIR)$(sbindir) \
		dmc-load \
		dmc-mklvm
	$(INSTALL_DATA) -t $(DESTDIR)$(sysconfdir) \
		dmctab

clean :

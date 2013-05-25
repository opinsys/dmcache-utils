prefix=/usr/local
exec_prefix=$(prefix)
sbindir=$(exec_prefix)/sbin

INSTALL=install
INSTALL_PROGRAM=$(INSTALL)
INSTALL_DATA=$(INSTALL) -m 644

all :

installdirs :
	mkdir -p $(DESTDIR)/etc
	mkdir -p $(DESTDIR)/sbin
	mkdir -p $(DESTDIR)$(sbindir)

install : installdirs
	# dmc-load must be in a known place for udev rules to find it,
	# hence the path is hard-coded here.
	$(INSTALL_PROGRAM) -t $(DESTDIR)/sbin \
		dmc-load
	# Userland tools can be installed anywhere, configurable
	# sbindir is ok
	$(INSTALL_PROGRAM) -t $(DESTDIR)$(sbindir) \
		dmc-mklvm
	# dmctab must be in a known place for dmc-load to find it,
	# hence the path is hard-coded here.
	$(INSTALL_DATA) -t $(DESTDIR)/etc \
		dmctab

clean :

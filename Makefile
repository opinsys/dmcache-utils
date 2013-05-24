prefix=/usr/local
exec_prefix=$(prefix)
sbindir=$(exec_prefix)/sbin

INSTALL_PROGRAM=$(INSTALL)
INSTALL_DATA=$(INSTALL) -m 644

all :

installdirs :
	mkdir -p $(DESTDIR)$(sbindir)

install : installdirs
	$(INSTALL_PROGRAM) -t $(DESTDIR)$(sbindir) \
		sbin/mkdmcache \
		sbin/rmdmcache

clean :

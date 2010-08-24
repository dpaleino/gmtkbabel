INSTALL = install
RM = rm

all:

installdirs:
	$(INSTALL) -d $(DESTDIR)/usr/share/gmtkbabel/
	$(INSTALL) -d $(DESTDIR)/usr/bin/

install: installdirs
	$(INSTALL) gmtkbabel $(DESTDIR)/usr/bin/
	$(INSTALL) *.sh $(DESTDIR)/usr/share/gmtkbabel/

uninstall:
	$(RM) -rf $(DESTDIR)/usr/share/gmtkbabel/
	$(RM) -rf $(DESTDIR)/usr/bin/gmtkbabel

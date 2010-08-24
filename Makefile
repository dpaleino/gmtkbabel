INSTALL = install
RM = rm

SCRIPTS = set_format.sh set_frequency.sh download.sh erase.sh gmtkbabel

all:

update-po: $(SCRIPTS)
	$(RM) po/gmtkbabel.pot
	for i in $(SCRIPTS); do \
	    bash --dump-po-strings < $$i >> po/gmtkbabel.pot ; \
	done

installdirs:
	$(INSTALL) -d $(DESTDIR)/usr/share/gmtkbabel/
	$(INSTALL) -d $(DESTDIR)/usr/bin/

install: installdirs
	$(INSTALL) gmtkbabel $(DESTDIR)/usr/bin/
	$(INSTALL) *.sh $(DESTDIR)/usr/share/gmtkbabel/

uninstall:
	$(RM) -rf $(DESTDIR)/usr/share/gmtkbabel/
	$(RM) -rf $(DESTDIR)/usr/bin/gmtkbabel

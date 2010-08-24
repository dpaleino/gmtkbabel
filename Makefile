INSTALL = install
RM = rm

SCRIPTS = set_format.sh set_frequency.sh download.sh erase.sh gmtkbabel

all:

update-po: $(SCRIPTS)
	$(RM) -f po/gmtkbabel.pot
	xgettext --language=shell --from-code=utf-8 \
	    --copyright-holder="David Paleino <d.paleino@gmail.com>" \
	    --package-name="gmtkbabel" \
	    --package-version="0.1" \
	    --msgid-bugs-address="d.paleino@gmail.com" \
	    $(SCRIPTS) -o po/gmtkbabel.pot

installdirs:
	$(INSTALL) -d $(DESTDIR)/usr/share/gmtkbabel/
	$(INSTALL) -d $(DESTDIR)/usr/bin/

install: installdirs
	$(INSTALL) gmtkbabel $(DESTDIR)/usr/bin/
	$(INSTALL) *.sh $(DESTDIR)/usr/share/gmtkbabel/

uninstall:
	$(RM) -rf $(DESTDIR)/usr/share/gmtkbabel/
	$(RM) -rf $(DESTDIR)/usr/bin/gmtkbabel

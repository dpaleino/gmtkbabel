INSTALL = install
RM = rm
PREFIX = /usr

SCRIPTS = \
    src/download.sh \
    src/erase.sh \
    src/gmtkbabel \
    src/set_format.sh \
    src/set_frequency.sh

all: update-po

update-po: $(SCRIPTS)
	$(RM) -f po/gmtkbabel.pot
	xgettext --language=shell --from-code=utf-8 \
	    --copyright-holder="David Paleino <d.paleino@gmail.com>" \
	    --package-name="gmtkbabel" \
	    --package-version="0.1" \
	    --msgid-bugs-address="d.paleino@gmail.com" \
	    $(SCRIPTS) -o po/gmtkbabel.pot

installdirs:
	$(INSTALL) -d $(DESTDIR)$(PREFIX)/share/gmtkbabel/
	$(INSTALL) -d $(DESTDIR)$(PREFIX)/bin/

install: installdirs
	$(INSTALL) src/gmtkbabel $(DESTDIR)$(PREFIX/bin/
	$(INSTALL) src/*.sh $(DESTDIR)$(PREFIX)/share/gmtkbabel/

uninstall:
	$(RM) -rf $(DESTDIR)$(PREFIX)/share/gmtkbabel/
	$(RM) -rf $(DESTDIR)$(PREFIX)/bin/gmtkbabel

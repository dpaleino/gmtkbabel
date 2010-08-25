INSTALL = install
RM = rm
PREFIX = /usr

SCRIPTS = \
    src/download.sh \
    src/erase.sh \
    src/gmtkbabel \
    src/set_format.sh \
    src/set_frequency.sh

all: build

build: update-po
	for l in $(shell cat po/LINGUAS); do \
	    msgfmt po/$$l.po -o po/$$l.mo; \
	done
	gzip -9c gmtkbabel.1 > gmtkbabel.1.gz

update-po: $(SCRIPTS)
	xgettext --language=shell --from-code=utf-8 \
	    --copyright-holder="David Paleino <d.paleino@gmail.com>" \
	    --package-name="gmtkbabel" \
	    --package-version="0.1" \
	    --msgid-bugs-address="d.paleino@gmail.com" \
	    $(SCRIPTS) -o po/gmtkbabel.pot
	for l in $(shell cat po/LINGUAS); do \
	    msgmerge --update --backup=none po/$$l.po po/gmtkbabel.pot; \
	done

installdirs:
	$(INSTALL) -d $(DESTDIR)$(PREFIX)/share/gmtkbabel/
	$(INSTALL) -d $(DESTDIR)$(PREFIX)/bin/
	$(INSTALL) -d $(DESTDIR)/etc
	$(INSTALL) -d $(DESTDIR)$(PREFIX)/share/man/man1/

	for l in $(shell cat po/LINGUAS); do \
	    $(INSTALL) -d $(DESTDIR)$(PREFIX)/share/locale/$$l/LC_MESSAGES/; \
	done

install: build installdirs
	$(INSTALL) src/gmtkbabel $(DESTDIR)$(PREFIX)/bin/
	$(INSTALL) -m 644 src/*.sh $(DESTDIR)$(PREFIX)/share/gmtkbabel/
	$(INSTALL) -m 644 gmtkbabel.conf $(DESTDIR)/etc/

	for l in $(shell cat po/LINGUAS); do \
	    $(INSTALL) -m 644 po/$$l.mo \
	        $(DESTDIR)$(PREFIX)/share/locale/$$l/LC_MESSAGES/gmtkbabel.mo; \
	done

	$(INSTALL) -m 644 gmtkbabel.1.gz $(DESTDIR)$(PREFIX)/share/man/man1/

uninstall:
	$(RM) -rf $(DESTDIR)$(PREFIX)/share/gmtkbabel/
	$(RM) -rf $(DESTDIR)$(PREFIX)/bin/gmtkbabel
	find $(DESTDIR)$(PREFIX)/share/locale -name "gmtkbabel.mo" -delete
	$(RM) -rf $(DESTDIR)$(PREFIX)/share/man/man1/gmtkbabel.1.gz

clean:
	$(RM) -rf po/*.mo
	$(RM) -rf gmtkbabel.1.gz

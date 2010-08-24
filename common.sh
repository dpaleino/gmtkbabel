. gettext.sh

export TEXTDOMAINDIR=/usr/share/locale/
export TEXTDOMAIN=gmtkbabel

for dir in /etc/gmtkbabel.conf ~/.config/gmtkbabel.conf; do
	[ -r $dir ] && . $dir
done

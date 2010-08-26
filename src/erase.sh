#!/bin/sh

# Copyright © 2010, Elena Grandi
# Copyright © 2010, David Paleino <d.paleino@gmail.com>
#
# Released under 3-clause BSD license; see COPYING for details.

. /usr/share/gmtkbabel/common.sh

# ****** Strings ************************************************************* #

S_TITLE="`gettext \"iBlue 747 erase\"`"
S_CONFIRM_ERASE="`gettext \"Erase logger memory?\"`"

# ****** Script (do not edit below this point) ******************************* #

TMPFILE=`mktemp /tmp/gmtkbabel.XXX`
trap "rm -rf $TMPFILE; exit" INT TERM EXIT;

if zenity --question --title="$S_TITLE" --text="$S_CONFIRM_ERASE"
then
    mtkbabel -p $PORT -l off -E >$TMPFILE 2>&1
    mtkbabel -p $PORT -l on >>$TMPFILE 2>&1
    cat $TMPFILE | zenity --text-info
fi

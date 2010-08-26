#!/bin/sh

# Copyright © 2010, Elena Grandi
# Copyright © 2010, David Paleino <d.paleino@gmail.com>
#
# Released under 3-clause BSD license; see COPYING for details.

. /usr/share/gmtkbabel/common.sh

# ****** Strings ************************************************************* #

S_TITLE="`gettext \"iBlue 747 download\"`"
S_CONFIRM_OVERWRITE="`gettext \"It seems that the file exists: overwrite it?\"`"
S_CANCEL="`gettext \"Operation cancelled\"`"

# ****** Script (do not edit below this point) ******************************* #

TRK_NAME=`zenity --file-selection --title="$S_TITLE" \
    --save --filename=$DIR/$FNAME`

if [ -e "$TRK_NAME".gpx ] || [ -e "$TRK_NAME"_trk.gpx ] || \
    [ -e "$TRK_NAME"_wpt.gpx ] || [ -e "$TRK_NAME".bin ]
then
    if ! zenity --question --title="$S_TITLE" \
        --text="$S_CONFIRM_OVERWRITE"
    then
        exit 1
    fi
fi

if [ -n "$TRK_NAME" ]; then
    mtkbabel -p $PORT -l off -f "$TRK_NAME" -w -t >> "$TRK_NAME".log
    mtkbabel -p $PORT -l on >> "$TRK_NAME".log
else
    zenity --error --text "$S_CANCEL"
fi


#!/bin/bash

# Copyright 2010 Elena Grandi
# Released under 3-clause BSD license; see COPYING.txt for details.

. gmtkbabel.conf

# ****** Strings ************************************************************* #

S_TITLE=$"iBlue 747 download"
S_CONFIRM_OVERWRITE=$"It seems that the file exists: overwrite it?"

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

mtkbabel -p $PORT -l off -f "$TRK_NAME" -w -t >> "$TRK_NAME".log
mtkbabel -p $PORT -l on >> "$TRK_NAME".log


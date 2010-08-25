#!/bin/bash

# Copyright © 2010, Elena Grandi
# Copyright © 2010, David Paleino <d.paleino@gmail.com>
#
# Released under 3-clause BSD license; see COPYING for details.

. /usr/share/gmtkbabel/common.sh

# ****** Strings ************************************************************* #

S_TITLE="`gettext \"iBlue 747 Set Frequency\"`"
S_SELECT_TIME="`gettext \"Log every n seconds (0 to disable)\"`"
S_SELECT_DISTANCE="`gettext \"Log every n meters (0 to disable)\"`"
S_SELECT_SPEED="`gettext \"Log over n km/h (0 to log at any speed)\"`"
S_SELECT_FULL="`gettext \"On memory full\"`"
S_FULL_STOP="`gettext \"Stop logging\"`"
S_FULL_OVERLAP="`gettext \"Overwrite older points\"`"

# ****** Script (do not edit below this point) ******************************* #

if TIME=`zenity --scale --title="$S_TITLE" --text="$S_SELECT_TIME" \
    --min-value=0 --max-value=999 --value=1 --step 1` && \
    DISTANCE=`zenity --scale --title="$S_TITLE" --text="$S_SELECT_DISTANCE" \
    --min-value=0 --max-value=9999  --value=0 --step 10` && \
    SPEED=`zenity --scale --title="$S_TITLE" --text="$S_SELECT_SPEED" \
    --min-value=0 --max-value=999 --value=0 --step 10` && \
    FULL=`zenity --list --title="$S_TITLE" --text="$S_SELECT_FULL" \
    --column "" --column "" \
    "stop" "$S_FULL_STOP" \
    "overlap" "$S_FULL_OVERLAP"`
then
    mtkbabel -p $PORT -r $TIME:$DISTANCE:$SPEED -m $FULL -l on
fi

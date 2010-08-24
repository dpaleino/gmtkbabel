#!/bin/bash

# Copyright 2010 Elena Grandi
# Released under 3-clause BSD license; see COPYING.txt for details.

. gmtkbabel.conf

# ****** Strings ************************************************************* #

S_TITLE=$"iBlue 747 Set Frequency"
S_SELECT_TIME=$"Log every n seconds (0 to disable)"
S_SELECT_DISTANCE=$"Log every n meters (0 to disable)"
S_SELECT_SPEED=$"Log over n km/h (0 to log at any speed)"
S_SELECT_FULL=$"On memory full"
S_FULL_STOP=$"Stop logging"
S_FULL_OVERLAP=$"Overwrite older points"

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



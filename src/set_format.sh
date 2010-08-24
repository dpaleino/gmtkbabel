#!/bin/bash

# Copyright 2010 Elena Grandi
# Released under 3-clause BSD license; see COPYING.txt for details.

. /usr/share/gmtkbabel/common.sh

# ****** Strings ************************************************************* #

S_TITLE="`gettext \"iBlue 747 set format\"`"

S_PRESET="`gettext \"Select a profile\"`"

S_PRESET_TITLE="`gettext \"Preset\"`"
S_PRESET_DESC="`gettext \"Description\"`"

S_P_LIGHT="`gettext \"Light\"`"
S_P_LIGHT_D="`gettext \"Essential fields, lots of points\"`"

S_P_FULL="`gettext \"Full\"`"
S_P_FULL_D="`gettext \"Everything: note that satellite data takes lots of space\"`"

S_P_NOSAT="`gettext \"No sat data\"`"
S_P_NOSAT_D="`gettext \"Everything except sat data, reasonable size\"`"

S_P_CUSTOM="`gettext \"Custom\"`"
S_P_CUSTOM_D="`gettext \"Select which fields should be saved\"`"

S_SELECT_FIELDS="`gettext \"Select the fields you want the logger to save\"`"
S_SAVE="`gettext \"Save?\"`"
S_FIELD="`gettext \"Field\"`"
S_DESC="`gettext \"Description\"`"

S_D_UTC="`gettext \"Timestamp\"`"
S_D_VALID="`gettext \"Position fix\"`"
S_D_LATITUDE="`gettext \"Latitude\"`"
S_D_LONGITUDE="`gettext \"Longitude\"`"
S_D_HEIGHT=""
S_D_SPEED=""
S_D_HEADING=""
S_D_DSTA="`gettext \"DGPS Station ID Number.\"`"
S_D_DAGE="`gettext \"Number of seconds since last DGPS update.\"`"
S_D_PDOP=""
S_D_VDOP=""
S_D_NSAT=""
S_D_SID=""
S_D_ELEVATION=""
S_D_AZIMUTH=""
S_D_SNR=""
S_D_RCR="`gettext \"Recording method\"`"
S_D_MILLISECOND=""
S_D_DISTANCE=""

# ****** Script (do not edit below this point) ******************************* #

case `zenity --list --title="$S_TITLE" --text="$S_PRESET" \
    --column "$S_PRESET_TITLE" --column "$S_PRESET_DESC" \
    "$S_P_LIGHT"  "$S_P_LIGHT_D" \
    "$S_P_FULL"   "$S_P_FULL_D" \
    "$S_P_NOSAT"  "$S_P_NOSAT_D" \
    "$S_P_CUSTOM" "$S_P_CUSTOM_D" ` in 
    "$S_P_LIGHT" )
        mtkbabel -p $PORT -o UTC,VALID,LATITUDE,LONGITUDE,-HEIGHT,SPEED,-HEADING,-DSTA,-DAGE,-PDOP,-HDOP,-VDOP,-NSAT,-SID,-ELEVATION,-AZIMUTH,-SNR,RCR,-MILLISECOND,-DISTANCE -l on ;;
    "$S_P_FULL" )
        mtkbabel -p $PORT -o UTC,VALID,LATITUDE,LONGITUDE,HEIGHT,SPEED,HEADING,DSTA,DAGE,PDOP,HDOP,VDOP,NSAT,SID,ELEVATION,AZIMUTH,SNR,RCR,MILLISECOND,DISTANCE -l on ;;
    "$S_P_NOSAT" )
        mtkbabel -p $PORT -o UTC,VALID,LATITUDE,LONGITUDE,HEIGHT,SPEED,HEADING,DSTA,DAGE,PDOP,HDOP,VDOP,NSAT,-SID,-ELEVATION,-AZIMUTH,-SNR,RCR,MILLISECOND,DISTANCE -l on;;
    "$S_P_CUSTOM" )
        if FIELDS=`zenity --list --title="$S_TITLE" --text="$S_CONFIRM_ERASE" \
            --checklist --multiple --separator "," \
            --column "$S_SAVE" --column "$S_FIELD" --column "$S_DESC" \
            TRUE UTC "$S_D_UTC" \
            TRUE VALID "$S_D_VALID" \
            TRUE LATITUDE "$S_D_LATITUDE" \
            TRUE LONGITUDE "$S_D_LONGITUDE" \
            FALSE HEIGHT "$S_D_HEIGHT" \
            TRUE SPEED "$S_D_SPEED" \
            FALSE HEADING "$S_D_HEADING" \
            FALSE DSTA "$S_D_DSTA" \
            FALSE DAGE "$S_D_DAGE" \
            FALSE PDOP "$S_D_PDOP" \
            FALSE HDOP "$S_D_HDOP" \
            FALSE VDOP "$S_D_VDOP" \
            FALSE NSAT "$S_D_NSAT" \
            FALSE SID "$S_D_SID" \
            FALSE ELEVATION "$S_D_ELEVATION" \
            FALSE AZIMUTH "$S_D_AZIMUTH" \
            FALSE SNR "$S_D_SNR" \
            TRUE RCR "$S_D_RCR" \
            FALSE MILLISECOND "$S_D_MILLISECOND" \
            FALSE DISTANCE "$S_D_DISTANCE" `
        then
            mtkbabel -p $PORT -o -UTC,-VALID,-LATITUDE,-LONGITUDE,-HEIGHT,-SPEED,-HEADING,-DSTA,-DAGE,-PDOP,-HDOP,-VDOP,-NSAT,-SID,-ELEVATION,-AZIMUTH,-SNR,-RCR,-MILLISECOND,-DISTANCE -l on
            mtkbabel -p $PORT -o $FIELDS
        fi ;;
esac


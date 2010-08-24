#!/bin/bash

# Copyright 2010 Elena Grandi
# Released under 3-clause BSD license; see COPYING.txt for details.

. gmtkbabel.conf

# ****** Strings ************************************************************* #

S_TITLE=$"iBlue 747 set format"

S_PRESET=$"Select a profile"

S_PRESET_TITLE=$"Preset"
S_PRESET_DESC=$"Description"

S_P_LIGHT=$"Light"
S_P_LIGHT_D=$"Essential fields, lots of points"

S_P_FULL=$"Full"
S_P_FULL_D=$"Everything: note that satellite data takes lots of space"

S_P_NOSAT=$"No sat data"
S_P_NOSAT_D=$"Everything except sat data, reasonable size"

S_P_CUSTOM=$"Custom"
S_P_CUSTOM_D=$"Select which fields should be saved"

S_SELECT_FIELDS=$"Select the fields you want the logger to save"
S_SAVE=$"Save?"
S_FIELD=$"Field"
S_DESC=$"Description"

S_D_UTC=$"Timestamp"
S_D_VALID=$"Position fix"
S_D_LATITUDE=$"Latitude"
S_D_LONGITUDE=$"Longitude"
S_D_HEIGHT=$""
S_D_SPEED=$""
S_D_HEADING=$""
S_D_DSTA=$"DGPS Station ID Number."
S_D_DAGE=$"Number of seconds since last DGPS update."
S_D_PDOP=$""
S_D_VDOP=$""
S_D_NSAT=$""
S_D_SID=$""
S_D_ELEVATION=$""
S_D_AZIMUTH=$""
S_D_SNR=$""
S_D_RCR=$"Recording method"
S_D_MILLISECOND=$""
S_D_DISTANCE=$""

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


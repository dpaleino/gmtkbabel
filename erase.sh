#!/bin/bash

# Copyright 2010 Elena Grandi
# Released under 3-clause BSD license; see COPYING.txt for details.

# ****** Configuration ******************************************************* #

# Logger device
PORT=/dev/ttyACM0

# ****** Strings ************************************************************* #

S_TITLE="iBlue 747 erase"
S_CONFIRM_ERASE="Erase logger memory?"

# ****** Script (do not edit below this point) ******************************* #

if zenity --question --title="$S_TITLE" --text="$S_CONFIRM_ERASE"
then
    mtkbabel -p $PORT -l off -E
    mtkbabel -p $PORT -l on
fi



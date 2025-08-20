#!/bin/bash

BLACKOUT=$(pluck export | grep -E "^block (otherwise|everything)$")
BLOCKS=$(pluck export | grep -E "^block [A-Za-z]*/$")
DELAY=$(pluck delay)
DEVTOOLS=$(pluck find nodevtools | cut -d ' ' -f 2)
NHB=$(pluck find nhb | cut -d ' ' -f 2)
PORTS=$(pluck export | grep -E "^block port [0-9]+.*$")
SAFE=$(pluck find safer | cut -d ' ' -f 2)
SOURCE=$(pluck find source | cut -d ' ' -f 1,3)
SYSTEM=$(pluck find system | cut -d ' ' -f 2)
UNADMIN=$(pluck find unadmin)
WHITEOUT=$(pluck export | grep -E "^allow (otherwise|everything)$")

TEMP_BLACKOUT=$(pluck find when $(date +%Y%m%d) block everything | sed '/#/d')

if [[ $1 == "delay" ]]; then
    echo "  $DELAY seconds"
elif [[ $1 == "blocks" ]]; then
    echo "$BLOCKS $BLACKOUT $WHITEOUT $PORTS $UNADMIN $SYSTEM $SAFE $NHB $DEVTOOLS $SOURCE $TEMP_BLACKOUT" | tr '\n' ' ' | tr -s ' ' | awk '{print " "$0}'
else
    echo "$DELAY seconds | $BLOCKS $BLACKOUT $WHITEOUT $PORTS $UNADMIN $SYSTEM $SAFE $NHB $DEVTOOLS $SOURCE $TEMP_BLACKOUT" | tr -s ' ' | tr '\n' ' ' | awk '{print "  "$0}'
fi

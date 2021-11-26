#!/bin/bash


BLACKOUT=$(pluck export | grep -E "^block (otherwise|everything)$")
BLOCKS=$(pluck export | grep -E "^block [A-Za-z]*\/$")
DELAY=$(pluck delay)
DEVTOOLS=$(pluck find nodevtools)
PORTS=$(pluck export | grep -E "^block port [0-9]+.*$")
WHITEOUT=$(pluck export | grep -E "^allow (otherwise|everything)$")

if [[ $1 == "delay" ]]; then
    echo " $DELAY seconds"
elif [[ $1 == "blocks" ]]; then
    echo " $BLOCKS $BLACKOUT $WHITEOUT $PORTS $DEVTOOLS" | tr '\n' ' ' | tr -s ' '
else
    echo " $DELAY seconds $BLOCKS $BLACKOUT $WHITEOUT $PORTS $DEVTOOLS" | tr -s ' ' | tr '\n' ''
fi

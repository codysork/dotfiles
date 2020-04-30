#!/bin/sh

IFACE=$(ifconfig | grep tun | awk '{print $1}')

if [ "$IFACE" = "tun0:" ]; then
    echo "賓"
else
    echo "%{F#FF0000}%{F-}"
fi

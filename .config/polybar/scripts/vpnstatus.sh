#!/bin/sh

IFACE=$(ifconfig | grep tun | awk '{print $1}')

if [ "$IFACE" = "tun0:" ]; then
    echo "%{F#00AA00}%{F-}"
else
    echo -e "%{F#AA0000}%{F-}"
fi

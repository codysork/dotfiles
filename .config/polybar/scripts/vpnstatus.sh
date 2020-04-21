#!/bin/sh

IFACE=$(ifconfig | grep tun | awk '{print $1}')

if [ "$IFACE" = "tun0:" ]; then
    echo "賓 $(ifconfig tun0 | grep inet | awk '{print $2}' | cut -f2 -d ':')"
else
    echo " %{F#FF0000}VPN DISCONNECTED%{F-}"
fi

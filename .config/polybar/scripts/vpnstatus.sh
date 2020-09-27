#!/bin/sh

RED='\033[0;31m'

IFACE=$(ifconfig | grep tun | awk '{print $1}')

if [ "$IFACE" = "tun0:" ]; then
    echo ""
else
    echo ""
fi

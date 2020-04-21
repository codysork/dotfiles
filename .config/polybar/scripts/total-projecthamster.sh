#!/bin/sh

totals=$(hamster list | tail -n 3)

if [ -n "$totals" ]; then
    echo " $totals"
fi

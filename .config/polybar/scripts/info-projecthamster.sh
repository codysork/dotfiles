#!/bin/sh

activity=$(hamster current 2> /dev/null | cut -d " " -f 3- | sed 's/@.* / - /')

if [ -n "$activity" ]; then
    echo "ﰌ $activity"
else 
    echo "תּ Idle"
fi

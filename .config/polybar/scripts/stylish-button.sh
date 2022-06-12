#!/bin/bash

QUERY=$(zenity --text="Enter a search query for a random wallpaper:" --entry)
styli.sh -p -w 1920 -h 1080 -s $QUERY

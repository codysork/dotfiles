#!/bin/sh

exec styli.sh
wal -i ~/.cache/styli.sh/wallpaper.jpg
xrdb -merge ~/.cache/wal/colors.Xresources

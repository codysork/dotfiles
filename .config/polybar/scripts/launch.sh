#!/bin/env sh

pkill polybar

sleep 1;

polybar --reload top -c ~/.config/polybar/config_top.ini &
polybar --reload bottom -c ~/.config/polybar/config_bottom.ini &

#!/bin/env sh

pkill polybar
pkill polybar

sleep 1;

#polybar --reload top -c ~/.config/polybar/config.ini &
polybar --reload bottom -c ~/.config/polybar/config.ini &

#!/bin/env sh

pkill polybar

sleep 1;

polybar --reload top -c ~/.config/polybar/config.ini &

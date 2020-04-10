#!/bin/env sh

pkill polybar

sleep 1;

polybar --reload time -c ~/.config/polybar/config &
polybar --reload controls -c ~/.config/polybar/config &

#!/bin/env sh

pkill polybar

sleep 1;

polybar --reload base -c ~/.config/polybar/config &

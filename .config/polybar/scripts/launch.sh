#!/bin/env sh

if [[ $(ps aux | pgrep polybar) ]]; then
  killall polybar && killall polybar && \
  polybar --reload bottom -c ~/.config/polybar/config.ini &
else
  polybar --reload bottom -c ~/.config/polybar/config.ini &
fi

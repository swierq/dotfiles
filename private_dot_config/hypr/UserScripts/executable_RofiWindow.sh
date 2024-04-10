#!/bin/bash

WINDOW=$(hyprctl clients | grep "class: " | awk '{gsub("class: ", "");print}' | rofi -normal-window -dmenu -config ~/.config/rofi/config-compact.rasi -i -p "")
if [ "$WINDOW" = "" ]; then
    exit
fi
hyprctl dispatch focuswindow $WINDOW

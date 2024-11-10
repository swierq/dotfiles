#!/bin/bash

MONCONF=${HOME}/.config/hypr/UserConfigs/Monitors.conf

cat $MONCONF

grep -c "monitor = eDP-1, disable" $MONCONF

if [ $? -eq 0 ]; then
  sed -i -e '/monitor = eDP-1, disable/d' $MONCONF
  notify-send "Laptop display enabled"
else
  echo "monitor = eDP-1, disable" >> $MONCONF
  notify-send "Laptop display disabled"
fi

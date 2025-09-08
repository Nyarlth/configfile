#! /bin/bash

if ps -a | grep -q 'rofi'; then
  hyprctl dispatch "exec [noanim] pkill rofi"
else
  hyprctl dispatch "exec [noanim] rofi -theme-str 'element-icon { size: 40px;}' -show combi"
fi

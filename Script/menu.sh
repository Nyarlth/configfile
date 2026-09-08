#! /bin/bash

if ps -a | grep -q 'rofi'; then
  exec pkill rofi
else
  exec rofi -theme-str 'element-icon { size: 40px;}' -show combi
fi

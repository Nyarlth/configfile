#! /bin/bash

if ps -a | grep -q 'rofi' ;
then 
	hyprctl dispatch "exec [noanim] pkill rofi" 
else
	hyprctl dispatch "exec [noanim] rofi -show combi"
fi


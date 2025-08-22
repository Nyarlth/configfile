#! /bin/bash

#MPN=ElectronNCM
MPN="$(playerctl -l | grep musicfox)"
#MPN="`playerctl -l | grep firefox`"
playerctl -l | grep $MPN >/dev/null
if [ $? -eq 0 ]; then
	Status="$(playerctl -p $MPN status)"
	#	Return=`playerctl -p $MPN metadata title`"--`playerctl -p $MPN metadata artist`"
	#        Return="`playerctl -p $MPN -a metadata --format '{\"text\": \"{{markup_escape(title)}} ~ {{artist}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}'`"

	if [ "$Status" == "Paused" ]; then
		#Return="󰝛 "$Return
		Return="$(playerctl -p $MPN -a metadata --format '{\"text\": \"󰝛 {{markup_escape(title)}} ~ {{artist}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}')"
	else
		#Return=" "$Return
		#Return="$(playerctl -p $MPN -a metadata --format '{\"text\": \" {{markup_escape(title)}} ~ {{artist}}\"}')"
		Return="$(playerctl -p $MPN -a metadata --format '{\"text\": \" {{markup_escape(title)}} ~ {{artist}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}')"
	fi
else
	Return=" "
	sleep 10
fi
echo $Return

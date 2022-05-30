#!/bin/bash

function send_notification() {
    volume=$(printf "%.0f\n" $(amixer get Master | awk '$0~/%/{print $4}' | tr -d '[]%'))
	dunstify -a "changevolume" -u low -r "9993" -h int:value:"$volume" -i "volume-$1" "Volume: ${volume}%" -t 2000
}

case $1 in
up)
    amixer -q -c 0 set Master 5%+ unmute
	send_notification $1
	;;
down)
    amixer -q -c 0 set Master 5%- unmute
	send_notification $1
	;;
mute)
    amixer -q -c 0 set Master toggle
    CURRENT_STATE=`amixer get Master | egrep 'Playback.*?\[o' | egrep -o '\[o.+\]'`
	if [[ $CURRENT_STATE == '[off]' ]]; then
		dunstify -a "changevolume" -u low -r "9993" -i volume-mute "Muted" -t 2000 
	else
		send_notification up
	fi
	;;
esac

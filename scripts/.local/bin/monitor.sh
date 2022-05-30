#! /bin/bash

if [[ $(xrandr -q | grep 'HDMI-1 connected') ]]; then
    xrandr --output HDMI-1 --primary --mode 3440x1440 --rotate normal --output eDP-1 --mode 1920x1080 --rotate normal --below HDMI-1
    polybar external &
fi

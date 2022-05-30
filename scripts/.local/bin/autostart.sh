#!/bin/sh

picom --experimental-backends --config $XDG_CONFIG_HOME/picom/picom.conf &
redshift -l -38.14711:144.36069 &
greenclip daemon &
dunst --config $XDG_CONFIG_HOME/dunst/dunstrc &


if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrdb -merge ~/.config/X11/.Xresources

# auto mount drives
udiskie &

# Status bar
slstatus &

# Compositor
picom --experimental-backends --config $XDG_CONFIG_HOME/picom/picom.conf -b

# Screen blue light
redshift -l -38.14711:144.36069 &

# Wallpaper
feh --bg-fill $HOME/Pictures/wallpapers/Spirit-Desktop.jpg &

# Notifications
dunst --config $XDG_CONFIG_HOME/dunst/dunstrc &

# remap caps lock
setxkbmap -option "caps:ctrl_modifier";xcape -e "Caps_Lock=Escape"&

# Hotkeys
sxhkd &

# load fonts
xset +fp ~/.local/share/fonts
xset +fp /home/mm/.local/share/fonts
xset fp rehash

exec dwm

#!/bin/bash

all_packages=( $(pacman -Qqe) )
base_devel_packages=( $(pacman -Sg base-devel | cut -f 2 -d " ") )

# Removes dupes from other array
for i in "${base_devel_packages[@]}"; do
	all_packages=(${all_packages[@]//*$i*})
done

printf "%s\n" "${all_packages[@]}" > $DOTFILES/packages/.pacman.list

cat $DOTFILES/packages/.pacman.list

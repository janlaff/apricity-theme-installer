#!/bin/bash

# This script installs the apricity os gnome tweaks on other linux distributions
# Run 'sudo ./install-files.sh' to update or install the modifications
# Use 'gnome-tweak-tool' to select the apricity theme and the icons

if [ $(id -u) != 0 ]
then
	echo "This program must be run as root!"
	exit
fi

if [ ! -d .apricity-theme ]
then
	mkdir .apricity-theme
fi

cd .apricity-theme

if [ ! -d apricity-icons ]
then
	git clone https://github.com/Apricity-OS/apricity-icons.git > /dev/zero
fi

cd apricity-icons
git pull > /dev/zero

echo "Copying Icons..."
cp -r "Apricity Icons"  /usr/share/icons > /dev/zero

if [ ! -d apricity-themes-gnome ]
then
	git clone https://github.com/Apricity-OS/apricity-themes-gnome.git > /dev/zero
fi

cd apricity-themes-gnome
git pull > /dev/zero

echo "Copying Shell theme..."
cp -r "Arctic Apricity" /usr/share/themes > /dev/zero
echo "Copying Extensions..."
cp -r extensions /usr/share/gnome-shell > /dev/zero

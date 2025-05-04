#!/bin/bash

#Variables
CONFIG_DIR=$XDG_CONFIG_HOME

#Update the make package configuration to allow up to 6 threads to be used to when building packages.
cat Configs/makepkg.conf >> /etc/makepkg.conf
mkdir $CONFIG_DIR/alacritty
touch $CONFIG_DIR/alacritty/alacritty.toml
cat Configs/alacritty.toml >> $CONFIG_DIR/alacritty/alacritty.toml

#install AUR package manager (paru)
pacman -S --noconfirm git base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ../
#Make sure we remove the package directory after we've finished building the package
rm -rf paru

#install
paru -S --noconfirm brave-bin alacritty vscodium-bin spotify discord, curl i3-wm
#!/bin/bash

#Update the make package configuration to allow up to 6 threads to be used to when building packages.
sudo cat Configs/makepkg.conf >> /etc/makepkg.conf

#install AUR package manager (paru)
sudo pacman -S git base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ../
rm -rf paru

#install
paru -S brave-bin alacritty vscodium-bin spotify discord, curl
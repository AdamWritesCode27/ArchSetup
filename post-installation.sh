#!/bin/bash

#Flags

#Variables
CONFIGS_SOURCE=Configs
WALLPAPERS=Wallpapers
CONFIG_DIR=$XDG_CONFIG_HOME
INSTALL_PACKAGES="paru -S --quiet --noconfirm"

#Functions
CopyFileToDirectory()
{
    echo "Copying" $1 "To the" $2 "directory"
    mkdir -p $2
    cp $1 $2
}

#Update the make package configuration to allow up to 6 threads to be used to when building packages.
CopyFileToDirectory $CONFIGS_SOURCE/makepkg.conf /etc/

pacman -S --quiet --noconfirm neofetch
neofetch

#install AUR package manager (paru)
pacman -S --quiet --noconfirm git base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ../
#Make sure we remove the package directory after we've finished building the package
rm -rf paru

#install packages
$INSTALL_PACKAGES brave-bin vscodium-bin spotify discord, pcloud-drive proton-mail

#Configure Installed Packages
CopyFileToDirectory $WALLPAPERS/Spiderman.jpg $HOME/Wallpapers
CopyFileToDirectory $CONFIGS_SOURCE/alacritty.toml $CONFIG_DIR/alacritty/
CopyFileToDirectory $CONFIGS_SOURCE/micro/settings.json $CONFIG_DIR/micro/
CopyFileToDirectory $CONFIGS_SOURCE/VSCodium/keybindings.json $CONFIG_DIR/VSCodium/User/

#Set the Wallpaper
mkdir $HOME/Wallpapers
CopyFileToDirectory $WALLPAPERS/Spiderman.jpg ~/Wallpapers/
xfconf-query -c xfce4-desktop -p $(xfconf-query -c xfce4-desktop -l | grep "workspace0/last-image") -s ~/Wallpaper/Spiderman.jpg

#Clean up the directory after running if the --cleanup flag is set to true
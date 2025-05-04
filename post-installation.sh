#!/bin/bash

#Variables
CONFIGS_SOURCE=Configs
CONFIG_DIR=$XDG_CONFIG_HOME
INSTALL_PACKAGES="paru -S --noconfirm"

#Functions
CopyFileToDirectory()
{
    echo "Copying" $1 "To the" $2 "directory"
    mkdir -p $2
    cp $1 $2
}

#Update the make package configuration to allow up to 6 threads to be used to when building packages.
CopyFileToDirectory $CONFIGS_SOURCE/makepkg.conf /etc/
CopyFileToDirectory $CONFIGS_SOURCE/alacritty.toml $CONFIG_DIR/alacritty/

#install AUR package manager (paru)
pacman -S --noconfirm git base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ../
#Make sure we remove the package directory after we've finished building the package
rm -rf paru

#install
$INSTALL_PACKAGES brave-bin alacritty vscodium-bin spotify discord, curl i3-wm
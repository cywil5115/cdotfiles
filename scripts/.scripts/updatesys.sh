#!/bin/bash

#read -p "Kontynuować ? " -n 1 -r
#echo    # (optional) move to a new line

#if [[ $REPLY =~ ^[Yy]$ ]]
#then
kitty --hold bash -c "distrobox upgrade -a && sudo pacman -Syu --noconfirm && flatpak update && flatpak upgrade -y && echo Done"
#fi


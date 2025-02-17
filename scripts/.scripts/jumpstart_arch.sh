#!/bin/sh

#######################
# Instalation
#######################

sudo pacman -S yazi eza zoxide fzf fd helix neovim \
starship zellij btop fastfetch bat stow lazygit lolcat \
ffmpeg repgrep 

if command -v paru >/dev/null; then
  echo "Paru is installed"
  sleep 1
else
  cd
  sudo pacman -S --needed base-devel
  mkdir $HOME/.paru
  git clone https://aur.archlinux.org/paru.git $HOME/.paru
  cd .paru
  makepkg -si
fi

paru -S timer-bin

# For Yazi
echo "For Yazi plugin"
sudo pacman -S mediainfo

# Spotify in terminal
paru -S spotify-player-full

#######################
# Dotfiles
#######################




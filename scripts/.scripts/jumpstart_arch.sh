#!/usr/bin/env bash

#######################
# Instalation
#######################

sudo pacman -S yazi eza zoxide fzf fd helix neovim \
starship zellij btop fastfetch bat stow lazygit lolcat \
ffmpeg toilet age uv tldr

if command -v paru >/dev/null; then
  echo "Paru is already installed"
  sleep 1
else
  cd
  sudo pacman -S --needed base-devel
  mkdir $HOME/.paru
  git clone https://aur.archlinux.org/paru.git $HOME/.paru
  cd .paru
  makepkg -si
  toilet Paru installed | lolcat
fi

paru -S timer-bin
toilet Done | lolcat

# For Yazi
echo "For Yazi plugin" | lolcat
sleep 1
sudo pacman -S mediainfo
toilet Done | lolcat

# Extra cool tools
echo "Extra cool tools" | lolcat
sleep 1
sudo pacman -S tui-journal repgrep television serie binsider heh grex hexyl tukai mdcat impala bluetui

# Making music
# paru -S tek
toilet Done | lolcat

# Spotify in terminal
paru -S spotify-player-full
toilet Finished | lolcat

# Money, Money
# uv tool install --python 3.13 bagels

#######################
# Dotfiles
#######################




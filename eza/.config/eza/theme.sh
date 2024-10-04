#!/usr/bin/env bash

eza-choose-theme () {
  chosen_theme=$(ls ~/.config/eza/list | fzf --height=~15% --border=double)
  'cat' ~/.config/eza/list/$chosen_theme > ~/.config/eza/theme.yml 
}

skipline () {
	echo " "
}

eza-choose-theme
skipline

echo -e "  \033[1;30m[\033[1;32mi\033[1;30m]\033[0m Done."
# echo "[i] Done."

skipline

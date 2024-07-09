#!/usr/bin/env bash

# alias hx-up='~/.config/helix/update.sh'

hx-choose-theme () {
  chosen_theme=$(ls ~/.config/helix/themes | grep -v "chosen_theme.toml" | fzf --height=~15% --border=double)
  'cat' ~/.config/helix/themes/$chosen_theme > ~/.config/helix/themes/chosen_theme.toml 
}
hx-choose-theme

skipline () {
	echo " "
}

skipline

echo -e "  \033[1;30m[\033[1;32mi\033[1;30m]\033[0m Done."
# echo "[i] Done."

skipline

#!/usr/bin/env bash

yazi-choose-theme () {
  chosen_theme=$('ls' ~/.config/yazi/flavors | sed -n 's/\.yazi$//p'| fzf --height=~15% --border=double)
  
  yazi_theme_file="$HOME/.config/yazi/theme.toml"

  cat >"$yazi_theme_file" <<EOF

# A TOML linter such as https://taplo.tamasfe.dev/ can use this schema to validate your config.
# If you encounter any issues, please make an issue at https://github.com/yazi-rs/schemas.
"$schema" = "https://yazi-rs.github.io/schemas/theme.json"

# flavor taken from: https://github.com/dangooddd/kanagawa.yazi
# : Flavor {{{

[flavor]
use = "$chosen_theme"

EOF
}

skipline () {
	echo " "
}

yazi-choose-theme
skipline

echo -e "  \033[1;30m[\033[1;32mi\033[1;30m]\033[0m Done."
# echo "[i] Done."

skipline

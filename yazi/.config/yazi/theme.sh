#!/usr/bin/env bash

yazi-choose-theme () {
  yazi_theme_file="$HOME/.config/yazi/theme.toml"

  if [[ "$1" == "default" ]]; then
    {
      echo ''
      echo '# A TOML linter such as https://taplo.tamasfe.dev/ can use this schema to validate your config.'
      echo '# If you encounter any issues, please make an issue at https://github.com/yazi-rs/schemas.'
      echo '"$schema" = "https://yazi-rs.github.io/schemas/theme.json"'
      echo ''
      echo '# flavor taken from: https://github.com/dangooddd/kanagawa.yazi'
      echo '# : Flavor {{{'
      echo '# [flavor]'
      echo '# dark= ""'
      echo '# light= ""'
    } > "$yazi_theme_file"
  else
    chosen_theme=$(ls ~/.config/yazi/flavors | sed -n 's/\.yazi$//p' | fzf --height=~15% --border=double)

    {
      echo ''
      echo '# A TOML linter such as https://taplo.tamasfe.dev/ can use this schema to validate your config.'
      echo '# If you encounter any issues, please make an issue at https://github.com/yazi-rs/schemas.'
      echo '"$schema" = "https://yazi-rs.github.io/schemas/theme.json"'
      echo ''
      echo '# flavor taken from: https://github.com/dangooddd/kanagawa.yazi'
      echo '# : Flavor {{{'
      echo '[flavor]'
      echo "dark= \"$chosen_theme\""
      echo "light= \"$chosen_theme\""
    } > "$yazi_theme_file"
  fi
}

skipline () {
  echo " "
}

yazi-choose-theme "$1"
skipline

echo -e "  \033[1;30m[\033[1;32mi\033[1;30m]\033[0m Done."
skipline

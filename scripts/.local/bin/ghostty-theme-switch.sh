#!/usr/bin/env bash

CONFIG="$HOME/.config/ghostty/config"
THEMES_DIR="$HOME/.config/ghostty/themes"

command -v fzf >/dev/null 2>&1 || { echo "fzf is not installed."; exit 1; }
[ -d "$THEMES_DIR" ] || { echo "Themes directory not found."; exit 1; }

NEW_THEME=$(ls "$THEMES_DIR" | fzf --prompt="Select Ghostty theme: ")
[ -z "$NEW_THEME" ] && exit 0
[ -f "$THEMES_DIR/$NEW_THEME" ] || { echo "Selected theme does not exist."; exit 1; }

sed -i.bak 's/^theme = ".*"/theme = "'"$NEW_THEME"'"/' "$CONFIG" && rm -f "$CONFIG.bak"

pkill -USR1 ghostty 2>/dev/null

echo "Theme set to: $NEW_THEME"

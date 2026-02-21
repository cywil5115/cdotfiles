#!/usr/bin/env bash

GHOSTTY_CONFIG="$HOME/.config/ghostty/config"
GHOSTTY_THEMES="$HOME/.config/ghostty/themes"

HELIX_CONFIG="$HOME/.config/helix/config.toml"
HELIX_THEMES="$HOME/.config/helix/themes"

# Check fzf
command -v fzf >/dev/null 2>&1 || { echo "fzf is not installed."; exit 1; }

# List available Ghostty themes
AVAILABLE_THEMES=()
for t in "$GHOSTTY_THEMES"/*; do
    [ -f "$t" ] && AVAILABLE_THEMES+=("$(basename "$t")")
done
[ ${#AVAILABLE_THEMES[@]} -eq 0 ] && { echo "No Ghostty themes found."; exit 1; }

# User selects a theme
CHOICE=$(printf "%s\n" "${AVAILABLE_THEMES[@]}" | fzf --prompt="Select theme: ")
[ -z "$CHOICE" ] && exit 0

# Theme name without extension
THEME_NAME=$(basename "$CHOICE" .toml)

# --- Function to safely update config using tmp + cat ---
safe_update() {
    local config_file="$1"
    local theme="$2"

    [ ! -f "$config_file" ] && return 1

    local tmp_file
    tmp_file=$(mktemp)
    sed 's/^theme = ".*"/theme = "'"$theme"'"/' "$config_file" > "$tmp_file"
    cat "$tmp_file" > "$config_file"
    rm "$tmp_file"
}

# --- Update Ghostty ---
GHOSTTY_FILE="$GHOSTTY_THEMES/$CHOICE"
if [ -f "$GHOSTTY_FILE" ] && [ -f "$GHOSTTY_CONFIG" ]; then
    safe_update "$GHOSTTY_CONFIG" "$THEME_NAME"
    pkill -USR1 ghostty 2>/dev/null
    echo "Ghostty theme set to: $THEME_NAME"
else
    echo "Skipping Ghostty: theme or config not found."
fi

# --- Update Helix ---
if [ -f "$HELIX_CONFIG" ]; then
    safe_update "$HELIX_CONFIG" "$THEME_NAME"
    echo "Helix theme set to: $THEME_NAME"
else
    echo "Skipping Helix: config not found."
fi

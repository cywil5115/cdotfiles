######################
# Init for apps
######################

# fzf
source <(fzf --zsh)

# Zoxide
eval "$(zoxide init zsh)"

# StarShip
if command -v starship 2>&1 > /dev/null
then
  export STARSHIP_CONFIG=$HOME/.config/starship/active-config.toml
  eval "$(starship init zsh)"
fi

# Direnv
if command -v direnv 2>&1 > /dev/null
then
  eval "$(direnv hook zsh)"
fi

# lazygit
lg() {
    local tmpfile
    tmpfile="$(mktemp)"
    LAZYGIT_NEW_DIR_FILE="$tmpfile" lazygit "$@"

    if [[ -f "$tmpfile" ]]; then
        cd -- "$(cat "$tmpfile")"
        rm -f -- "$tmpfile"
    fi
}

# yazi
function r() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

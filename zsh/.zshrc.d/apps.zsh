######################
# Init for apps
######################

# mise
if command -v mise 2>&1 > /dev/null
then
  eval "$(mise activate zsh)"
fi

# fzf
if command -v fzf 2>&1 > /dev/null
then
source <(fzf --zsh)
fi

# Zoxide
if command -v zoxide 2>&1 > /dev/null
then
eval "$(zoxide init zsh)"
fi

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
		if command -v lazygit 2>&1 > /dev/null
		then
	    local tmpfile
	    tmpfile="$(mktemp)"
	    LAZYGIT_NEW_DIR_FILE="$tmpfile" lazygit "$@"

	    if [[ -f "$tmpfile" ]]; then
	        cd -- "$(cat "$tmpfile")"
	        rm -f -- "$tmpfile"
	    fi
	  else
			echo "Lazygit is not installed"
	  fi
}

# yazi
function r() {
	
	if command -v yazi 2>&1 > /dev/null
	then
		local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
		yazi "$@" --cwd-file="$tmp"
		if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
			cd -- "$cwd"
		fi
		rm -f -- "$tmp"
	else
		echo "Yazi is not installed"
	fi
}

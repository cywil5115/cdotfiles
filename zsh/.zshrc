if [ -d "$HOME/.zshrc.d" ]; then
    for config in "$HOME/.zshrc.d"/*.zsh(-N); do
        source "$config"
    done
    unset config
fi

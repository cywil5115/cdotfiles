if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Prompt
set -gx PATH $HOME/.local/bin $PATH
########################################
# Skróty klawiaturowe (Keybindings)
########################################
# TAB:            kompletowanie (complete)
# Ctrl+H:         cofnij jedno słowo (backward-word)
# Ctrl+L:         przejdź do przodu o jedno słowo (forward-word)
# Ctrl+D:         usuń linię od kursora (kill-line)
# Ctrl+X E:       edytuj bieżące polecenie w edytorze
# Ctrl+X Ctrl+E:  to samo co powyżej (edit_command_buffer)
########################################

# Key bindings
bind \t complete
bind \cl forward-word
bind \cd kill-line
bind \ch backward-word
# Open current command in editor (Fish does this with `edit_command_buffer`)
bind \cx\ce edit_command_buffer

#########################
# Editor config
#########################
if not type -q hx
    if type -q helix
        abbr -a hx helix
    end
end

# Ustaw preferowany edytor zależnie od dostępności
if type -q helix
    set -gx EDITOR helix
else if type -q hx
    set -gx EDITOR hx
else if type -q nvim
    set -gx EDITOR nvim
else if type -q micro
    set -gx EDITOR micro
else if type -q vim
    set -gx EDITOR vim
else
    set -gx EDITOR nano
end

# VISUAL i SUDO_EDITOR ustaw tak samo
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITORset -gx VISUAL hx
set -gx EDITOR hx
set -gx SUDO_EDITOR hx

#########################
# FZF
#########################
if type -q fzf
    set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS \
        --info=inline-right \
        --ansi \
        --layout=reverse \
        --border=rounded \
        --color=border:#27a1b9 \
        --color=fg:#c0caf5 \
        --color=gutter:#16161e \
        --color=header:#ff9e64 \
        --color=hl+:#2ac3de \
        --color=hl:#2ac3de \
        --color=info:#545c7e \
        --color=marker:#ff007c \
        --color=pointer:#ff007c \
        --color=prompt:#2ac3de \
        --color=query:#c0caf5:regular \
        --color=scrollbar:#27a1b9 \
        --color=separator:#ff9e64 \
        --color=spinner:#ff007c"

    alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

    if type -q xdg-open
        alias preview='xdg-open (fzf --info=inline --query="$argv")'
    else
        alias preview='edit (fzf --info=inline --query="$argv")'
    end
end

#########################
# Zoxide
#########################
if type -q zoxide
    zoxide init fish | source
end

#########################
# Starship
#########################
if type -q starship
    starship init fish | source
end

cd ~
# clear screen at startup (optional)
# clear

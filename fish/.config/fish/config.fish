set -U fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
end

#########################
# XDG
#########################
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

#########################
# Paths
#########################
fish_add_path $HOME/.local/bin

# Brew
if test -d /opt/homebrew/bin
    fish_add_path /opt/homebrew/bin
end

# Odin
if test -d $HOME/.toolchains/odin
    fish_add_path $HOME/.toolchains/odin
end

# Go
set -gx GOPATH $XDG_DATA_HOME/go
fish_add_path $GOPATH/bin

# Swift
set -gx SWIFT_PM_CONFIG $XDG_CONFIG_HOME/swiftpm
set -gx SWIFT_PM_CACHE $XDG_CACHE_HOME/swiftpm

#########################
# Key bindings
#########################
bind \t accept-autosuggestion
bind \cl forward-word
bind \cd kill-line
bind \ch backward-word
bind \cx\ce edit_command_buffer # Open current command in editor (Fish does this with `edit_command_buffer`)

#########################
# Editor config
#########################
if not type -q hx
    if type -q helix
        abbr -a hx helix
    end
end

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

set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITORset -gx VISUAL hx
set -gx EDITOR hx
set -gx SUDO_EDITOR hx

#########################
# FZF
#########################
if type -q fzf

    set -gx FZF_DEFAULT_OPTS "
    --info=inline-right
    --ansi
    --layout=reverse
    --border=rounded
    "

    if type -q bat
        set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS --preview 'bat --style=numbers --color=always --line-range :500 {}'"
    end

    if type -q xdg-open
        function preview
            xdg-open (fzf --info=inline --query="$argv")
        end
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

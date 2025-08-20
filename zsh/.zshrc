export PATH=$HOME/.local/bin:$PATH

######################
# Autocompletion settings
######################
if [ -f "$HOME/.scripts/zsh/zsh-completions/settings.zsh" ]; then
source $HOME/.scripts/zsh/zsh-completions/settings.zsh
fi

#######################################################
# ZSH Basic Options
#######################################################
bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest
bindkey '^k' history-search-backward
bindkey '^j' history-search-forward
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey '^H' backward-word
bindkey '^D' kill-line
bindkey '^L' forward-word

# Edit cmd in editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

setopt autocd              # change directory just by typing its name
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

######################
# MacOS
######################

case "$(uname -sr)" in
   Darwin*)

    if [ ! -f $HOME/.zprofile ]; then
      touch $HOME/.zprofile
    fi
    source $HOME/.zprofile
    ;;

esac

######################
# Editor
######################

# helix
if ! command -v hx &>/dev/null; then
  alias hx="helix"
  export VISUAL=helix
  export EDITOR=helix
  export SUDO_EDITOR=helix
fi

if ! command -v helix &>/dev/null; then
  export VISUAL=hx
  export EDITOR=hx
  export SUDO_EDITOR=hx
fi

######################
# Functions 
######################
if [ -f "$HOME/.functions" ]; then
source $HOME/.functions
fi
######################
# Aliases 
######################
if [ -f "$HOME/.aliases" ]; then
source $HOME/.aliases
fi

######################
# Autosuggestions
######################
if [ -f "$HOME/.scripts/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source $HOME/.scripts/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

######################
# History
######################
# Current number of entries Zsh is configured to store in memory (HISTSIZE)
# How many commands Zsh is configured to save to the history file (SAVEHIST)
# echo "HISTSIZE: $HISTSIZE"
# echo "SAVEHIST: $SAVEHIST"
# Store 10,000 entries in the command history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# Check if the history file exists, if not, create it
if [[ ! -f $HISTFILE ]]; then
  touch $HISTFILE
  chmod 600 $HISTFILE
fi
# Append commands to the history file as they are entered
setopt appendhistory
# Record timestamp of each command (helpful for auditing)
setopt extendedhistory
# Share command history data between all sessions
setopt sharehistory
# Incrementally append to the history file, rather than waiting until the shell exits
setopt incappendhistory
# Ignore duplicate commands in a row
setopt histignoredups
# Exclude commands that start with a space
setopt histignorespace
# Custom list of commands to ignore (adjust as needed)
# HISTIGNORE='ls*:bg*:fg*:exit*:ll*'
# Shows the last 30 entries, default is 15
alias history='history -30'

function clearhis () {
    if [ -f "$HISTFILE" ]; then
        rm "$HISTFILE"
    else
        echo "No history file found."
    fi
}

######################
# FZF
######################
source <(fzf --zsh)

######################
# Zoxide
######################
eval "$(zoxide init zsh)"

######################
# VI Mode
######################
#bindkey jj vi-cmd-mode

######################
# StarShip
######################
if command -v starship 2>&1 > /dev/null
then
  export STARSHIP_CONFIG=$HOME/.config/starship/active-config.toml
  eval "$(starship init zsh)"
fi

######################
# Syntax-highlighting
######################

if [ -f "$HOME/.scripts/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source $HOME/.scripts/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

######################
# Optional
######################

if [ -f "$HOME/.aminka_mode" ]; then
  source $HOME/.aminka_mode
fi

######################
# End
######################

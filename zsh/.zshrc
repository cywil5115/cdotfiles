######################
# Programming Paths
######################
export PATH=$HOME/.local/bin:$PATH
[ -d $HOME/Projects/code/odin/Odin ] && export PATH=$HOME/Projects/code/odin/Odin:$PATH

######################
# Autocompletion settings
######################
if [ -f "$HOME/.scripts/zsh/zsh-completions/zsh-completions.plugin.zsh" ]; then
  source $HOME/.scripts/zsh/zsh-completions/zsh-completions.plugin.zsh
fi

autoload -U compinit && compinit
zmodload zsh/complist
#######################################################
# zsh
#######################################################
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z A-Z}={A-Z a-z}'
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest
bindkey '^k' history-search-backward
bindkey '^j' history-search-forward
bindkey -M menuselect '^b' reverse-menu-complete
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
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles (example: .file)
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell

######################
# MacOS
######################

case "$(uname -sr)" in
   Darwin*)

    touch ~/.hushlogin # because I don't want to see last login when shell starts

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
if [ -f "$HOME/.functions.zsh" ]; then
source $HOME/.functions.zsh

fi
######################
# Aliases 
######################
if [ -f "$HOME/.aliases.zsh" ]; then
source $HOME/.aliases.zsh
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
# fzf
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
# Direnv
######################
if command -v direnv 2>&1 > /dev/null
then
  eval "$(direnv hook zsh)"
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

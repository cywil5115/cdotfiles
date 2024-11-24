# Prompt
# export PATH="$HOME/.ohmyposh:$PATH"
# eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
export PATH=$HOME/.local/bin:$PATH
#export PATH=$HOME/.config/emacs/bin:$PATH # I want to try it! That's all okey?!

######################
# Autocompletion settings
######################
if [ -f "$HOME/.scripts/zsh/zsh-completions/settings.zsh" ]; then
source $HOME/.scripts/zsh/zsh-completions/settings.zsh
fi

######################
# Aliases for OS
######################

  # Aliases are in $HOME/.aliases
if [ -f "$HOME/.scripts/zsh/autocomplete-aliases.zsh" ]; then
source $HOME/.scripts/zsh/autocomplete-aliases.zsh
fi

######################
# Editor
######################

  # helix
export VISUAL=helix
export EDITOR=helix

######################
# Functions 
######################
if [ -f "$HOME/.functions" ]; then
source $HOME/.functions
fi
######################
# Autosuggestions
######################

  # Source zsh-autosuggestions if file exists
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

export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
--color=selected-bg:#494d64 \
--multi"
#fd instead of fzf
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}
# to try out
#source ~/<DIRECTORY>/fzf-git.sh/fzf-git.sh
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

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
  export STARSHIP_CONFIG=$HOME/.config/active-config.toml
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
# Finishing
######################
# clear

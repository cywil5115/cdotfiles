# Prompt
# export PATH="$HOME/.ohmyposh:$PATH"
# eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
export PATH=$HOME/.local/bin:$PATH

######################
# Autocompletion settings
######################
fpath=(~/.scripts/zsh/zsh-completions/src $fpath)
# https://github.com/Phantas0s/.dotfiles/blob/master/zsh/completion.zsh
# These have to be on the top, I remember I had issues with some autocompletions if not
zmodload zsh/complist
autoload -U compinit
compinit
_comp_options+=(globdots) # With hidden files
# setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST        # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD # Complete from both ends of a word.
# Define completers
zstyle ':completion:*' completer _extensions _complete _approximate
# Use cache for commands using cache
zstyle ':completion:*' use-cache on
# You have to use $HOME, because since in "" it will be treated as a literal string
zstyle ':completion:*' cache-path "$HOME/.zcompcache"
# Complete the alias when _expand_alias is used as a function
zstyle ':completion:*' complete true
# Allow you to select in a menu
zstyle ':completion:*' menu select
# Autocomplete options for cd instead of directory stack
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
# zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# Colors for files and directory
# zstyle ':completion:*:*:*:*:default' list-colors '${(s.:.)LS_COLORS}'

######################
# Aliases for OS
######################

case "$(uname -sr)" in

   Darwin*)
     
     alias zzz='sudo shutdown -h' 
     alias nozzz='sudo killall shutdown'
     alias noshutdown='sudo killall shutdown'
     alias e='open ./' #MACOS
     # alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
     ;;

   Linux*Microsoft*)
     echo 'WSL'  # Windows Subsystem for Linux
     # alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
     ;;

   Linux*)

     alias zzz='sudo shutdown -h' 
     alias zzzz='shutdown -c'
     alias noshutdown='shutdown -c'
     alias debian='distrobox-enter debian12-distrobox'
     alias flatpak-up='flatpak update -y && flatpak upgrade -y'
     alias updateall='sudo echo "Aktualizacja!" && flatpak update -y && flatpak upgrade -y && distrobox-upgrade -a && sudo pacman -Syu --noconfirm'
     # alias e='nautilus ./' #GNOME
     # alias e='nemo ./' #MINT
     # alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

     # # Homebrew
     # eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
     ;;

   CYGWIN*|MINGW*|MINGW32*|MSYS*)
     echo 'MS Windows'
     ;;

   # Add here more strings to compare
   # See correspondence table at the bottom of this answer

   *)
     echo 'Other OS' 
     ;;
esac

######################
# Global Aliases
######################
alias cl='clear'

#bat for other
if command -v bat &>/dev/null; then
  # --style=plain - removes line numbers and git modifications
  # --paging=never - doesnt pipe it through less
  alias catt='bat --paging=never --style=plain'
  alias cat='bat'
  alias cata='bat --show-all --paging=never'
fi

#bat for ubuntu
if command -v batcat &>/dev/null; then
  # --style=plain - removes line numbers and git modifications
  # --paging=never - doesnt pipe it through less
  alias catt='batcat --paging=never --style=plain'
  alias cat='batcat'
  alias cata='batcat --show-all --paging=never'
fi

if command -v eza &>/dev/null
then
  EZA_CONFIG_DIR='~/.config/eza/'
  alias ls="eza --color=always --git -1 --no-filesize --icons=always --no-time --no-user --no-permissions"
  alias ll='eza --long --all --bytes --git --git-repos --icons=auto'
  alias lld='eza --long -D -H --all --bytes --octal-permissions --total-size --git --git-repos --icons=auto --no-permissions'
  alias llf='eza --long -f -H --all --bytes --octal-permissions --smart-group --git --icons=auto --no-permissions'
  alias tree='eza --tree --level=5 --icons=auto --git'
fi

#Git
alias fsb='~/.scripts/fsb.sh'
alias fshow='~/.scripts/fshow.sh'
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"

#Docker
# alias dco="docker compose"
# alias dps="docker ps"
# alias dpa="docker ps -a"
# alias dl="docker ps -l -q"
# alias dx="docker exec -it"

######################
# Editor
######################

# helix
export VISUAL=helix
export EDITOR=helix
# neovim
alias v='nvim'
alias kvim='NVIM_APPNAME="kickstart-nvim" nvim'
alias tvim='NVIM_APPNAME="test-nvim" nvim'

######################
# Functions 
######################
function lg()  {
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}

function r() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function day {
    date +"%a %b %d %Y"
}
alias dzien='day'
  
function bytesConvert {
  if [[ $# -eq 0 ]]
  then
      read -p "Size in bytes: " bytesVal
  else
      bytesVal=$1
  fi
  echo $bytesVal | awk '{ split( "B KB MB GB TB PB EB ZB YB" , v ); s=1; while( $1>1024 && s<9 ){ $1/=1024; s++ } printf "%.2f %s", $1, v[s] }'
}

function fsize() {
  filename=$1
  size="$(wc --bytes $filename)"
  bytesConvert $size
}

######################
# Themes
######################

function set-yazi-theme {
  $HOME/.cdotfiles/yazi/.config/yazi/theme.sh
}

function set-eza-theme {
  $HOME/.config/eza/theme.sh
}

function set-kitty-theme {
  $HOME/.config/kitty/lib/theme.sh
}

bat cache --build > /dev/null 2>&1 # it's outside to update cache with downloaded custom themes

function set-bat-theme {
    bat cache --build
    sleep 1 && clear
    selTheme=$(bat --list-themes | fzf --preview="bat --theme={} --color=always ~/.zshrc")
    echo $selTheme > $(bat --config-dir)/themes/current_theme
    bat cache --build
    source ~/.zshrc
}

export BAT_THEME=$(< $(bat --config-dir)/themes/current_theme)

#bat
# export BAT_THEME=gruvbox-dark

#helix - dynamic theme
alias hx-up='~/.config/helix/lib/bash.sh'
alias set-helix-theme='~/.config/helix/lib/bash.sh' # for consistency


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
alias cd='z'
alias cdi'zi'
alias cdd='cd -'

######################
# Directories
######################
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

######################
# VI Mode
######################
bindkey jj vi-cmd-mode

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

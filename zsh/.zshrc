# Prompt
export PATH="$HOME/.ohmyposh:$PATH"
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# Aliases
# alias e='nautilus ./' #GNOME
# alias e='nemo ./' #MINT
alias e='open ./' #MACOS
# alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias zzz='sudo shutdown -h' 
alias zzzz='shutdown -c' #LINUX
alias noshutdown='shutdown -c' #LINUX
alias cat='bat'
alias cl='clear'
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias ll='eza --long --all --git --icons=always'
alias cpv='rsync -ah --info=progress2'
alias debian='distrobox-enter debian12-distrobox'

# Themes
#bat
export BAT_THEME=gruvbox-dark
#export BAT_THEME=tokyonight-night
#fzf
fg="#c4821f"
bg="#242424"
bg_highlight="#772c00"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"
#helix - dynamic theme
alias hx-up='~/.config/helix/lib/bash.sh'

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gs="git show"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'
alias fsb='~/.scripts/fsb.sh'
alias fshow='~/.scripts/fshow.sh'

# Docker
# alias dco="docker compose"
# alias dps="docker ps"
# alias dpa="docker ps -a"
# alias dl="docker ps -l -q"
# alias dx="docker exec -it"

# Neovim
# alias kvim='NVIM_APPNAME="kickstart_nvim" nvim'

export VISUAL=nvim
export EDITOR=nvim

# Functions 
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

# fzf
source <(fzf --zsh)
#themes
export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"
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

# Zoxide
eval "$(zoxide init zsh)"
alias cd='z'
alias cdi='zi'

# Directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# VI Mode
bindkey jj vi-cmd-mode

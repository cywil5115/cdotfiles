# Prompt
export PATH="$HOME/.ohmyposh:$PATH"
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
export PATH=$HOME/.local/bin:$PATH


# Aliases for OS
case "$(uname -sr)" in

   Darwin*)
     
     alias zzz='sudo shutdown -h' 
     alias nozzz='sudo killall shutdown'
     alias noshutdown='sudo killall shutdown'
     alias e='open ./' #MACOS
     alias cat='bat'
     alias cl='clear'
     alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
     alias ll='eza --long --all --git --icons=always'
     alias cpv='rsync -ah --info=progress2'
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
     alias cat='bat'
     alias cl='clear'
     alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
     alias ll='eza --long --all --git --icons=always'
     alias cpv='rsync -ah --info=progress2'
     alias debian='distrobox-enter debian12-distrobox'
     alias flatpak-up='flatpak update -y && flatpak upgrade -y'
     alias updateall='sudo echo "Aktualizacja!" && flatpak update -y && flatpak upgrade -y && distrobox-upgrade -a && sudo pacman -Syu --noconfirm'
     # alias e='nautilus ./' #GNOME
     # alias e='nemo ./' #MINT
     # alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
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

# Global Aliases

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

# Editor
export VISUAL=helix
export EDITOR=helix
alias hx='helix'
# Neovim
# alias kvim='NVIM_APPNAME="kickstart_nvim" nvim'

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

function set-bat-theme {
    bat cache --build
    sleep 1 && clear
    selTheme=$(bat --list-themes | fzf --preview="bat --theme={} --color=always ~/.zshrc")
    echo $selTheme > $(bat --config-dir)/themes/current_theme
    bat cache --build
    source ~/.zshrc
}
# Themes

export BAT_THEME=$(< $(bat --config-dir)/themes/current_theme)

#bat
# export BAT_THEME=gruvbox-dark

#helix - dynamic theme
alias hx-up='~/.config/helix/lib/bash.sh'

# FZF
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

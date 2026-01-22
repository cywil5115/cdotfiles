######################
# OS Aliases
######################
case "$(uname -sr)" in

   Darwin*)
     
     alias zzz='sudo shutdown -h' 
     alias zzzz='sudo killall shutdown'
     alias noshutdown='sudo killall shutdown'
     alias e='open ./' #MACOS
     ;;

   Linux*)

     alias zzz='sudo shutdown -h' 
     alias zzzz='shutdown -c'
     alias noshutdown='shutdown -c'
     alias debian='distrobox-enter debian12-distrobox'
     alias flatpak-up='flatpak update -y && flatpak upgrade -y'
     alias updateall='if command -v lolcat &>/dev/null; then sudo echo Update! | lolcat; else sudo echo Update!; fi && flatpak update -y && flatpak upgrade -y && distrobox-upgrade -a && sudo pacman -Syu --noconfirm && cd && sudo ./.scripts/grubfix-arch-efi.sh /boot/efi'
     ;;

   *)
     echo 'Other OS' 
     ;;
esac

######################
# Global Aliases
######################
alias cl='clear'

######################
# bat
######################
if command -v batcat &>/dev/null; then
# Ubuntu case
  alias bat='batcat'
fi
if command -v bat &>/dev/null; then
  # --style=plain - removes line numbers and git modifications
  # --paging=never - doesnt pipe it through less
  alias catt='bat --paging=never --style=plain'
  alias cat='bat'
  alias cata='bat --show-all --paging=never'
fi

######################
# eza
######################
if command -v eza &>/dev/null
then
  EZA_CONFIG_DIR='~/.config/eza/'
  alias ls="eza --color=always --git --no-filesize --icons=always --no-time --no-user --no-permissions"
  alias ll='eza --long --all --bytes --git --git-repos --icons=auto --no-time'
  alias lld='eza --long -D --all --show-symlinks  --time-style long-iso --bytes --octal-permissions --total-size --git --git-repos-no-status --icons=auto --no-permissions'
  alias llf='eza --long -f --all --show-symlinks  --time-style long-iso --bytes --octal-permissions --smart-group --git --icons=auto --no-permissions'
  alias tree='eza --tree --level=5 --icons=auto --git'
fi

######################
# Git
######################
alias fsb='~/.scripts/fsb.sh'
alias fshow='~/.scripts/fshow.sh'
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"

######################
# Zoxide
######################
if command -v zoxide &>/dev/null; then
  alias cd='z'
  alias cdi='zi'
fi

######################
# Directories
######################
alias cdd='cd -'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

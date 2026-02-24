switch (uname -sr)
    case "Darwin*"
        abbr zzz "sudo shutdown -h"
        alias nozzz="sudo killall shutdown"
        alias noshutdown="sudo killall shutdown"
        abbr e "open ./"

    case "Linux*Microsoft*"
        echo WSL
        # brak aliasów do ustawienia

    case "Linux*"
        abbr zzz "sudo shutdown -h"
        alias zzzz="shutdown -c"
        alias noshutdown="shutdown -c"
        alias debian="distrobox-enter debian12-distrobox"
        alias flatpak-up="flatpak update -y && flatpak upgrade -y"
        # abbr e "nautilus ./"
        # abbr e "nemo ./"

    case "CYGWIN*" "MINGW*" "MINGW32*" "MSYS*"
        echo 'MS Windows'

    case '*'
        echo 'Other OS'
end

abbr cl clear

########################################
# 📦 bat / batcat
########################################
if type -q bat
    alias batt="bat --paging=never --style=plain"
    abbr cat bat
    alias bata="bat --show-all --paging=never"
end

if type -q batcat
    alias batt="batcat --paging=never --style=plain"
    abbr cat batcat
    alias bata="batcat --show-all --paging=never"
end

########################################
# 📂 Eza
########################################
if type -q eza
    alias ls="eza --color=always --git --no-filesize --icons=always --no-time --no-user --no-permissions"
    alias ll='eza --long --all --bytes --git --git-repos --icons=auto --no-time'
    alias lld='eza --long -D --all --show-symlinks  --time-style long-iso --bytes --octal-permissions --total-size --git --git-repos-no-status --icons=auto --no-permissions'
    alias llf='eza --long -f --all --show-symlinks  --time-style long-iso --bytes --octal-permissions --smart-group --git --icons=auto --no-permissions'
    alias tree='eza --tree --level=5 --icons=auto --git'
end

########################################
# 🔧 Git
########################################
alias fsb="~/.local/bin/fsb.sh"
alias fshow="~/.local/bin/fshow.sh"
alias glog='git log --oneline --topo-order --decorate --graph --parents --abbrev-commit'

########################################
# 📁 Zoxide
########################################
abbr cdd 'cd -'

########################################
# 📁 Directory jumps
########################################
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .... 'cd ../../..'
abbr ..... 'cd ../../../..'
abbr ...... 'cd ../../../../..'

########################################
# 🧠 Rozpoznawanie systemu
########################################
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
        # Możesz odkomentować odpowiedni alias w zależności od środowiska graficznego
        # abbr e "nautilus ./"
        # abbr e "nemo ./"

    case "CYGWIN*" "MINGW*" "MINGW32*" "MSYS*"
        echo 'MS Windows'

    case '*'
        echo 'Other OS'
end

########################################
# 🧼 Globalne abbr
########################################
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
    alias ls="eza --color=always --git -1 --no-filesize --icons=always --no-time --no-user --no-permissions"
    alias ll="eza --long --all --bytes --git --git-repos --icons=auto"
    alias lld="eza --long -D -H --all --bytes --octal-permissions --total-size --git --git-repos --icons=auto --no-permissions"
    alias llf="eza --long -f -H --all --bytes --octal-permissions --smart-group --git --icons=auto --no-permissions"
    alias tree="eza --tree --level=5 --icons=auto --git"
end

########################################
# 🔧 Git
########################################
alias fsb="~/.scripts/fsb.sh"
alias fshow="~/.scripts/fshow.sh"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"

########################################
# 🐳 Docker (możesz odkomentować)
########################################
# abbr dco "docker compose"
# abbr dps "docker ps"
# abbr dpa "docker ps -a"
# abbr dl "docker ps -l -q"
# abbr dx "docker exec -it"

########################################
# 📝 Neovim
########################################
abbr v nvim
alias kvim='NVIM_APPNAME="kickstart-nvim" nvim'
alias tvim='NVIM_APPNAME="test-nvim" nvim'

########################################
# 🧠 Helix
########################################
alias hx-up='~/.config/helix/lib/bash.sh'
alias set-helix-theme='~/.config/helix/lib/bash.sh'

########################################
# 📁 Zoxide
########################################
abbr cd z
abbr cdi zi
abbr cdd 'cd -'

########################################
# 📁 Directory jumps
########################################
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .... 'cd ../../..'
abbr ..... 'cd ../../../..'
abbr ...... 'cd ../../../../..'

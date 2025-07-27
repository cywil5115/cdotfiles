function lg
    set -gx LAZYGIT_NEW_DIR_FILE ~/.lazygit/newdir
    lazygit $argv

    if test -f $LAZYGIT_NEW_DIR_FILE
        cd (cat $LAZYGIT_NEW_DIR_FILE)
        rm -f $LAZYGIT_NEW_DIR_FILE >/dev/null
    end
end

function r
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    set cwd (cat "$tmp")
    if test -n "$cwd" -a "$cwd" != "$PWD"
        cd "$cwd"
    end
    rm -f "$tmp"
end

function day
    date "+%a %b %d %Y"
end
abbr dzien day

function bytesConvert
    if test (count $argv) -eq 0
        read -l -P "Size in bytes: " bytesVal
    else
        set bytesVal $argv[1]
    end
    echo $bytesVal | awk '{ split("B KB MB GB TB PB EB ZB YB", v); s=1; while($1>1024 && s<9){ $1/=1024; s++ } printf "%.2f %s", $1, v[s] }'
end

function fsize
    set filename $argv[1]
    set size (wc -c < $filename)
    bytesConvert $size
end

function pkill
    ps aux | fzf --height 40% --layout=reverse --header-lines=1 --prompt="Select process to kill: " \
        --preview 'echo {}' --preview-window up:3:hidden:wrap \
        --bind 'F2:toggle-preview' | awk '{print $2}' | xargs -r bash -c '
        if ! kill "$1" 2>/dev/null; then
            echo "Regular kill failed. Attempting with sudo..."
            sudo kill "$1" || echo "Failed to kill process $1" >&2
        fi
    ' --
end

function cpp
    if type -q rsync
        rsync -ah --info=progress2 $argv[1] $argv[2]
    else
        echo "Rsync not found. Fallback not implemented in fish."
    end
end

function set-yazi-theme
    ~/.cdotfiles/yazi/.config/yazi/theme.sh
end

function set-eza-theme
    ~/.config/eza/theme.sh
end

function set-kitty-theme
    ~/.config/kitty/lib/theme.sh
end

function switch-kitty-mode
    ~/.config/kitty/lib/switcher-light-dark.sh $argv
end

function set-bat-theme
    bat cache --build
    sleep 1
    clear
    set selTheme (bat --list-themes | fzf --preview="bat --theme={} --color=always ~/.config/fish/config.fish")
    echo $selTheme >(bat --config-dir)/themes/current_theme
    bat cache --build
    set -gx BAT_THEME (cat (bat --config-dir)/themes/current_theme)
    source ~/.config/fish/config.fish
end

function check-ssh-connection
    ss -at '( dport = :22 or sport = :22 )'
end

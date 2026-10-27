######################
# Paths
######################
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

######################
# Scripts Path
######################
export PATH=$HOME/.local/bin:$PATH

######################
# Programming Paths
######################
# Odin
[ -d $HOME/.toolchains/odin ] && export PATH=$HOME/.toolchains/odin:$PATH
[ -d $HOME/.toolchains/ols ] && export PATH=$HOME/.toolchains/ols:$PATH

# Go
export GOPATH="$HOME/.local/share/go"
export PATH="$GOPATH/bin:$PATH"

# Swift
export SWIFT_PM_CONFIG=$XDG_CONFIG_HOME/swiftpm
export SWIFT_PM_CACHE=$XDG_CACHE_HOME/swiftpm


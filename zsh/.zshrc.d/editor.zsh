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

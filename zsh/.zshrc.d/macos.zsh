######################
# MacOS
######################

case "$(uname -sr)" in
   Darwin*)

    touch ~/.hushlogin # because I don't want to see last login when shell starts

    if [ ! -f $HOME/.zprofile ]; then
      touch $HOME/.zprofile

      if ! grep -q 'brew shellenv' "$HOME/.zprofile"; then
      cat << 'EOF' > "$HOME/.zprofile"
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_REQUIRE_TAP_TRUST=1
EOF
      fi

    fi
    source $HOME/.zprofile
    ;;
esac


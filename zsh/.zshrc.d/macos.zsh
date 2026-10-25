######################
# MacOS
######################

case "$(uname -sr)" in
   Darwin*)

    touch ~/.hushlogin # because I don't want to see last login when shell starts

    if [ ! -f $HOME/.zprofile ]; then
      touch $HOME/.zprofile
    fi
    source $HOME/.zprofile
    ;;
esac


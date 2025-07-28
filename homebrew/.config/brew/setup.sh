#! usr/bin/env bash

#Install brew on MacOS
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [ ! -f $HOME/.zprofile ]; then
  touch ~/.zprofile
fi

echo "eval "$(/opt/homebrew/bin/brew shellenv)"" > $HOME/.zprofile
exec zsh

# Install essentials
xargs brew install < essentials.txt
# Install other
xargs brew install < leaves.txt

# Install Borders and start service
brew tap FelixKratz/formulae
brew install borders
brew services start borders

if command -v brew &> /dev/null; then
  if ! command -v timer &> /dev/null; then
    brew install caarlos0/tap/timer
  fi
fi

# My dotfiles managed by GNU/Stow

## Install stow and any program that you want to add first

For Arch Linux:
```
sudo pacman -S stow
```
For MacOS (using brew):
```
brew install stow
```
## If you want to install ohmyposh my way:

Make sure you using zsh (if you using bash):
```
echo $SHELL
```
Change if you need to (probably need a reboot after this):
```
sudo chsh -s $(which zsh) $USER
```
Install ohmyposh (Linux):
```
cd ~ && mkdir .ohmyposh && curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.ohmyposh
```
MacOS (ohmyposh using brew):
```
brew install jandedobbeleer/oh-my-posh/oh-my-posh
```
## Install leaves for brew (optional)
```
cd ~ && cd .cdotfiles/homebrew/.config/brew/
```
Usefull commands (example for my_brew.txt file name):
```
# save all your currently used programs:
brew leaves > my_brew.txt

# Install for a new machine:
xargs brew install < my_brew.txt
```
## One-Liners (for dotfiles)

(by SSH)

```
cd ~ && mkdir .cdotfiles && cd ~/.cdotfiles && git clone git@github.com:cywil5115/cdotfiles.git && mv -v ~/.cdotfiles/cdotfiles/* ~/.cdotfiles && cp -r ~/.cdotfiles/cdotfiles/.git ~/.cdotfiles && rm -rf ~/.cdotfiles/cdotfiles && stow */
```
(by https)

```
cd ~ && mkdir .cdotfiles && cd ~/.cdotfiles && git clone https://github.com/cywil5115/cdotfiles.git && mv -v ~/.cdotfiles/cdotfiles/* ~/.cdotfiles && cp -r ~/.cdotfiles/cdotfiles/.git ~/.cdotfiles && rm -rf ~/.cdotfiles/cdotfiles && stow */
```
### Remember to delete existings dirs in the .config and $HOME before running 'stow'

## Step by step

Create folder in home dir:
```
mkdir ~/.cdotfiles
```
Go to your new dir:
```
cd ~/.cdotfiles
```
Clone repo to that folder

(by SSH)
```
git clone git@github.com:cywil5115/cdotfiles.git
```
(by HTTPS)
```
git clone https://github.com/cywil5115/cdotfiles.git
```
Move files one dir higher:
```
mv -v ~/.cdotfiles/cdotfiles/* ~/.cdotfiles && cd .cdotfiles && cp -r ~/.cdotfiles/cdotfiles/.git ~/.cdotfiles && rm -rf ~/.cdotfiles/cdotfiles
```
Useful command to add all:
```
stow */
```
or pick one by using:
```
stow <package_name>
```
### Remember to delete existings dirs in the .config and $HOME before running 'stow'



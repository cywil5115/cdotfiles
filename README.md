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
Then install ohmyposh:
```
cd ~ && mkdir .ohmyposh && curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.ohmyposh
```
## One-Liners (for dotfiles)

(by SSH)

```
cd ~ && mkdir .cdotfiles && cd ~/.cdotfiles && git clone git@github.com:cywil5115/cdotfiles.git && mv -v ~/.cdotfiles/cdotfiles/* ~/.cdotfiles && cd ~/.cdotfiles && rm -rf ~/.cdotfiles/cdotfiles && stow */
```
(by https)

```
cd ~ && mkdir .cdotfiles && cd ~/.cdotfiles && git clone https://github.com/cywil5115/cdotfiles.git && mv -v ~/.cdotfiles/cdotfiles/* ~/.cdotfiles && cd ~/.cdotfiles && rm -rf ~/.cdotfiles/cdotfiles && stow */
```

## Step by step

Create folder in home dir:
```
mkdir ~/.codfiles
```
Go to your new dir:
```
cd ~/.codfiles
```
Git clone by https or SHH in that folder
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
mv -v ~/.cdotfiles/cdotfiles/* ~/.cdotfiles && cd .cdotfiles && rm -rf ~/.cdotfiles/cdotfiles
```
Useful command to add all:
```
stow */
```
or pick one by using:
```
stow <package_name>
```
## Remember to delete existings dirs in the .config and $HOME before running 'stow'


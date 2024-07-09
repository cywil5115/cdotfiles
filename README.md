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
## One-Liners

(by SSH)

```
cd ~ && mkdir .codfiles && cd .codfiles && git clone git@github.com:cywil5115/cdotfiles.git && stow */
```
(by https)

```
cd ~ && mkdir .codfiles && cd .codfiles && git clone https://github.com/cywil5115/cdotfiles.git && stow */
```

## Step by step

Create folder in home dir:
```
cd ~ && mkdir .codfiles
```
Go to your new dir:
```
cd .codfiles
```
Useful command to add all:
```
stow */
```
or pick one by using:
```
stow <package_name>
```


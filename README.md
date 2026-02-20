# My dotfiles managed by GNU/Stow

## Install stow and any program that you want to add first

For Arch Linux:
```
sudo pacman -S stow
```
Using brew (ex. on MacOS):
```
brew install stow
```
## Shell -> ZSH

Make sure you using zsh (if you using bash):
```
echo $SHELL
```
Change if you need to (probably need a reboot after this):
```
sudo chsh -s $(which zsh) $USER
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
cd ~ && mkdir .cdotfiles && git clone git@github.com:cywil5115/cdotfiles.git ~/.cdotfiles/
```
(by https)

```
cd ~ && mkdir .cdotfiles && git clone https://github.com/cywil5115/cdotfiles.git ~/.cdotfiles/
```

## Update Submodules:
```
cd ~/.cdotfiles/ && git submodule update --init --recursive
```

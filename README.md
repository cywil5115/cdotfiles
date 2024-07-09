# My dotfiles managed by GNU/Stow

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
## One-Liners

(by SSH)

```
cd ~ && mkdir .codfiles && cd .codfiles && git clone git@github.com:cywil5115/cdotfiles.git && stow */
```
(by https)

```
cd ~ && mkdir .codfiles && cd .codfiles && git clone https://github.com/cywil5115/cdotfiles.git && stow */
```

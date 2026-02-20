# My dotfiles managed by GNU/Stow

## Clone (one-liners)

**SSH:**

```bash
cd ~ && mkdir -p .cdotfiles && git clone git@github.com:cywil5115/cdotfiles.git ~/.cdotfiles/
```

**HTTPS:**

```bash
cd ~ && mkdir -p .cdotfiles && git clone https://github.com/cywil5115/cdotfiles.git ~/.cdotfiles/
```

After cloning, initialize submodules (if any):

```bash
cd ~/.cdotfiles && git submodule update --init --recursive
```

---

## Install dependencies

You need **GNU Stow** installed before initializing the dotfiles.

### Arch Linux

```bash
sudo pacman -S stow
```

### Fedora

```bash
sudo dnf install stow
```

### Fedora Atomic (Silverblue, Kinoite, etc.)

```bash
rpm-ostree install stow
```

Then reboot:

```bash
systemctl reboot
```

### macOS (Homebrew)

```bash
brew install stow
```

---

## Initialize dotfiles (using Makefile)

The repository includes a `Makefile` to simplify working with Stow.

Inside `~/.cdotfiles` run:

```bash
make help
```

Available targets:

* `make init`   → Initial stow of all packages
* `make restow` → Update existing links (`--restow`)
* `make unstow` → Remove all links (`--delete`)
* `make dry`    → Preview what Stow would do (no changes)
* `make help`   → Show help message

Typical first-time setup:

```bash
cd ~/.cdotfiles
make init
```

---

## Shell → ZSH

Check your current shell:

```bash
echo $SHELL
```

If you're using `bash` and want to switch to `zsh`:

```bash
sudo chsh -s $(which zsh) $USER
```

You may need to log out or reboot after changing your shell.

---

## Homebrew leaves (optional)

Path:

```bash
cd ~/.cdotfiles/homebrew/.config/brew/
```

Useful commands (example file: `my_brew.txt`):

Save currently installed packages:

```bash
brew leaves > my_brew.txt
```

Install on a new machine:

```bash
xargs brew install < my_brew.txt
```

# Read before /etc/zshrc.

# FPATH is exported, so nested shells would otherwise keep re-adding the same dirs (slows compinit).
typeset -gU path fpath

# Early, so even a system /etc/zshrc compinit sees these completions.
[[ -d "$HOME/.local/bin/zsh/zsh-completions/src" ]] && fpath+=("$HOME/.local/bin/zsh/zsh-completions/src")

#!/bin/bash
set -e

# Paths
ZSH_SOURCE="$HOME/code/dotfiles/zsh/zshrc"
ZSH_TARGET="$HOME/.zshrc"
ln -sf $ZSH_SOURCE $ZSH_TARGET
echo "Symlink created: $ZSH_TARGET → $ZSH_SOURCE"

# Zinit
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    echo "Installing zinit..."
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" \
        && echo "zinit installed." \
        || { echo "zinit install failed."; exit 1; }
fi

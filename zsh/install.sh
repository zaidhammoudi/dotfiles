#!/bin/bash
set -e

# Paths

ZSH_SOURCE="$HOME/code/dotfiles/zsh/zshrc"
ZSH_TARGET="$HOME/.zshrc"
ln -sf $ZSH_SOURCE $ZSH_TARGET
echo "Symlink created: $ZSH_TARGET → $ZSH_SOURCE"

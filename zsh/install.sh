#!/bin/bash
set -e

# Paths

ZSH_SOURCE="$HOME/code/dotfiles/zsh/zshrc"
ZSH_TARGET="$HOME/.zshrc"
ln -sf $ZSH_SOURCE $ZSH_TARGET
echo "Symlink created: $ZSH_TARGET → $ZSH_SOURCE"


ZGEN_SOURCE="$HOME/code/dotfiles/zsh/zgen.zsh"

ZGEN_TARGET="$HOME/.zgen/zgen.zsh"
mkdir -p "$HOME/.zgen"

ln -sf $ZGEN_SOURCE $ZGEN_TARGET
echo "Symlink created: $ZGEN_TARGET → $ZGEN_SOURCE"

#!/bin/bash
set -e

ln -sf "$HOME/code/dotfiles/vim/cfg" "$HOME/.config/nvim"
echo "Symlink created"

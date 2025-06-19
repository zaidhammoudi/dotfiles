#!/bin/bash
set -e

# Define absolute paths
SOURCE="$HOME/code/dotfiles/vim/vimrc"
TARGET="$HOME/.vimrc"

# Create the symlink
ln -sf $SOURCE $TARGET

echo "Symlink created"

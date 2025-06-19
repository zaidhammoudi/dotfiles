#!/bin/bash
set -e

FILES=(zgen.zsh zshrc)

SOURCE="$HOME/code/dotfiles/zsh"
TARGET="$HOME"

for file in "${FILES[@]}"; do
  ln -sf "$DOTFILES_DIR/$file" "$TARGET_DIR/.$file"
  echo "Symlink created: $TARGET_DIR/.$file → $DOTFILES_DIR/$file"
done


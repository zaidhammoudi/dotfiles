DOTFILES := $(shell pwd)

zsh:
	ln -sf $(DOTFILES)/zsh/zshrc ~/.zshrc
	ln -sf $(DOTFILES)/zsh/zsh_aliases ~/.zsh_aliases

git:
	ln -sf $(DOTFILES)/git/gitconfig ~/.gitconfig

tmux:
	ln -sf $(DOTFILES)/tmux/tmux.conf ~/.tmux.conf

psql:
	ln -sf $(DOTFILES)/psql/psqlrc ~/.psqlrc

nvim:
	mkdir -p ~/.config
	ln -sfn $(DOTFILES)/vim/cfg ~/.config/nvim

ssh:
	mkdir -p ~/.ssh && chmod 700 ~/.ssh
	ln -sf $(DOTFILES)/ssh/config ~/.ssh/config

ghostty:
	mkdir -p ~/Library/Application\ Support/com.cmuxterm.app
	ln -sf $(DOTFILES)/config.ghostty ~/Library/Application\ Support/com.cmuxterm.app/config.ghostty

install: zsh git tmux psql nvim ssh ghostty

.PHONY: install zsh git tmux psql nvim ssh ghostty

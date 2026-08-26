DOTFILES := $(shell pwd)
UNAME_S  := $(shell uname -s)

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

i3:
	mkdir -p ~/.config
	[ -L ~/.config/i3 ] || [ ! -e ~/.config/i3 ] || rm -rf ~/.config/i3
	ln -sfn $(DOTFILES)/i3 ~/.config/i3
	[ -L ~/.config/i3status ] || [ ! -e ~/.config/i3status ] || rm -rf ~/.config/i3status
	ln -sfn $(DOTFILES)/i3status ~/.config/i3status

claude:
	mkdir -p ~/.claude
	ln -sf $(DOTFILES)/claude/statusline-command.sh ~/.claude/statusline-command.sh

ssh:
	mkdir -p ~/.ssh && chmod 700 ~/.ssh
	ln -sf $(DOTFILES)/ssh/config ~/.ssh/config

ghostty:
ifeq ($(UNAME_S),Darwin)
	mkdir -p ~/Library/Application\ Support/com.cmuxterm.app
	ln -sf $(DOTFILES)/config.ghostty ~/Library/Application\ Support/com.cmuxterm.app/config.ghostty
else
	mkdir -p ~/.config/ghostty
	ln -sf $(DOTFILES)/config.ghostty ~/.config/ghostty/config
endif

cmux:
	mkdir -p ~/.config/cmux
	ln -sf $(DOTFILES)/cmux.json ~/.config/cmux/cmux.json

herdr:
	mkdir -p ~/.config/herdr
	ln -sf $(DOTFILES)/herdr/config.toml ~/.config/herdr/config.toml

install: zsh git tmux psql nvim i3 claude ssh ghostty cmux herdr

.PHONY: install zsh git tmux psql nvim i3 claude ssh ghostty cmux herdr

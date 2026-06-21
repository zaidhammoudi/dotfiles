DOTFILES := $(shell pwd)

link:
	ln -sf $(DOTFILES)/zsh/zshrc ~/.zshrc
	ln -sf $(DOTFILES)/zsh/zsh_aliases ~/.zsh_aliases
	ln -sf $(DOTFILES)/git/gitconfig ~/.gitconfig
	ln -sf $(DOTFILES)/tmux/tmux.conf ~/.tmux.conf
	ln -sf $(DOTFILES)/psql/psqlrc ~/.psqlrc
	mkdir -p ~/.config
	ln -sfn $(DOTFILES)/vim/cfg ~/.config/nvim
	mkdir -p ~/.config/ghostty
	ln -sf $(DOTFILES)/config.ghostty ~/.config/ghostty/config
	mkdir -p ~/.ssh && chmod 700 ~/.ssh
	ln -sf $(DOTFILES)/ssh/config ~/.ssh/config

install: link

.PHONY: link install

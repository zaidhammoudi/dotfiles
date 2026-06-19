DOTFILES := $(shell pwd)
ZINIT_HOME := $(HOME)/.local/share/zinit/zinit.git

link:
	ln -sf $(DOTFILES)/zsh/zshrc ~/.zshrc
	ln -sf $(DOTFILES)/zsh/zsh_aliases ~/.zsh_aliases
	ln -sf $(DOTFILES)/git/gitconfig ~/.gitconfig
	ln -sf $(DOTFILES)/tmux/tmux.conf ~/.tmux.conf
	ln -sf $(DOTFILES)/psql/psqlrc ~/.psqlrc
	mkdir -p ~/.config
	ln -sfn $(DOTFILES)/vim/cfg ~/.config/nvim
	mkdir -p ~/.ssh && chmod 700 ~/.ssh
	ln -sf $(DOTFILES)/ssh/config ~/.ssh/config

zinit:
	@if [ ! -f $(ZINIT_HOME)/zinit.zsh ]; then \
		echo "Installing zinit..."; \
		mkdir -p $$(dirname $(ZINIT_HOME)) && chmod g-rwX $$(dirname $(ZINIT_HOME)); \
		git clone https://github.com/zdharma-continuum/zinit $(ZINIT_HOME); \
	fi

zinit-force:
	rm -rf $(ZINIT_HOME)
	@$(MAKE) zinit

install: link zinit

.PHONY: link zinit zinit-force install

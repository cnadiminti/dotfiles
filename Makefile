update:
	@echo "Updating Brewfile"
	brew bundle dump --global --force

shellcheck:
	shellcheck -x -e SC2155 bin/install.sh dotfiles/bash_functions dotfiles/bash_aliases dotfiles/bashrc

codeclimate:
	codeclimate-docker analyze

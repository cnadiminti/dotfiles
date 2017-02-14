update:
	@echo "Updating dotfiles/pip/requirements.txt"
	pip freeze > dotfiles/pip/requirements2.txt
	pip3 freeze > dotfiles/pip/requirements3.txt
	@echo "Updating Brewfile"
	brew bundle dump --global --force

shellcheck:
	shellcheck -x -e SC2155 bin/install.sh dotfiles/bash_functions dotfiles/bash_aliases dotfiles/bashrc

codeclimate:
	docker run -it --rm --env CODECLIMATE_CODE="$${PWD}" -v "$${PWD}":/code -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/cc:/tmp/cc codeclimate/codeclimate analyze

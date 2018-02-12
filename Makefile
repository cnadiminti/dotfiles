update:
	@echo "Updating dotfiles/pip/requirements*.txt"
	pip2 freeze > dotfiles/pip/requirements2.txt
	pip3 freeze > dotfiles/pip/requirements3.txt
	@echo "Updating Brewfile"
	brew bundle dump --global --force

shellcheck:
	shellcheck -x -e SC2155 bin/install.sh dotfiles/bash_functions dotfiles/bash_aliases dotfiles/bashrc

codeclimate:
	docker run -it --rm --env CODECLIMATE_CODE="$${PWD}" -v "$${PWD}":/code -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/cc:/tmp/cc codeclimate/codeclimate analyze

doc-help:
	for pkg in `brew leaves`; do \
		brew info $${pkg} --json=v1 | python -c 'import json,sys; obj=json.load(sys.stdin)[0]; print "- [x] [" + obj["full_name"] + "](" + obj["homepage"] + ")"'; \
	done

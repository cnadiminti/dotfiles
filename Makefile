update:
	#@echo "Updating dotfiles/pip/requirements*.txt"
	#pip3 freeze > dotfiles/pip/requirements3.txt
	@echo "Updating Brewfile"
	brew bundle dump --global --force

shellcheck:
	shellcheck -x -e SC2155 bin/install.sh dotfiles/bash_functions dotfiles/bash_aliases dotfiles/bashrc

codeclimate:
	docker run -it --rm --env CODECLIMATE_CODE="$${PWD}" -v "$${PWD}":/code -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/cc:/tmp/cc codeclimate/codeclimate analyze

doc-help:
	for pkg in `brew list --cask`; do \
		brew info $${pkg} --cask --json=v2 | python3 -c 'import json,sys; obj=json.load(sys.stdin)["casks"][0]; print("- [x] [" + obj["name"][0] + "](" + obj["homepage"] + ") " + (obj["desc"] if obj["desc"] != None else ""))';  \
	done
	for pkg in `brew leaves`; do \
		brew info $${pkg} --json=v1 | python3 -c 'import json,sys; obj=json.load(sys.stdin)[0]; print("- [x] [" + obj["full_name"] + "](" + obj["homepage"] + ") " + (obj["desc"] if obj["desc"] != None else ""))'; \
	done

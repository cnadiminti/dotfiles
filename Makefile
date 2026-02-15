update:
	#@echo "Updating dotfiles/pip/requirements*.txt"
	#pip3 freeze > dotfiles/pip/requirements3.txt
	@echo "Updating Brewfile"
	@brew bundle dump --global --force
	@if [ -f ~/.Brewfile.local ]; then \
		echo "Deduplicating: removing packages already in ~/.Brewfile.local"; \
		grep -Fxvf ~/.Brewfile.local ~/.Brewfile > ~/.Brewfile.tmp && cat ~/.Brewfile.tmp > ~/.Brewfile; \
		rm -f ~/.Brewfile.tmp; \
	fi

shellcheck:
	shellcheck -x -e SC2155 -e SC1090 -e SC1091 -e SC2317 bin/install.sh bin/symlink-dotfiles.sh dotfiles/bash_functions dotfiles/bash_aliases dotfiles/bashrc

codeclimate:
	docker run -it --rm --env CODECLIMATE_CODE="$${PWD}" -v "$${PWD}":/code -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/cc:/tmp/cc codeclimate/codeclimate analyze

doc-help:
	for pkg in `brew list --cask`; do \
		brew info $${pkg} --cask --json=v2 | python3 -c 'import json,sys; obj=json.load(sys.stdin)["casks"][0]; print("- [x] [" + obj["name"][0] + "](" + obj["homepage"] + ") " + (obj["desc"] if obj["desc"] != None else ""))';  \
	done
	for pkg in `brew leaves`; do \
		brew info $${pkg} --json=v1 | python3 -c 'import json,sys; obj=json.load(sys.stdin)[0]; print("- [x] [" + obj["full_name"] + "](" + obj["homepage"] + ") " + (obj["desc"] if obj["desc"] != None else ""))'; \
	done

# Testing targets
test-macos-dryrun:
	@echo "========================================"
	@echo "Testing install.sh on macOS (Dry-Run)"
	@echo "========================================"
	@echo ""
	@echo "OS: $$(uname -s)"
	@echo "Shell: $${SHELL}"
	@echo ""
	@echo "=== Test 1: Dry-run installation ==="
	@./bin/install.sh --dry-run > /dev/null || (echo "✗ FAILED: install.sh --dry-run exited with non-zero" && exit 1)
	@echo "✓ PASS: install.sh --dry-run completed successfully"
	@echo ""
	@echo "=== Test 2: Prerequisites check ==="
	@command -v brew >/dev/null 2>&1 && echo "✓ Homebrew: $$(brew --version | head -1)" || echo "✗ Homebrew not installed"
	@command -v bash >/dev/null 2>&1 || (echo "✗ FAILED: bash not found" && exit 1)
	@echo "✓ bash: $$(bash --version | head -1)"
	@echo ""
	@echo "✓ All tests passed!"

test-alpine:
	@echo "=== Testing on Alpine Linux ==="
	@docker run --rm -v "$${PWD}":/root/dotfiles alpine:latest sh -c "\
		set -e && \
		apk add --no-cache bash git curl > /dev/null 2>&1 && \
		cd /root/dotfiles && \
		./bin/install.sh && \
		echo '' && \
		echo '=== Test 1: Verifying symlinks created ===' && \
		SYMLINK_COUNT=\$$(ls -la ~ | grep '\->' | wc -l) && \
		echo \"Symlinks created: \$$SYMLINK_COUNT\" && \
		test \$$SYMLINK_COUNT -ge 10 || (echo '✗ FAILED: Expected at least 10 symlinks' && exit 1) && \
		test -L ~/.bashrc || (echo '✗ FAILED: ~/.bashrc is not a symlink' && exit 1) && \
		test -L ~/.gitconfig || (echo '✗ FAILED: ~/.gitconfig is not a symlink' && exit 1) && \
		echo '✓ PASS: All symlinks created correctly' && \
		echo '' && \
		echo '=== Test 2: Verifying idempotency (rerun) ===' && \
		OUTPUT=\$$(./bin/install.sh 2>&1) && \
		LINKED_COUNT=\$$(echo \"\$$OUTPUT\" | grep -c 'Linked:' || true) && \
		echo \"Symlinks recreated: \$$LINKED_COUNT\" && \
		test \$$LINKED_COUNT -eq 0 || (echo '✗ FAILED: Should not recreate existing symlinks' && exit 1) && \
		echo '✓ PASS: Idempotent (no changes on rerun)' && \
		echo '' && \
		echo '✓ All assertions passed!'"

test-ubuntu:
	@echo "=== Testing on Ubuntu ==="
	@docker run --rm -v "$${PWD}":/root/dotfiles ubuntu:latest bash -c "\
		set -e && \
		apt-get update -qq && apt-get install -y -qq git curl > /dev/null 2>&1 && \
		cd /root/dotfiles && \
		./bin/install.sh && \
		echo '' && \
		echo '=== Test 1: Verifying symlinks created ===' && \
		SYMLINK_COUNT=\$$(ls -la ~ | grep '\->' | wc -l) && \
		echo \"Symlinks created: \$$SYMLINK_COUNT\" && \
		test \$$SYMLINK_COUNT -ge 10 || (echo '✗ FAILED: Expected at least 10 symlinks' && exit 1) && \
		test -L ~/.gitconfig || (echo '✗ FAILED: ~/.gitconfig is not a symlink' && exit 1) && \
		test -L ~/.Brewfile || (echo '✗ FAILED: ~/.Brewfile is not a symlink' && exit 1) && \
		echo '✓ PASS: All symlinks created correctly' && \
		echo '' && \
		echo '=== Test 2: Verifying idempotency (rerun) ===' && \
		OUTPUT=\$$(./bin/install.sh 2>&1) && \
		LINKED_COUNT=\$$(echo \"\$$OUTPUT\" | grep -c 'Linked:' || true) && \
		echo \"Symlinks recreated: \$$LINKED_COUNT\" && \
		test \$$LINKED_COUNT -eq 0 || (echo '✗ FAILED: Should not recreate existing symlinks' && exit 1) && \
		echo '✓ PASS: Idempotent (no changes on rerun)' && \
		echo '' && \
		echo '✓ All assertions passed!'"

test-all: shellcheck test-alpine test-ubuntu test-macos-dryrun
	@echo ""
	@echo "=== All tests passed! ==="

.PHONY: update shellcheck codeclimate doc-help test-macos-dryrun test-alpine test-ubuntu test-all

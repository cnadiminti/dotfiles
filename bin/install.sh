#!/usr/bin/env bash

set -e

DOTFILES_BIN_DIR=$(dirname "$0")
REPO_ROOT_DIR="${DOTFILES_BIN_DIR}/.."

function usage {
    echo "Usage: $(basename "$0") [OPTIONS]" 1>&2
    echo '' 1>&2
    echo OPTIONS 1>&2
    echo '    -a, --all   install all' 1>&2
    echo '    --help      display this help and exit' 1>&2
    exit 1
}

# loop for future additions
install_all=""
for arg in "$@"; do
    case "$arg" in
        -a|--all)
            install_all=true
            ;;
        --help)
            usage
            exit
            ;;
        *)
            usage
            exit 1
            ;;
    esac
done

# shellcheck source=dotfiles/bash_functions
source "$REPO_ROOT_DIR/dotfiles/bash_functions"
system_info "$@"

# shellcheck source=bin/install_dotfiles.sh
source "${DOTFILES_BIN_DIR}/install_dotfiles.sh"

if [ "$install_all" ]; then
    # shellcheck source=bin/install_apps.sh
    source "${DOTFILES_BIN_DIR}/install_apps.sh"
fi

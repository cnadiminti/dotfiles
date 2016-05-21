#!/usr/bin/env bash

set -e

export DOTFILES_BIN_DIR=$(dirname "$0")
export REPO_ROOT_DIR="${DOTFILES_BIN_DIR}/.."

source "$REPO_ROOT_DIR/dotfiles/bash_functions"
system-info

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

source "${DOTFILES_BIN_DIR}/install_dotfiles.sh"

if [ "$install_all" ]; then
    source "${DOTFILES_BIN_DIR}/install_apps.sh"
fi

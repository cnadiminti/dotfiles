#!/usr/bin/env bash

set -e

if [ "$SYS_OS_NAME" = "Darwin" ] ; then
    hash brew 2>/dev/null || \
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install python
elif [ "$SYS_OS_NAME" = "Linux" ] ; then
    if [ "$SYS_OS_TYPE" = "debian" ] ; then
        execute-command 'sudo apt-get install python-pip -y'
    elif [ "$SYS_OS_TYPE" = "redhat" ] ; then
        execute-command 'sudo yum -y install epel-release'
        execute-command 'sudo yum -y install python-pip'
    else
        echo "Error: Un-expected Linux distribution"
        exit 1
    fi
else
    echo "Error: Un-expected OS $SYS_OS_NAME"
    exit 1
fi

hash dotfiles 2>/dev/null || \
    execute-command 'sudo pip install dotfiles' "Installing dotfiles using pip"

dotfiles -R "${REPO_ROOT_DIR}/dotfiles" -sf
dotfiles -R "${REPO_ROOT_DIR}/dotfiles" -l

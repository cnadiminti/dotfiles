#!/usr/bin/env bash

set -e

export DOTFILES_BIN_DIR=`dirname $0`
export REPO_ROOT_DIR=`dirname $0`/..

. $REPO_ROOT_DIR/dotfiles/bash_functions
read os_name os_info <<< `sh $DOTFILES_BIN_DIR/os_info.sh`

# Install pip
if [ "$os_name" = "Darwin" ] ; then
    if test ! $(which brew); then
        echo "Installing Homebrew for you."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    brew install python
elif [ "$os_name" = "Linux" ] ; then
    read distro more_info <<<"$os_info"
    if [ "$distro" = "Debian" ] ; then
        execute-command 'sudo apt-get install python-pip -y'
    elif [ "$distro" = "RedHat" ] ; then
        execute-command 'sudo yum -y install epel-release'
        execute-command 'sudo yum -y install python-pip'
    else
        echo "Error: Un-expected Linux distribution"
        exit 1
    fi
else
    echo "Error: Un-expected OS"
    exit 1
fi

if test ! $(which dotfiles); then
    execute-command 'sudo pip install dotfiles' "Installing dotfiles using pip"
fi

dotfiles -R $REPO_ROOT_DIR/dotfiles -sf
dotfiles -R $REPO_ROOT_DIR/dotfiles -l

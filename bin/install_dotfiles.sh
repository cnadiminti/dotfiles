#!/usr/bin/env bash

set -e

read os_name os_info <<< `sh ./os_info.sh`

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
        sudo apt-get install python-pip -y
    elif [ "$distro" = "RedHat" ] ; then
        sudo yum -y install epel-release
        sudo yum -y install python-pip
    else
        echo "Error: Un-expected Linux distribution"
        exit 1
    fi
else
    echo "Error: Un-expected OS"
    exit 1
fi

if test ! $(which dotfiles); then
    echo "Installing dotfiles using pip..."
    sudo pip install dotfiles
fi

dotfiles -R `pwd`/../dotfiles -sf
dotfiles -R `pwd`/../dotfiles -l

#!/usr/bin/env bash

set -e

read os_name os_info <<< `sh ./os_info.sh`

# Install homebrew, if needed
if [ "$os_name" = "Darwin" ] ; then
    if test ! $(which brew); then
        echo "  Installing Homebrew for you."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    pkg_mgr='brew'
elif [ "$os_name" = "Linux" ] ; then
    read distro <<<"$os_info"
    if [ "$distro" = "Debian" ] ; then
        pkg_mgr='apt-get'
    #elif [ "$distro" = "RedHat" ] ; then
        #    pkg_mgr='yum'
    else
        echo "Un-expected Linux distribution"
        exit 1
    fi
else
    echo "Error: Un-expected OS"
    exit 1
fi

# Install packages
$pkg_mgr install wget bash

#$pkg_mgr install coreutils
#PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
#MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

if [ "$os_name" = "Darwin" ] && [ "`python --version 2>&1`" != 'Python 2.7.10' ] ; then
    wget https://www.python.org/ftp/python/2.7.10/python-2.7.10-macosx10.6.pkg
    sudo installer -pkg python-2.7.10-macosx10.6.pkg -target /
    rm -f python-2.7.10-macosx10.6.pkg
    sudo easy_install pip
else
   $pkg_mgr install python
fi

#ruby
#bash
#emacs
$pkg_mgr install dos2unix
$pkg_mgr install ansible
$pkg_mgr install grc

$pkg_mgr install ipcalc
if [ "$os_name" = "Darwin" ] ; then
    $pkg_mgr install ossp-uuid
else
    $pkg_mgr install uuid
fi
$pkg_mgr install kdiff3
$pkg_mgr install cmake

#autoconf
#berkeley-db
#brew-cask
#docker
#erlang
#figlet
#freetype
#gdbm
#gettext
#glib
#gmp
#gnutls
#jpeg
#libffi
#libmagic
#libpng
#libtasn1
#libtiff
#mysql
#net-snmp
#nettle
#openssl
#pixman
#pkg-config
#popt
#qemu
#rbenv
#rbenv-bundler-ruby-version
#rpm
#ruby-build
#sqlite
#ssh-copy-id
#unixodbc
#wxmac
#xz

if test ! $(which dotfiles); then
    echo "Installing dotfiles using pip..."
    sudo pip install dotfiles
fi

cd .. && dotfiles -R . -sfl

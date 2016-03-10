#!/usr/bin/env bash

set -e

read os_name os_info <<< `sh ./os_info.sh`

# Install all the basic tools and apps
if [ "$os_name" = "Darwin" ] ; then
    brew update && brew upgrade
    brew bundle --global
    brew linkapps emacs kdiff3
    #brew bundle cleanup --global
    brew cleanup && brew cask cleanup
elif [ "$os_name" = "Linux" ] ; then
    read distro more_info <<<"$os_info"
    if [ "$distro" = "Debian" ] ; then
        sudo apt-get install grc wget git bash-completion -y
        sudo apt-get install fonts-inconsolata -y
        sudo apt-get install libnotify-bin -y
        sudo apt-get install gcc -y
        sudo apt-get install -y golang
        # TODO: update the list
        if [ "`which eclipse`" == "" ]; then
            sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make -y
            sudo apt-get update
            sudo apt-get install ubuntu-make -y
            umake ide eclipse ${HOME}/.local/share/umake/ide/eclipse
        fi
    elif [ "$distro" = "RedHat" ] ; then
        sudo yum -y install grc wget git bash-completion
        sudo yum -y install levien-inconsolata-fonts
        sudo yum -y install libnotify
        sudo yum -y install gcc
        sudo yum -y install golang
        # TODO: update the list
    else
        echo 'Error: Un-expected Linux distribution'
        exit 1
    fi
    # Install Ruby from source
    if [ "`which ruby`" = "" ] || [ "`ruby -e 'puts RUBY_VERSION'`" != "2.3.0" ]; then
        wget https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.gz \
            && tar zxf ruby-2.3.0.tar.gz \
            && cd ruby-2.3.0 \
            && ./configure \
            && make \
            && sudo make install \
            && cd .. && rm -rf ruby-2.3.0.tar.gz ruby-2.3.0
    fi
else
    echo 'Error: Un-expected OS'
    exit 1
fi

# gocode and oracle for GO programming 
#go get -u github.com/nsf/gocode
#go get -u golang.org/x/tools/cmd/...
#go get -u github.com/golang/lint/golint

./install_eclipse_plugins.sh

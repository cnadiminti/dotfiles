#!/usr/bin/env bash

set -e

# Install all the basic tools and apps
if [ "$SYS_OS_NAME" = "Darwin" ] ; then
    brew update && brew upgrade
    brew bundle --global
    brew linkapps emacs kdiff3
    #brew bundle cleanup --global
    brew cleanup && brew cask cleanup
elif [ "$SYS_OS_NAME" = "Linux" ] ; then
    if [ "$SYS_OS_TYPE" = "debian" ] ; then
        execute_command 'sudo apt-get install grc wget git bash-completion -y'
        execute_command 'sudo apt-get install fonts-inconsolata -y'
        execute_command 'sudo apt-get install libnotify-bin -y'
        execute_command 'sudo apt-get install gcc -y'
        execute_command 'sudo apt-get install -y golang'
        # TODO: update the list
        if ! hash eclipse 2>/dev/null; then
            execute_command 'sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make -y'
            execute_command 'sudo apt-get update'
            execute_command 'sudo apt-get install ubuntu-make -y'
            execute_command "umake ide eclipse ${HOME}/.local/share/umake/ide/eclipse"
        fi
    elif [ "$SYS_OS_TYPE" = "redhat" ] ; then
        execute_command 'sudo yum -y install grc wget git bash-completion'
        execute_command 'sudo yum -y install levien-inconsolata-fonts'
        execute_command 'sudo yum -y install libnotify'
        execute_command 'sudo yum -y install gcc'
        execute_command 'sudo yum -y install golang'
        # TODO: update the list
    else
        echo "Error: Un-expected Linux distribution $SYS_OS_TYPE"
        exit 1
    fi
    # Install Ruby from source
    if ! hash ruby 2>/dev/null || [ "$(ruby -e 'puts RUBY_VERSION')" != "2.3.0" ]; then
        wget https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.gz \
            && tar zxf ruby-2.3.0.tar.gz \
            && cd ruby-2.3.0 \
            && ./configure \
            && make \
            && sudo make install \
            && cd .. && rm -rf ruby-2.3.0.tar.gz ruby-2.3.0
    fi
else
    echo "Error: Un-expected OS $SYS_OS_NAME"
    exit 1
fi

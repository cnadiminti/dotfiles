#!/usr/bin/env bash

set -e

REPO_ROOT_DIR="$(dirname "$0")/.."

function install_dotfiles {
    if [ "$SYS_OS_NAME" = "Darwin" ] ; then
        hash brew 2>/dev/null || \
            ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        brew install python
    elif [ "$SYS_OS_NAME" = "Linux" ] ; then
        if [ "$SYS_OS_TYPE" = "debian" ] ; then
            execute_command 'sudo apt-get install python-pip -y'
        elif [ "$SYS_OS_TYPE" = "redhat" ] ; then
            execute_command 'sudo yum -y install epel-release'
            execute_command 'sudo yum -y install python-pip'
        else
            echo "Error: Un-expected Linux distribution"
            exit 1
        fi
    else
        echo "Error: Un-expected OS $SYS_OS_NAME"
        exit 1
    fi

    hash dotfiles 2>/dev/null || \
        execute_command 'sudo pip install dotfiles==0.6.4' "Installing dotfiles using pip"

    dotfiles -R "${REPO_ROOT_DIR}/dotfiles" -sf
    dotfiles -R "${REPO_ROOT_DIR}/dotfiles" -l
}

function install_apps {
    # Install all the basic tools and apps
    if [ "$SYS_OS_NAME" = "Darwin" ] ; then
        brew update
        brew upgrade
        brew bundle --global
    elif [ "$SYS_OS_NAME" = "Linux" ] ; then
        if [ "$SYS_OS_TYPE" = "debian" ] ; then
            execute_command 'sudo apt-get install -y grc wget git bash-completion'
            execute_command 'sudo apt-get install -y fonts-inconsolata'
            execute_command 'sudo apt-get install -y libnotify-bin'
            execute_command 'sudo apt-get install -y gcc'
            execute_command 'sudo apt-get install -y golang'
            # TODO: update the list
            if ! hash eclipse 2>/dev/null; then
                execute_command 'sudo apt-get install -y software-properties-common python-software-properties'
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
        if ! hash ruby 2>/dev/null || [ "$(ruby -e 'puts RUBY_VERSION')" != "2.3.3" ]; then
            wget https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.3.tar.gz \
                && tar zxf ruby-2.3.3.tar.gz \
                && cd ruby-2.3.3 \
                && ./configure \
                && make \
                && sudo make install \
                && cd .. && rm -rf ruby-2.3.3.tar.gz ruby-2.3.3
        fi
    else
        echo "Error: Un-expected OS $SYS_OS_NAME"
        exit 1
    fi
}

function usage {
    echo "Usage: $(basename "$0") [OPTIONS]" 1>&2
    echo '' 1>&2
    echo OPTIONS 1>&2
    echo '    -a, --all   install all' 1>&2
    echo '    --help      display this help and exit' 1>&2
    exit 1
}

# ###############################################
# main
# ###############################################
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

install_dotfiles

if [ "$install_all" ]; then
    install_apps
fi

#!/usr/bin/env bash

set -e

export DOTFILES_BIN_DIR=`dirname $0`
export REPO_ROOT_DIR=`dirname $0`/..

. $REPO_ROOT_DIR/dotfiles/bash_functions
read os_name os_info <<< `sh $DOTFILES_BIN_DIR/os_info.sh`

./$DOTFILES_BIN_DIR/install_dotfiles.sh

. $DOTFILES_BIN_DIR/install_apps.sh

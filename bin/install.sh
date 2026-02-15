#!/usr/bin/env bash

set -e

# Dry-run mode - set to true to see what would be executed without running commands
DRY_RUN="${DRY_RUN:-false}"

# Ensure bash is the default shell (only change if needed)
# Check if shell is any bash variant (/bin/bash, /opt/homebrew/bin/bash, etc.)
if [[ "$SHELL" == *"bash"* ]]; then
    echo "✓ Shell is already bash ($SHELL)"
elif command -v chsh >/dev/null 2>&1; then
    if [ "$DRY_RUN" = "true" ]; then
        echo "[DRY-RUN] Would run: chsh -s /bin/bash (current: $SHELL)"
    else
        chsh -s /bin/bash
    fi
fi

REPO_ROOT_DIR="$(dirname "$0")/.."

function install_dotfiles {
    if [ "$SYS_OS_NAME" = "Darwin" ] ; then
        # Ensure Homebrew is installed
        if ! hash brew 2>/dev/null; then
            if [ "$DRY_RUN" = "true" ]; then
                echo "[DRY-RUN] Would install Homebrew"
            else
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            fi
        else
            echo "✓ Homebrew already installed"
        fi
    elif [ "$SYS_OS_NAME" = "Linux" ] ; then
        # No additional dependencies needed for dotfiles symlinking
        :
    else
        echo "Error: Un-expected OS $SYS_OS_NAME"
        exit 1
    fi

    # Use our custom bash symlinking script (no Python dependencies)
    if [ "$DRY_RUN" = "true" ]; then
        echo "[DRY-RUN] Would run: ${REPO_ROOT_DIR}/bin/symlink-dotfiles.sh"
        DRY_RUN=true "${REPO_ROOT_DIR}/bin/symlink-dotfiles.sh"
    else
        "${REPO_ROOT_DIR}/bin/symlink-dotfiles.sh"
    fi
}

function install_apps {
    # Install all the basic tools and apps
    if [ "$SYS_OS_NAME" = "Darwin" ] ; then
        if [ "$DRY_RUN" = "true" ]; then
            echo "[DRY-RUN] Would run: brew update"
            echo "[DRY-RUN] Would run: brew upgrade"
            echo "[DRY-RUN] Would run: brew bundle --global"
        else
            brew update
            brew upgrade
            brew bundle --global
        fi
    elif [ "$SYS_OS_NAME" = "Linux" ] ; then
        if [ "$SYS_OS_TYPE" = "debian" ] ; then
            # Core development tools
            execute_command 'sudo apt-get install -y grc wget git bash-completion'
            execute_command 'sudo apt-get install -y fonts-inconsolata'
            execute_command 'sudo apt-get install -y libnotify-bin'
            execute_command 'sudo apt-get install -y build-essential'
            execute_command 'sudo apt-get install -y golang'
        elif [ "$SYS_OS_TYPE" = "redhat" ] ; then
            # Core development tools
            execute_command 'sudo yum -y install grc wget git bash-completion'
            execute_command 'sudo yum -y install levien-inconsolata-fonts'
            execute_command 'sudo yum -y install libnotify'
            execute_command 'sudo yum -y install gcc make'
            execute_command 'sudo yum -y install golang'
        else
            echo "Error: Un-expected Linux distribution $SYS_OS_TYPE"
            exit 1
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
    echo '    -a, --all       install all' 1>&2
    echo '    --dry-run       show what would be executed without running' 1>&2
    echo '    --help          display this help and exit' 1>&2
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
        --dry-run)
            DRY_RUN=true
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

#!/usr/bin/env bash
# Simple dotfiles symlinking - replaces python-dotfiles package
# Creates symlinks from dotfiles/* to ~/.*

set -e

# Dry-run mode - set to true to see what would be executed without running commands
DRY_RUN="${DRY_RUN:-false}"

REPO_ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DOTFILES_DIR="${REPO_ROOT_DIR}/dotfiles"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

if [ "$DRY_RUN" = "true" ]; then
    echo -e "${YELLOW}[DRY-RUN] Would create symlinks from ${DOTFILES_DIR} to home directory...${NC}"
else
    echo -e "${BLUE}Creating symlinks from ${DOTFILES_DIR} to home directory...${NC}"
fi

# Find all files/dirs in dotfiles/ (not recursive, depth 1 only)
for item in "${DOTFILES_DIR}"/*; do
    # Skip if not exists
    [ -e "$item" ] || continue

    filename=$(basename "$item")

    # Skip files that shouldn't be symlinked
    case "$filename" in
        .DS_Store|*.backup|*.bak|*.tmp)
            continue
            ;;
    esac

    target="${HOME}/.${filename}"

    # Check if symlink already exists and points to correct target
    if [ -L "$target" ]; then
        current_target=$(readlink "$target")
        if [ "$current_target" = "$item" ]; then
            # Already correct, skip
            continue
        else
            # Points elsewhere, remove and recreate
            if [ "$DRY_RUN" = "true" ]; then
                echo -e "${YELLOW}[DRY-RUN]${NC} Would update symlink: ~/.${filename} (currently -> ${current_target})"
            else
                rm "$target"
            fi
        fi
    elif [ -e "$target" ]; then
        echo "Warning: $target exists and is not a symlink. Skipping."
        continue
    fi

    # Create symlink
    if [ "$DRY_RUN" = "true" ]; then
        echo -e "${YELLOW}[DRY-RUN]${NC} Would link: ~/.${filename} -> ${item}"
    else
        ln -s "$item" "$target"
        echo -e "${GREEN}✓${NC} Linked: ~/.${filename} -> ${item}"
    fi
done

if [ "$DRY_RUN" = "true" ]; then
    echo -e "\n${YELLOW}[DRY-RUN] Complete! No changes were made.${NC}"
else
    echo -e "\n${BLUE}Symlinks created successfully!${NC}"
    echo -e "\nTo verify, run: ls -la ~ | grep '${REPO_ROOT_DIR}'"
fi
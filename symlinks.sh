#!bin/bash
# This file stores the symlinks to be created.

DOTFILES_ROOT=$(pwd -P)

# The format is:
# <source_path>:<destination_path>
# The source path is relative to the DOTFILES_ROOT directory.
# The destination path is the absolute path where the symlink will be created.
declare -A symlinks=(
  ["$DOTFILES_ROOT/zsh/zshrc"]="$HOME/.zshrc"
  ["$DOTFILES_ROOT/zsh/p10k"]="$HOME/.p10k.zsh"
)
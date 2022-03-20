#!/bin/bash

declare -A files
files=(
    ["$HOME/.zshenv"]="./zsh/.zshenv"
    ["$HOME/.config/nvim/init.vim"]="./nvim/init.vim"
)

case $1 in
    save)
        for f in "${!files[@]}"; do echo "$f" and "${files[$f]}"; done
        # TODO backup files
        ;;
    restore)
        for f in "${!files[@]}"; do echo "${files[$f]}" and "$f"; done
        ;;
    *)
        echo "Usage: $0 save|restore"
        ;;
  esac

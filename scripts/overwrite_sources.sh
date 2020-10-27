#!/bin/bash

readonly dotfiles_dir=$(dirname "$1" | pwd)

function overwrite() {
  local filename=$1

  if [ -f "$HOME/$filename" ]; then
    mv "$HOME/$filename" "$dotfiles_dir/tmp/$filename"
    echo "moved to $dotfiles_dir/tmp/$filename"
  fi

  cp "$dotfiles_dir/source/$filename" "$HOME"
}

overwrite .profile
overwrite .gitconfig

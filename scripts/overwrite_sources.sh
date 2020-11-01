#!/bin/bash

# shellcheck disable=SC2164
readonly dotfiles_dir=$(cd "$(dirname "$0")"; pwd)

function overwrite() {
  local filename=$1

  if [ -f "$HOME/$filename" ]; then
    mv "$HOME/$filename" "$dotfiles_dir/tmp/$filename"
    echo "moved to $dotfiles_dir/tmp/$filename"
  fi

  cp "$dotfiles_dir/sources/$filename" "$HOME"
}

overwrite .profile
overwrite .gitconfig
overwrite .shellcheckrc

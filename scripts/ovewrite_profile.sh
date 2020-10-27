#!/bin/bash

readonly dotfiles_dir=$(dirname "$1" | pwd)

if [ -e "~/.profile" ]; then
  mv ~/.profile "$dotfiles_dir/tmp/.profile"
  echo "move ~/.profile to $dotfiles_dir/tmp/.profile"
fi

cp "$dotfiles_dir/source/.profile"

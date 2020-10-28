#!/bin/bash

# shellcheck disable=SC2164
readonly dotfiles_dir=$(cd "$(dirname "$0")/.."; pwd)

mkdir -p "$dotfiles_dir/tmp"

function overwrite() {
  local filename=$1

  if [ -f "$HOME/$filename" ]; then
    mv "$HOME/$filename" "$dotfiles_dir/tmp/$filename"
    echo "moved to $dotfiles_dir/tmp/$filename"
  fi

  cp "$dotfiles_dir/sources/$filename" "$HOME"
}

readonly filepathes="$dotfiles_dir/sources/"
# shellcheck disable=SC2162
while read -d $'\0' file; do
    overwrite "$(basename "$file")"
done < <(find "$filepathes" -mindepth 1 -maxdepth 1 -print0)

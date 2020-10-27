#!/bin/bash

readonly scripts_dir="$(dirname $0 | pwd)/scripts"

function exist_command() {
  local cmd=$1
  type "$cmd" > /dev/null 2>&1
}

function check_command() {
  local name=$1
  local true_name=$2
  local cmd=$3
  if ! (exist_command "$name") then
    if [ -n "$true_name" ]; then
      echo "install $true_name"
      brew install "$true_name"
    else
      echo "install $name"
      brew install "$name"
    fi
  fi
}

read -p "Overwrite dotfiles, ok? (y/n): " yn
case "$yn" in
  [yY]*)
    $scripts_dir/overwrite_sources.sh
  ;;
  *)
    echo "Suspends process."
    exit 1
  ;;
esac

if ! (exist_command brew) then
  echo "install brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

if ! (exist_command anyenv) then
  echo "install anyenv"
  brew install anyenv
  anyenv install --init
  anyenv install nodenv
  anyenv install rbenv
fi

check_command zsh

exec $SHELL -l
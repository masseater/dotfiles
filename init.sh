#!/bin/bash

readonly scripts_dir="$(dirname $0 | pwd)/scripts"

function exist_command() {
  local cmd=$1
  type "$cmd" > /dev/null 2>&1
}

function check_command() {
  local name=$1
  local true_name=$2
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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" < /dev/null
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

if ! (exist_command anyenv) then
  echo "install anyenv"
  brew install anyenv
  anyenv install --init
  anyenv install nodenv
  anyenv install rbenv
fi

check_command zsh
check_command thefuck

if [ "$ZSH" != "$HOME/.oh-my-zsh" ]; then
  yes | (curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh)
  sed -i "1isource $HOME/.profile\n" "$HOME/.zshrc"
fi

exec $SHELL -l
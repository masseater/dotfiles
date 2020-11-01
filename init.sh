#!/bin/bash

readonly scripts_dir="$(dirname $0 | pwd)/scripts"
source $scripts_dir/_lib.sh

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

if ! (exist_command brew); then
  echo "install brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" </dev/null
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

if ! (exist_command anyenv); then
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
  sed -i '1isource '$HOME'/.profile\n' $HOME/.zshrc
  sed -i -e '/^plugins/d' $HOME/.zshrc
fi

echo "exec '$SHELL' -l"

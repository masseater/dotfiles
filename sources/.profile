#!/bin/bash

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ] ; then
  PATH="$HOME/.cargo/bin:$PATH"
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(thefuck --alias)"
eval "$(anyenv init -)"

function echo_path() {
  echo "${PATH}" | tr ':' '\n'
}

# shellcheck disable=SC2034
plugins=(
  alias-finder
  command-not-found
  common-aliases
  docker
  docker-compose
  git
  git-auto-fetch
  git-flow
  gitfast
  github
  gitignore
  node
  npm
  python
  rails
  rust
  thefuck
  yarn
)
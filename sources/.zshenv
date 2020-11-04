#!/bin/bash

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ]; then
  PATH="$HOME/.cargo/bin:$PATH"
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(thefuck --alias)"
eval "$(anyenv init -)"

# shellcheck disable=SC2034
plugins=(
  alias-finder
  brew
  bundler
  command-not-found
  common-aliases
  docker
  docker-compose
  git
  git-auto-fetch
  git-flow
  git-hubflow
  gitfast
  github
  gitignore
  node
  npm
  python
  rails
  ruby
  rust
  thefuck
  yarn
  zsh-completions
)

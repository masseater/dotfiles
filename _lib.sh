function exist_command() {
  local cmd=$1
  type "$cmd" >/dev/null 2>&1
}

function check_command() {
  local name=$1
  local true_name=$2
  if ! (exist_command "$name"); then
    if [ -n "$true_name" ]; then
      echo "install $true_name"
      brew install "$true_name"
    else
      echo "install $name"
      brew install "$name"
    fi
  fi
}

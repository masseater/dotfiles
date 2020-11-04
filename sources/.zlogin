function echo_path() {
    echo "${PATH}" | tr ':' '\n'
}

function gswcon() {
    local branch=$1
    git switch -c $branch origin/$branch
}

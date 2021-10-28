#! /bin/bash

stacks=(vimfiles git-parallel git-gh-diff-url t git-repl gemini docker-repl great-thing tmux-powerline)

mkdir -p "${HOME}/git"

print::exec() {
    echo "$@" && $@
}

for x in ${stacks[@]}; do
    if [[ ! -d "${HOME}/git/${x}" ]];then
        echo cloning "${x}" ...
        echo
        print::exec git clone "git@github.com:magicdrive/${x}" "${HOME}/git/${x}"
        echo
        echo
        echo
    fi
done

exit 0

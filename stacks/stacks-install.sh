#! /bin/bash

stacks=(git-parallel git-gh-diff-url t git-repl gemini docker-repl parasoul)

mkdir -p "${HOME}/git"

print::exec() {
    echo "$@" && $@
}

for x in ${stacks[@]}; do
    if [[ -d "${HOME}/git/${x}" ]];then
        echo installing "${x}" ...
        echo
        print::exec pushd "${HOME}/git/${x}"
        print::exec make install
        print::exec popd
        echo
        echo
        echo
    fi
done

exit 0

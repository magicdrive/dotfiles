#! /bin/bash

set -eu

print::exec() {
    echo "$@" && $@
}

print::exec git clone "git@github.com:magicdrive/vimfiles" "${HOME}/git/vimfiles"
pushd "${HOME}/git/vimfiles"

print::exec ./install.sh
popd

exit

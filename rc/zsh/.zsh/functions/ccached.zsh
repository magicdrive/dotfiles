#! /usr/bin/env zsh

#
# ccached
#   ccache on:off 
#

__ccache_switch() {
    local switch=$1
    case "${switch}" in
        off )
            unset CC
            unset CXX
            ;;
        gcc )
            export CC="ccache gcc"
            export CXX="ccache g++"
            ;;
        clang )
            export CC="ccache clang"
            export CXX="ccache clang++"
            ;;
        show )
            ;;
        * )
            cat << EOS
usage: ccached [--help|-h] [off|gcc|clang|env]

ccached commands are:
    gcc    set CC and CXX ccache with gcc
    clang  set CC and CXX ccache with clang
    off    unset CC and CXX
    show   show CC and CXX args

EOS
            return;
            ;;
    esac
    echo "CC=${CC}"
    echo "CXX=${CXX}"
}

alias ccd="__ccache_switch"


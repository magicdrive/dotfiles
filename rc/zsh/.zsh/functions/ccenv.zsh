#! /usr/bin/env zsh

#
# cc dispatcher
#

__cc_switch() {
    local switch=$1
    case "${switch}" in
        off )
            unset CC
            unset CXX
            ;;
        gcc)
            export CC="gcc"
            export CXX="g++"
            ;;
        clang)
            export CC="clang"
            export CXX="clang++"
            ;;
        ccache-gcc )
            export CC="ccache gcc"
            export CXX="ccache g++"
            ;;
        ccache-clang )
            export CC="ccache clang"
            export CXX="ccache clang++"
            ;;
        show )
            ;;
        * )
            cat << EOS
usage: ccenv [--help|-h] [off|gcc|clang|env]

ccached commands are:
    gcc           set CC and CXX gcc
    clang         set CC and CXX clang
    ccache-gcc    set CC and CXX ccache with gcc
    ccache-clang  set CC and CXX ccache with clang
    off           unset CC and CXX
    show          show CC and CXX args
EOS
            return;
            ;;
    esac
    echo "CC=${CC}"
    echo "CXX=${CXX}"
}

alias ccenv="__cc_switch"


#! /usr/bin/env bash

set -e

mkdir -p ~/projects/gocode/src
mkdir -p ~/.gopath ~/.gopath/src ~/.gopath/bin ~/.gopath/pkg

go get -u github.com/nsf/gocode
go get -u github.com/pilu/fresh
go get -u github.com/mattn/goreman

#echo gox -build-toolchain
#sudo GOROOT="$GOROOT" GOPATH="$GOPATH" PATH="$PATH" "$(which gox)" -build-toolchain

echo complete!


exit 0

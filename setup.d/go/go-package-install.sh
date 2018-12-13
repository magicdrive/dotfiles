#! /usr/bin/env bash

set -e

mkdir -p ~/projects/gocode/src
mkdir -p ~/.gopath ~/.gopath/src ~/.gopath/bin ~/.gopath/pkg

go get -u github.com/nsf/gocode
go get -u github.com/motemen/ghq
go get -u github.com/tools/godep
go get -u github.com/golang/lint
go get -u github.com/zimbatm/direnv
#go get -u github.com/mitchellh/gox
go get -u github.com/pilu/fresh
go get -u github.com/mattn/goreman
go get -u github.com/peco/peco/cmd/peco
go get -u github.com/cespare/reflex

#echo gox -build-toolchain
#sudo GOROOT="$GOROOT" GOPATH="$GOPATH" PATH="$PATH" "$(which gox)" -build-toolchain

echo complete!


exit 0

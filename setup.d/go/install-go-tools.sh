#! /bin/bash

set -e

mkdir -p ~/projects/gocode/src
mkdir -p ~/.gopath ~/.gopath/src ~/.gopath/bin ~/.gopath/pkg

export GO111MODULE=on

go clean --modcache

go install "github.com/magicdrive/kirke@latest"
go install "golang.org/x/tools/gopls@latest"
go install "github.com/nsf/gocode@latest"
go install "github.com/pilu/fresh@latest"
go install "github.com/mattn/goreman@latest"


echo complete!


exit 0

#! /usr/bin/env bash

set -e

go get -u code.google.com/p/go.tools/cmd/goimports
go get -u github.com/nsf/gocode
go get -u github.com/jingweno/gotask
go get -u tools/godep

exit 0;

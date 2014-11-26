#! /usr/bin/env bash

set -e

go get -u code.google.com/p/go.tools/cmd/goimports
go get -u github.com/nsf/gocode
go get -u github.com/jingweno/gotask
go get -u github.com/motemen/ghq
go get -u github.com/tools/godep
go get -u bitbucket.org/ymotongpoo/goenv

# goenv
cp ${GOPATH}/src/bitbucket.org/ymotongpoo/goenv/shellscripts/goenvwrapper.sh ${GOPATH}/bin/

exit 0;

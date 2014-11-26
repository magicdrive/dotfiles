#! /usr/bin/env bash

set -e

go get -u code.google.com/p/go.tools/cmd/goimports
go get -u github.com/nsf/gocode
go get -u github.com/motemen/ghq
go get -u github.com/tools/godep
go get -u github.com/golang/lint
go get -u github.com/zimbatm/direnv
go get -u bitbucket.org/ymotongpoo/goenv


# goenv
cp ${GOPATH}/src/bitbucket.org/ymotongpoo/goenv/shellscripts/goenvwrapper.sh ${GOPATH}/bin/

cat << 'STRING'
Packeges install complete.
Run the following command to activate the goof/goenv is!

    source $(which goenvwrapper.sh)

enjoy!

STRING

exit 0

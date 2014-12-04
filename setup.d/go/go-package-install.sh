#! /usr/bin/env bash

set -e

mkdir -p projects/gocode/src
mkdir -p .gopath .gopath/src

go get -u code.google.com/p/go.tools/cmd/goimports
go get -u github.com/nsf/gocode
go get -u github.com/motemen/ghq
go get -u github.com/tools/godep
go get -u github.com/golang/lint
go get -u github.com/zimbatm/direnv
go get -u bitbucket.org/ymotongpoo/goenv
go get -u github.com/mitchellh/gox

echo gox -build-toolchain
sudo GOROOT=$GOROOT GOPATH=$GOPATH PATH=$PATH $(which gox) -build-toolchain

# goenv
echo cp ~/.gopath/src/bitbucket.org/ymotongpoo/goenv/shellscripts/goenvwrapper.sh ~/.gopath/src/bin/
cp cp ~/.gopath/src/bitbucket.org/ymotongpoo/goenv/shellscripts/goenvwrapper.sh ~/.gopath/src/bin/

echo complete!

##cat << 'STRING'
##Packeges install complete.
##Run the following command to activate the goof/goenv is!
##
##    source $(which goenvwrapper.sh)
##
##enjoy!
##
##STRING

exit 0

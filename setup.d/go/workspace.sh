#! /usr/bin/env bash

mkdir -p  ~/projects/gopath ~/projects/gopath/src ~/projects/gopath/bin ~/projects/gopath/pkg
mkdir -p  ~/dev/gopath ~/dev/gopath/src ~/dev/gopath/bin ~/dev/gopath/pkg

cp -a ./envrc_sample.bash ~/project/gopath/.envrc
cp -a ./envrc_sample.bash ~/dev/gopath/.envrc

exit 0;

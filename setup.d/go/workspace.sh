#! /usr/bin/env bash

set -ue

mkdir -p  ~/projects/gopath ~/projects/gopath/src ~/projects/gopath/bin ~/projects/gopath/pkg
mkdir -p  ~/dev/gopath ~/dev/gopath/src ~/dev/gopath/bin ~/dev/gopath/pkg

cp -a ./envrc_sample.bash ~/projects/gopath/.envrc
cp -a ./envrc_sample.bash ~/dev/gopath/.envrc

exit 0;

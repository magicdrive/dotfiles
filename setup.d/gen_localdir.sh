#! /bin/bash

cd ${HOME};

mkdir -p bin git etc tmp misc local
mkdir -p dev/git dev/sand-box

for x in $(seq 9);do
    mkdir -p share/man/man${x}
done;

exit 0;

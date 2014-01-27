#! /bin/bash

cd ${HOME};

mkdir -p git tmp misc local
mkdir -p dev/git dev/sand-box dev/misc

for x in $(seq 9);do
    mkdir -p share/man/man${x}
done;

exit 0;

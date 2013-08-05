#! /bin/sh

cd ${HOME};


mkdir -p bin git etc tmp misc

for x in "c cpp gosh js scala ruby perl python shell";do
    mkdir -p dev/${s}
done

for x in $(seq 9);do
    mkdir -p share/man/man${x}
done;

exit 0;

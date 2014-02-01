#! /bin/bash

cd ${HOME};

mkdir -p git tmp misc local
mkdir -p dev/git dev/sand-box dev/misc

if [ "$(uname -s)" = 'Darwin' ];then
  mkdir -p dev/WorkSpace dev/sand-box dev/XCode
fi

mkdir -p local/bin
for x in $(seq 9);do
  mkdir -p local/share/man/man${x}
done;

exit 0;

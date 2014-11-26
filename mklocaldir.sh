#! /bin/bash

cd ${HOME};

mkdir -p git tmp misc local opt/dist
mkdir -p dev/git dev/sand-box dev/misc
mkdir -p ws/git ws/sand-box ws/misc
mkdir -p projects/git projects/sand-box projects/misc
mkdir -p  projects/go projects/go/src projects/go/bin projects/go/pkg

if [ "$(uname -s)" = 'Darwin' ];then
  mkdir -p dev/WorkSpace dev/sand-box dev/XCode
fi

if [ "$(uname -s)" = 'Darwin' ];then
  mkdir -p ws/WorkSpace ws/sand-box ws/XCode
fi

if [ "$(uname -s)" = 'Darwin' ];then
  mkdir -p projects/WorkSpace projects/sand-box projects/XCode
fi

mkdir -p local/bin
for x in $(seq 9);do
  mkdir -p local/share/man/man${x}
done;

exit 0;

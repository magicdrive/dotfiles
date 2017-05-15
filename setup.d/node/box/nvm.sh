#! /bin/bash

git clone git://github.com/creationix/nvm.git ~/.nvm
ln -sfn ~/.nvm ~/git/nvm

source ~/.nvm/nvm.sh

exec $SHELL -l


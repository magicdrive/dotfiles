#! /bin/bash

git clone git://github.com/creationix/nvm.git ~/git/nvm
ln -sfn ~/git/nvm ~/.nvm

source ~/.nvm/nvm.sh

exec $SHELL -l

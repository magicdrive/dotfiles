#! /bin/bash

#
# install devtools from github.com
#

libs=('vimfiles' 'tmux-powerline');

for x in ${libs[@]}; do
    git clone git@github.com:magicdrive/$x $HOME/git/$x;
done;


### setup vim
cd ~/git/vimfiles/
./setup.sh



exit 0;


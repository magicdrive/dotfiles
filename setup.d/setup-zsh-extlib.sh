#! /bin/bash

#
# install zsh-extended
#

libs=('zsh-completions' 'zsh-syntax-highlighting');

for x in ${libs[@]};
do
    git clone git://github.com/zsh-users/$x $HOME/git/$x;
done;

exit 0;

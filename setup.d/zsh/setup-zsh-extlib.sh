#! /bin/bash

#
# install zsh-extended
#

libs=('zsh-completions' 'zsh-syntax-highlighting');

for x in ${libs[@]}; do git clone git://github.com/zsh-users/$x $HOME/git/$x; done;

# z
git clone git@github.com:rupa/z.git $HOME/git/z
mkdir -p $HOME/local/share/man/man1/
sudo ln -sf $HOME/git/z/z.1 $HOME/local/share/man/man1/

#git clone git@github.com:magicdrive/zsh-vcs-prompt $HOME/git/zsh-vcs-prompt

exit 0;

#! /bin/bash

#
# install zsh-extended
#

libs=('zsh-completions' 'zsh-syntax-highlighting' 'zsh-autosuggestions');

for x in ${libs[@]}; do git clone https://github.com/zsh-users/$x $HOME/git/$x; done;
    https://github.com/rupa/z.git

# z
git clone https://github.com/rupa/z.git $HOME/git/z
mkdir -p $HOME/local/share/man/man1/
sudo ln -sf $HOME/git/z/z.1 $HOME/local/share/man/man1/

#git clone git@github.com:magicdrive/zsh-vcs-prompt $HOME/git/zsh-vcs-prompt

exit 0;

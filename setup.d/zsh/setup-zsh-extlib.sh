#! /bin/bash

#
# install zsh-extended
#

libs=('zsh-completions' 'zsh-syntax-highlighting');

for x in ${libs[@]}; do git clone git://github.com/zsh-users/$x $HOME/git/$x; done;

# z
git clone git://github.com/knu/z.git $HOME/git/z
sudo ln -sf $HOME/git/z/z.1 /usr/local/share/man/man1/

git clone git://github.com/yonchu/grunt-zsh-completion.git $HOME/git/grunt-zsh-completion

exit 0;

#! /bin/bash

git clone git://github.com/yyuu/pyenv.git ~/git/pyenv
ln -sfn ~/git/pyenv ~/.pyenv


# install plugins
pushd ~/git/pyenv/plugins
git clone git://github.com/yyuu/pyenv-virtualenv.git
git clone git://github.com/yyuu/pyenv-pip-rehash.git
popd



exec $SHELL -l

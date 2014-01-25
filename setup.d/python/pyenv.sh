#! /bin/bash

git clone git://github.com/yyuu/pyenv.git ~/git/pyenv
ln -sf ~/git/pyenv ~/.pyenv

pushd ~/git/pyenv/plugins
git clone git://github.com/yyuu/pyenv-virtualenv.git
popd



exec $SHELL -l

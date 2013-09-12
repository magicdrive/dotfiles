#! /bin/sh


set -e
current=$(cd $( dirname $0 ) && pwd)

${current}/conf.sh
cp -af ${current}/git-vim-plugin-update $HOME/bin
cp -af ${current}/git-author-def $HOME/bin

exit 0;

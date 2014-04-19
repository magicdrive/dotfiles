#! /bin/sh


set -e
current=$(cd $( dirname $0 ) && pwd)

${current}/conf.sh
cp -af ${current}/git-vim-plugin-update $HOME/local/bin
cp -af ${current}/git-author-def $HOME/local/bin

git author-def -g

exit 0;

#! /bin/sh


set -e
current=$(cd $( dirname $0 ) && pwd)

${current}/git-conf.sh
cp -af ${current}/git-author-def $HOME/local/bin
cp -af ${current}/git-gen-keepfile $HOME/local/bin

git author-def -g

exit 0;

#! /bin/sh


set -e
current=$(cd $( dirname $0 ) && pwd)

git config --global core.quotepath false

${current}/git-conf.sh
cp -af ${current}/bits/git-* $HOME/local/bin


if [ "$1" = "--setup" ];then
    git author-def -g
fi

exit 0;

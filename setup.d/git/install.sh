#! /bin/sh


set -e
current=$(cd $( dirname $0 ) && pwd)

${current}/git-conf.sh
cp -af ${current}/git-author-def $HOME/local/bin
cp -af ${current}/git-keepfile $HOME/local/bin
cp -af ${current}/git-logf $HOME/local/bin
cp -af ${current}/git-addf $HOME/local/bin
cp -af ${current}/git-ignore $HOME/local/bin
cp -af ${current}/git-refs $HOME/local/bin


if [ "$1" = "--setup" ];then
    git author-def -g
fi

exit 0;

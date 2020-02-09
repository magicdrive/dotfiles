#! /bin/sh


set -e
current=$(cd $( dirname $0 ) && pwd)

git config --global core.quotepath false

${current}/git-conf.sh
cp -af ${current}/bits/git-author-def $HOME/local/bin
cp -af ${current}/bits/git-keepfile $HOME/local/bin
cp -af ${current}/bits/git-logf $HOME/local/bin
cp -af ${current}/bits/git-addf $HOME/local/bin
cp -af ${current}/bits/git-ignore $HOME/local/bin
cp -af ${current}/bits/git-refs $HOME/local/bin


if [ "$1" = "--setup" ];then
    git author-def -g
fi

exit 0;

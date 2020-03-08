#! /bin/bash

git config --global color.ui    true

git config --global core.preloadindex true
git config --global core.fscache true
git config --global gc.auto 256

git config --global push.default tracking

git config --global core.pager 'less -FRX'

git config --global alias.fork  'clone --bare'

git config --global alias.st  '-p status'
git config --global alias.ss  '-p status -sb'
git config --global alias.co   checkout
git config --global alias.cl   'clone --recursive'
git config --global alias.ci  'commit -v'
git config --global alias.ca  'commit -av'
git config --global alias.cam 'commit --amend -v'

git config --global alias.psh push
git config --global alias.pul pull

git config --global alias.parallel-pull 'parallel -c -j 4 -e "pull --rebase"'
git config --global alias.multiple-pull 'parallel -c -j 4 -e "pull --rebase"'

git config --global alias.sb   show-branch
git config --global alias.sba  'show-branch --all'
git config --global alias.cfm  '!git sb && git br && git st'

git config --global alias.di   diff
git config --global alias.dc  'diff --cached'

git config --global alias.br   branch
git config --global alias.cb  'checkout -b'
git config --global alias.sw   checkout

git config --global alias.lf   ls-files

git config --global alias.mup   'submodule update --init --recursive'
git config --global alias.madd  'submodule add'
git config --global alias.mst   '-p submodule status --recursive'
git config --global alias.msync 'submodule sync'
git config --global alias.meach 'submodule each'
git config --global alias.mclean "\!sh -c 'git submodule foreach \"git clean \$@\"' ."
git config --global alias.mff   "\!sh -c 'for d in \"\${@-.}\"; do (cd \"\$d\" && [ -f .git ] && git fetch && git checkout origin); done' ."

git config --global alias.um  "\!sh -c 'git pull \"\$@\" && git mup' ."
git config --global alias.up  '!git um --rebase'

git config --global diff.wordRegex "$(printf '[@$%%]*[[:alnum:]_]+|[^\n]')"
git config --global alias.wdi 'diff --word-diff'
git config --global alias.wdc 'diff --word-diff --cached'

git config --global alias.au  'add -u'

git config --global alias.ri  'rebase -i'
git config --global alias.rio 'rebase -i origin'
git config --global alias.rim 'rebase -i master'
git config --global alias.rc  'rebase --continue'
git config --global alias.rab 'rebase --abort'
git config --global alias.rs  'rebase --skip'
git config --global alias.mab 'merge --abort'
git config --global alias.chp cherry-pick
git config --global alias.mt  'mergetool -t'
git config --global alias.mtv 'mergetool -t vimdiff'

git config --global alias.unadd    'reset --'
git config --global alias.rollback 'reset HEAD^ --'
git config --global alias.unci     'reset --soft HEAD^'
git config --global alias.hreset   'reset --hard'

git config --global alias.ap   'add -p'
git config --global alias.unap 'reset -p'
git config --global alias.cop  'checkout -p'

git config --global alias.l     'log --decorate --numstat --summary'
git config --global alias.ll    'log --decorate --numstat --summary --pretty=fuller -p'
git config --global alias.wll   'log --decorate --numstat --summary --pretty=fuller -p --word-diff'
git config --global alias.ol    'log --oneline --decorate'
git config --global alias.t     'log --graph --oneline --decorate'
git config --global alias.graph 'log --graph --all --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'

git config --global alias.g    grep

git config --global alias.xl  'stash list'
git config --global alias.xi  'stash save'
git config --global alias.xo  'stash pop'
git config --global alias.xd  'stash drop'
git config --global alias.xa  'stash apply'
git config --global alias.xs  'stash show'
git config --global alias.xp  'stash show -p'
git config --global alias.xup '!git xi && git up && git xo'

git config --global alias.www  browse-remote


#! /bin/bash

installdir=~/git/rbenv


mkdir -p ${installdir}
### rbenv
git clone https://github.com/sstephenson/rbenv.git ${installdir}

ln -sfn ${installdir} ~/.rbenv

### plugins
mkdir -p ${installdir}/plugins
git clone https://github.com/sstephenson/ruby-build.git ${installdir}/plugins/ruby-build
git clone https://github.com/ryansouza/rbenv-rehash.git ${installdir}/plugins/rbenv-rehash
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ${installdir}/plugins/rbenv-gem-rehash
git clone https://github.com/ianheggie/rbenv-binstubs.git ${installdir}/plugins/rbenv-binstubs

exec $SHELL -l


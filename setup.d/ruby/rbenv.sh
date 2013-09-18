#! /bin/bash

installdir=~/git/rbenv

### rbenv
git clone git://github.com/sstephenson/rbenv.git ${installdir}

ln -s ${installdir} ~/.rbenv

### plugins
mkdir -p ${installdir}/plugins
git clone git://github.com/sstephenson/ruby-build.git ${installdir}/plugins/ruby-build
git clone git://github.com/jamis/rbenv-gemset.git ${installdir}/plugins/rbenv-gemset
git clone git://github.com/ryansouza/rbenv-rehash.git ${installdir}/plugins/rbenv-rehash
git clone git://github.com/sstephenson/rbenv-gem-rehash.git ${installdir}/plugins/rbenv-gem-rehash


exec $SHELL -l

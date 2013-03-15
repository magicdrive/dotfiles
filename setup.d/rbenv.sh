#! /bin/bash

### rbenv
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv

### plugins
mkdir -p ~/.rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone git://github.com/jamis/rbenv-gemset.git ~/.rbenv/plugins/rbenv-gemset

exit 0;

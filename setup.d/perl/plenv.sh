#! /bin/bash

git clone git://github.com/tokuhirom/plenv.git ~/git/plenv
ln -sf ~/git/plenv ~/.plenv

git clone git://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build


exec $SHELL -l


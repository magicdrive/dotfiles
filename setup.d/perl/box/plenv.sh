#! /bin/bash

git clone https://github.com/tokuhirom/plenv.git ~/git/plenv
ln -sfn ~/git/plenv ~/.plenv

git clone https://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build


exec $SHELL -l


#! /bin/bash


installdir=~/git/goenv


mkdir -p "${installdir}"
### goenv
git clone https://github.com/syndbg/goenv.git "${installdir}"

ln -sfn "${installdir}" ~/.goenv


exec $SHELL -l


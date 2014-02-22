#! /bin/bash

if [ "$(uname -s)" = "Darwin" ];then
  export LDFLAGS="-L/usr/X11/lib"
  export CFLAGS="-I/usr/X11/include -I/usr/X11/include/freetype2 -I/usr/X11/include/libpng12"
fi

pip2 install matplotlib
pip3 install matplotlib

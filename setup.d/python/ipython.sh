#! /bin/bash
set -e
if [ "$(uname -s)" = "Darwin" ];then
  export LDFLAGS="-L/usr/X11/lib"
  export CFLAGS="-I/usr/X11/include -I/usr/X11/include/freetype2 -I/usr/X11/include/libpng12"

elif [ "$(uname -s)" = "Linux" -a -f /etc/debian_version ];then
    sudo aptitude build-dep ipython -y
    sudo aptitude build-dep python-scipy -y
fi

#pip2 install matplotlib
pip3 install matplotlib
pip3 install ipython
pip3 install numpy
pip3 install scipy
pip3 install pillow

pip2 install matplotlib
pip2 install ipython
pip2 install numpy
pip2 install scipy
pip2 install pillow



pyenv rehash

exit 0

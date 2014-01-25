#! /bin/bash

pypis=('pyflakes' 'flake8')

for x in "${pypis[@]}";do
  pip2 install ${x}
  pip3 install ${x}
done

exit 0;

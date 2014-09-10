#! /bin/bash

set -ue

pypis=('flake8')
pypis2=('paver' 'sphinx')
pypis3=()

for x in "${pypis[@]}";do
  pip2 install ${x}
  pip3 install ${x}
done
for x in "${pypis2[@]}";do
  pip2 install ${x}
done
for x in "${pypis3[@]}";do
  pip3 install ${x}
done

exit 0;

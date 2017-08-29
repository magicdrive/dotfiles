#! /bin/bash

set -ue

pypis=('flake8' 'httpie' 'virtualenv' 'ansible')

for x in "${pypis[@]}";do
  pip install ${x}
done

exit 0;

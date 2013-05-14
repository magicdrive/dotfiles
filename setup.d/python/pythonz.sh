#! /bin/bash

curl -kL https://raw.github.com/saghul/pythonz/master/pythonz-install | bash

virtualenv_dir=~/.pythonz/tools
mkdir -p ${virtualenv_dir}
pushd ${virtualenv_dir}
curl -O https://raw.github.com/pypa/virtualenv/master/virtualenv.py

exit 0;

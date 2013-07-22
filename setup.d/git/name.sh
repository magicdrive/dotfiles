#! /bin/bash

#
# "$ git config name" wrapper
#

case $1 in
    local)
        rangename="local"
        range=""
        ;;
    *)
        rangename="global"
        range="--global"
        ;;
esac

echo "Please tell me, ${rangename} user.name:"
read name
git config --replace-all ${range} user.name "${name}"

echo "Please tell me, ${rangename} user.email:"
read email
git config --replace-all ${range} user.email "${email}"


exit 0;

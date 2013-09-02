#! /bin/sh

#
# setup cert.pem
#

[ $(uname) != 'Darwin' ] && exit 1

if [ ! $(which brew) ];then
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

brew install curl-ca-bundle
curl http://curl.haxx.se/ca/cacert.pem -o /usr/local/etc/openssl/cert.pem 

exit 0

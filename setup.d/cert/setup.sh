#! /bin/sh

#
# setup cert.pem
#

if [ $(uname -s) = 'Darwin' ];then
    if [ ! $(which brew) ];then
        ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
    fi
    brew install curl-ca-bundle
fi
mkdir -p /usr/local/etc/openssl/
certfile=/usr/local/etc/openssl/cert.pem
[ -e ${certfile} ] || curl http://curl.haxx.se/ca/cacert.pem -o ${certfile}

exit 0

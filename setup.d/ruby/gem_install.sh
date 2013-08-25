#! /bin/sh

# install gems

yes | gem i \
    bundler \
    rack \
    compass \
    rbenv-rehash \
    pry \
    pry-doc \
    pry-debugger \
    --no-ri --no-rdoc \
;

exit 0;

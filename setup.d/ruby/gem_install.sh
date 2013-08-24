#! /bin/sh

# install gems

yes | gem i \
    bundler \
    rack \
    rbenv-rehash \
    pry \
    pry-doc \
    pry-debugger \
    --no-ri --no-rdoc \
;

exit 0;

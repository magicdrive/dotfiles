#! /bin/sh

# install gems

yes | gem i \
    rbenv-rehash \
    bundle \
    pry \
    pry-debugger \
    --no-ri --no-rdoc \
;

exit 0;

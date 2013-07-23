#! /bin/sh

# install gems

yes | gem i \
    rbenv-rehash \
    bundle \
    pry \
    --no-ri --no-rdoc \
;

exit 0;

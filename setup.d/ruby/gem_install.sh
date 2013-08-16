#! /bin/sh

# install gems

yes | gem i bundler --pre --no-ri --no-rdoc;

yes | gem i \
    rack \
    rbenv-rehash \
    pry \
    pry-debugger \
    --no-ri --no-rdoc \
;

exit 0;

#! /bin/sh

# install gems

yes | gem i \
    bundler \
    rack \
    puma \
    god \
    zeus \
    sass \
    md2man \
    compass \
    rbenv-rehash \
    awesome_print \
    pry \
    pry-doc \
    pry-debugger \
    --no-ri --no-rdoc \
;

gem i refe2;
bitclust setup;

exit 0;

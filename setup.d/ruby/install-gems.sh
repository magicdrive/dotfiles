#! /bin/sh

# install gems

yes | gem i \
    bundler \
    rack \
    sass \
    md2man \
    compass \
    rbenv-rehash \
    awesome_print \
    cocoapods \
    pry \
    pry-doc \
    git-gems \
    --no-ri --no-rdoc \
;

exit 0;

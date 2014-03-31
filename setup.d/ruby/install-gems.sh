#! /bin/sh

# install gems

yes | gem i \
    bundler \
    rack \
    puma \
    god \
    sass \
    md2man \
    html2haml \
    html2slim \
    compass \
    rbenv-rehash \
    awesome_print \
    pry \
    pry-doc \
    pry-debugger \
    --no-ri --no-rdoc \
;

exit 0;

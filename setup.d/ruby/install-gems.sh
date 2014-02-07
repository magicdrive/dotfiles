#! /bin/sh

# install gems

yes | gem i \
    bundler \
    activesupport \
    parallel \
    rack \
    puma \
    god \
    sass \
    md2man \
    middleman \
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

gem i refe2;
bitclust setup;

exit 0;

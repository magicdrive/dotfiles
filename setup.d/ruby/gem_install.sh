#! /bin/sh

# install gems

yes | gem i \
    sass \
    compass \
    rbenv-rehash \
    nokogiri \
    pry \
    capistrano \
    capistrano-ext \
    capistrano_colors \
;

exit 0;

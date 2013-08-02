#! /bin/sh

#
# chef setup
#

#install gem
gem i chef --no-ri --no-rdoc

rehash

knife configure

gem knife-solo --no-ri --no-rdoc











exit 0;

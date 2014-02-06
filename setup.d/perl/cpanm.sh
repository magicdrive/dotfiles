#! /bin/sh

cpan App::cpanminus

#Devel::REPL
cat << EOS | xargs -P 4 -L 1 cpanm
Class::Inspector
Carton
Perl::Tidy
Plack
EOS
cpanm App::Ack

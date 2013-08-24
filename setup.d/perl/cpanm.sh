#! /bin/sh

cpan App::cpanminus

cat << EOS | xargs -P 4 -L 1 cpanm
Class::Inspector
Devel::REPL
Carton
App::Ack
Perl::Tidy
Plack
EOS

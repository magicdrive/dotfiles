#! /bin/sh

#Devel::REPL
cat << EOS | xargs -P 4 -L 1 cpanm
Class::Inspector
Carton
Perl::Tidy
Plack
File::Next
EOS
cpanm App::Ack



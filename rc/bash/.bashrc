export PATH=/opt/local/bin/:/opt/loval/sbin:$PATH

##export PS1="[\u@\h \w] \\$ "
#PS1="\h@\u:\w\$(__git_ps1) \$ "

source ~/.zsh/compfunction/git-completion.bash

export PS1="[\u@\h \W/\$(__git_ps1)] % "

alias vi="vim"
alias ls="ls -G"
alias la="ls -Ga"
alias lal="ls -la"
alias poweroff="sudo shutdown -h now"


#mysql
alias mysql="/usr/local/mysql/bin/mysql"

#java
alias java="java -Dfile.encoding=UTF-8"
alias javac="javac -J-Dfile.encoding=UTF-8"

#perl
alias cpam="cpanm"
alias podweb="podwebserver"
alias pdoc="perldoc"
alias pfunc="perldoc perlfunc"
alias perlbrew="~/perl5/perlbrew/bin/perlbrew"
source ~/perl5/perlbrew/etc/bashrc


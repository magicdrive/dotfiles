###
### env define
###

export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
export LANG='en_US.UTF-8'

# editor
export EDITOR=vim

#less color
export LESS='-R'

#PAGER
export PAGER='less'
export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH:"

#Android 
if [ $(uname -s) = 'Darwin' ];then
    export ANDROID_SDK_ROOT=/Applications/android-sdk-macosx
    export ANDROID_HOME=/Applications/android-sdk-macosx
    export ANDROID_NDK_HOME=/usr/local/opt/android-ndk
fi

# tmux
if [ $(uname -s) = 'Darwin' ];then
    export TMUXPLATFORM='mac'
else
    export TMUXPLATFORM='linux'
fi
export TMUX_DEFAULTNAME='main'

#java
if [ $(uname -s) = 'Darwin' ];then
    export JAVA_HOME="/Library/Java/Home"
else
    export JAVA_HOME="/usr/local/java/Home"
fi
export PATH="$JAVA_HOME/bin:$PATH:"

# perl
# perlbrew
export PERLBREW_HOME=$HOME/perl5/perlbrew
if [ -d ${PERLBREW_HOME} ]; then
    export PATH="${PERLBREW_HOME}/bin:$PATH"
    source ${PERLBREW_HOME}/etc/bashrc
fi

# python
# pythonbrew
export PYTHONBREW_HOME=$HOME/.pythonbrew
if [ -d ${PERLBREW_HOME} ]; then
    source ~/.pythonbrew/etc/bashrc
fi

# node.js
# nvm
if [ -f ~/.nvm/nvm.sh ]; then
    source ~/.nvm/nvm.sh
fi

#__END__

###
### env define
###

export PATH="$HOME/local/bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH:"
export MANPATH="$HOME/local/share/man:$HOME/share/man:$(find /usr/local -regex '^[a-zA-Z0-9_-/\.]*man$' -type d 2>/dev/null | perl -pe 's/[\r\n]/:/'):$MANPATH"

[ -e /usr/local/mysql ] && export PATH=/usr/local/mysql/bin:$PATH
[ -e /usr/local/nginx ] && export PATH=/usr/local/nginx/sbin:$PATH
[ -e /usr/local/monit ] && export PATH=/usr/local/monit/bin:$PATH

### laguage
export LANG='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# EDITOR
export EDITOR=vim

#PAGER
export PAGER='less'
export LESS='-R'
if [ $(uname -s) = 'Darwin' ];then
    lesspipe_sh=/usr/local/bin/src-hilite-lesspipe.sh
else
    lesspipe_sh=/usr/share/source-highlight/src-hilite-lesspipe.sh
fi
alias less_color="LESSOPEN=\"| ${lesspipe_sh} %s\" less"


# Android
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

### java
if [ $(uname -s) = 'Darwin' ];then
    export JAVA_HOME="/Library/Java/Home"
else
    export JAVA_HOME="/usr/local/java/Home"
fi
export PATH="$JAVA_HOME/bin:$PATH:"
export MANPATH="${JAVA_HOME}/man:$MANPATH"

### scala
export PLAY_VERSION=2.1.0
if [ -d $HOME/.play-${PLAY_VERSION} ];then
    export PATH=$PATH:$HOME/.play-${PLAY_VERSION}
fi
if [ -d /usr/local/scala ];then
    export SCALA_HOME="/usr/local/scala/Home"
    export PATH="${SCALA_HOME}/bin:${PATH}:"
    export MANPATH="${SCALA_HOME}/man:$MANPATH"
fi

### groovy
if [ -d /usr/local/groovy ];then
    export GROOVY_HOME="/usr/local/groovy/Home"
    export PATH="${GROOVY_HOME}/bin:${PATH}:"
    export MANPATH="${GROOVY_HOME}/man:$MANPATH"
fi

### golang
if [ -d /usr/local/go ];then
    export GOROOT="/usr/local/go"
    export GOPATH="${HOME}/.gopath"
    export PATH="${GOROOT}/bin:${GOPATH}/bin:${PATH}"
fi

### perl
# perlbrew
export PERLBREW_HOME=$HOME/perl5/perlbrew
if [ -f ${PERLBREW_HOME}/etc/bashrc ]; then
    export PATH="${PERLBREW_HOME}/bin:$PATH"
    source ${PERLBREW_HOME}/etc/bashrc
fi

### python
# pythonz
export PYTHONZ_HOME=$HOME/.pythonz
if [ -d ${PYTHONZ_HOME} ]; then
    source ~/.pythonz/etc/bashrc
fi
# virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

### ruby
#rbenv
export RBENV_ROOT=$HOME/.rbenv
if [ -d ${RBENV_ROOT} ];then
    export PATH="$RBENV_ROOT/shims:$RBENV_ROOT/bin:$PATH"
    eval "$(rbenv init - zsh)"
fi
#mruby
export MRUBY_ROOT=$HOME/git/mruby
if [ -d ${MRUBY_ROOT} ];then
    export PATH="$MRUBY_ROOT/bin:$PATH"
fi

# node.js
# nvm
if [ -f ~/.nvm/nvm.sh ]; then
    source ~/.nvm/nvm.sh
fi

### llvm
export LLVM_HOME=/usr/local/llvm
if [ -e ${LLVM_HOME} ];then
    export PATH="${LLVM_HOME}/bin:$PATH"
    export MANPATH="${LLVM_HOME}/share/man:$MANPATH"
fi

# erlang
export ERLANG_HOME=/usr/local/erlang
if [ -e ${ERLANG_HOME} ];then
    export PATH="${ERLANG_HOME}/bin:$PATH"
    export MANPATH="${ERLANG_HOME}/share/man:$MANPATH"

fi

#__END__

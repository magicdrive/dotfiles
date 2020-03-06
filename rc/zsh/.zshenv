###
### env define
###


if [ "$(uname -s)" != 'Darwin' ];then
    setopt no_global_rcs
fi

export CORE_PATH="$HOME/local/bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/local/ssl/bin:/usr/bin:/sbin:/bin:/sbin"
export PATH="$CORE_PATH"
export MANPATH="$HOME/local/share/man:$HOME/share/man:$(
    find /usr/local -path "/usr/local/rbenv" -prune -regex '^[a-zA-Z0-9_-/\.]*man$' -type d 2>/dev/null | perl -pe 's/[\r\n]/:/'
):$MANPATH"

# nginx
[ -e "/usr/local/nginx" ] && export CORE_PATH=/usr/local/nginx/sbin:$CORE_PATH
# mysql
if [ -d "/usr/local/mysql" ];then
    export CORE_PATH=/usr/local/mysql/bin:$CORE_PATH
    if [ "$(uname -s)" = "Darwin" ];then
        export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:${DYLD_LIBRARY_PATH}
        alias mysql.server="sudo mysql.server"
    fi
fi
# opencv
if [ -e "$HOME/opt/opencv" ];then
    export CORE_PATH=$HOME/opt/opencv/bin:$CORE_PATH
    if [ "$(uname -s)" = "Darwin" ];then
        export DYLD_LIBRARY_PATH=$HOME/opt/opencv/lib:${DYLD_LIBRARY_PATH}
    fi
fi


### laguage
export LANG='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# EDITOR
export EDITOR=vim

#PAGER
export PAGER='less'
export LESS='-R'


if [ "$(uname -s)" = 'Darwin' ];then
    if [ -d "/Applications/VMware Fusion.app" ];then
        export VMWARE_FUSION_ROOT="/Applications/VMware Fusion.app"
        export CORE_PATH="${VMWARE_FUSION_ROOT}/Contents/Library:${CORE_PATH}"
    fi
fi

# tmux
if [ "$(uname -s)" = 'Darwin' ];then
    export TMUXPLATFORM='mac'
else
    export TMUXPLATFORM='linux'
fi
export TMUX_DEFAULTNAME='main'

### java
if [ "$(uname -s)" = 'Darwin' ];then
    export JAVA_HOME="/Library/Java/Home"
else
    export JAVA_HOME="/usr/java/default"
fi
if [ -e "${JAVA_HOME}" ];then
    export CORE_PATH="$JAVA_HOME/bin:$CORE_PATH:"
    export MANPATH="${JAVA_HOME}/man:$MANPATH"
fi

### scala
export SCALA_HOME="/opt/scala/default"
if [ -e "${SCALA_HOME}" ];then
    export CORE_PATH="${SCALA_HOME}/bin:${CORE_PATH}:"
    export MANPATH="${SCALA_HOME}/man:$MANPATH"
fi
# sbt
export SBT_HOME="/opt/sbt/default"
if [ -e "${SBT_HOME}" ];then
    export CORE_PATH="${SBT_HOME}/bin:${CORE_PATH}:"
fi

### groovy
export GROOVY_HOME="/opt/groovy"
if [ -e "${GROOVY_HOME}" ];then
    export CORE_PATH="${GROOVY_HOME}/bin:${CORE_PATH}:"
    export MANCORE_PATH="${GROOVY_HOME}/man:$MANCORE_PATH"
fi

### gradle
export GRADLE_HOME="/opt/gradle"
if [ -e "${GRADLE_HOME}" ];then
    export CORE_PATH="${GRADLE_HOME}/bin:${CORE_PATH}:"
    export MANCORE_PATH="${GRADLE_HOME}/man:$MANCORE_PATH"
fi

### nim
if [ -e "$HOME/opt/nim" ];then
    export NIMHOME="$HOME/opt/nim"
elif [ -e "/opt/nim" ];then
    export NIMHOME="/opt/nim"
fi
if [ -e "${NIMHOME}" ];then
    export PATH="${NIMHOME}/bin:$HOME/.nimble/bin:${PATH}"
fi

### golang
# goenv
export GOENV_ROOT="${HOME}/.goenv"
if [ -e "${GOENV_ROOT}" ]; then
    export GOENV_DISABLE_GOPATH=1
    export GOENV_GOPATH_PREFIX="$HOME/.gopath"
    export PATH="${GOENV_ROOT}/shims:${GOENV_ROOT}/bin:$PATH"
    export GOPATH="${HOME}/.gopath:${HOME}/projects/gocode"
    export CORE_PATH="${HOME}/.gopath/bin:${HOME}/projects/gocode/bin:${CORE_PATH}"
    eval "$("$GOENV_ROOT/bin/goenv" init -)"
fi


if [[ -x "$(which direnv)" ]];then
    eval "$(direnv hook zsh)"
fi


### perl
# plenv
export PLENV_ROOT="$HOME/.plenv"
if [ -e "${PLENV_ROOT}" ];then
    export PATH="$PLENV_ROOT/shims:$PLENV_ROOT/bin:$PATH"
    eval "$("$PLENV_ROOT/bin/plenv" init - zsh)"
fi

### python
#pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -e "${PYENV_ROOT}" ]; then
    export PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
    eval "$("$PYENV_ROOT/bin/pyenv" init -)"
fi

### ruby
#rbenv
if [ -e /usr/local/rbenv ];then
    export RBENV_ROOT=/usr/local/rbenv
elif [ -e $HOME/.rbenv ];then
    export RBENV_ROOT=$HOME/.rbenv
fi
if [ -e "${RBENV_ROOT}" ];then
    export PATH="$RBENV_ROOT/shims:$RBENV_ROOT/bin:$PATH"
    if [ "$(basename $SHELL)" = 'zsh' ];then
        eval "$("$RBENV_ROOT/bin/rbenv" init - zsh)"
    else
        eval "$("$RBENV_ROOT/bin/rbenv" init - )"
    fi
fi

if [ -e "/usr/local/ssl" ];then
    alias rbenv="RUBY_CONFIGURE_OPTS=--with-openssl-dir=/usr/local/ssl rbenv"
fi

# node.js
# nvm
export NVM_DIR="$HOME/.nvm"
if [ -e "$NVM_DIR/nvm.sh" ];then
    source "$NVM_DIR/nvm.sh"
fi

### llvm
export LLVM_HOME="/usr/local/llvm"
if [ -e ${LLVM_HOME} ];then
    export CORE_PATH="${LLVM_HOME}/bin:$CORE_PATH"
    export MAN_PATH="${LLVM_HOME}/share/man:$MANCORE_PATH"
fi

# erlang
export ERLANG_HOME="/opt/beamvm/erlang"
if [ -e ${ERLANG_HOME} ];then
    export CORE_PATH="${ERLANG_HOME}/bin:$CORE_PATH"
    export MANCORE_PATH="${ERLANG_HOME}/man:$MANCORE_PATH"
fi

# elixir
export ELIXIR_HOME="/opt/beamvm/elixir"
if [ -e ${ELIXIR_HOME} ];then
    export CORE_PATH="${ELIXIR_HOME}/bin:$CORE_PATH"
fi

# leiningen
export LEININGEN_HOME="$HOME/opt/leiningen"
if [ -e ${LEININGEN_HOME} ];then
    export CORE_PATH="${LEININGEN_HOME}/bin:$CORE_PATH"
fi

# clojure
export CLOJURE_HOME="/opt/clojure"
if [ -e ${CLOJURE_HOME} ];then
    export CORE_PATH="${CLOJURE_HOME}/bin:$CORE_PATH"
fi

# haxe
export HAXE_HOME="$HOME/opt/haxe"
if [ -e "${HAXE_HOME}" ];then
    export CORE_PATH="${HAXE_HOME}/build:$CORE_PATH"
    export HAXE_STD_PATH="${HAXE_HOME}/build/std:"
fi

# dlang
export DLANG_HOME="$HOME/opt/dmd2"
if [ -e "${DLANG_HOME}" ];then
    export CORE_PATH="${DLANG_HOME}/bin:$CORE_PATH"
fi

# rust
export CARGO_HOME="$HOME/.cargo"
if [ -e "${CARGO_HOME}" ];then
    source $HOME/.cargo/env
    export PATH="${CARGO_HOME}/bin:$PATH"
fi

# asdf
export ASDF_HOME="$HOME/.asdf"
if [ -e "${ASDF_HOME}" ];then
    source "${ASDF_HOME}/asdf.sh"
fi

# fzf
if [ -f ~/.fzf.zsh ];then
    if [ "$(basename $SHELL)" = 'zsh' ];then
        source ~/.fzf.zsh
    else
        source ~/.fzf.bash
    fi
fi


# path
NEPATH="" ;
for x in $(echo $PATH | perl -pe "s/::/:/g" | perl -pe 's/:/\n/g' | grep "$HOME/\..*" | sort | uniq); do
    export NEPATH="$x:$NEPATH";
done
export PATH="$NEPATH:$CORE_PATH"

# manpath
NEMANPATH="$MANPATH" ;
unset MANPATH
for x in $(echo $MANPATH | perl -pe "s/::/:/g" | perl -pe 's/:/\n/g' | sort | uniq); do
    export MANPATH="$x:$MANPATH";
done


#__END__
